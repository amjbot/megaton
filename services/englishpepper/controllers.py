import tornado.web
import tornado.database
import tornado.escape
import urllib
import md5
import random
import string
import logging
import sys
import simplejson as json
import subprocess
import os
import os.path


db = tornado.database.Connection(host="localhost",user="root",database="englishpepper",password="root")


class resource:
    __slots__ = ('internal_url','external_url')
    def __init__( self, internal_url, external_url ):
        self.internal_url = internal_url
        self.external_url = external_url
def external_resource( external_url ):
    ext_hash = md5.new()
    ext_hash.update( external_url )
    ext_hash = ext_hash.hexdigest()
    internal_url = "/static/external/" + ext_hash
    internal_path = os.path.join( os.path.dirname(__file__), internal_url[1:] )
    if not os.path.exists( internal_path ):
        subprocess.Popen(["curl",external_url,"-o",internal_path])
    return resource(internal_url,external_url)


class sitemap( tornado.web.RequestHandler ):
    def get( self ):
        ideas = db.query("select * from ideas")
        loc = [ ("http://www.englishpepper.com/idea/"+str(i.id)) for i in ideas ]
        loc.append( "http://www.englishpepper.com/" )
        loc.append( "http://www.englishpepper.com/privacy" )
        loc.append( "http://www.englishpepper.com/contact" )
        loc.append( "http://www.englishpepper.com/ideas" )
        self.render( "sitemap.xml", loc=loc )


class index( tornado.web.RequestHandler ):
    def get( self ):
        self.render( "index.html" )


class privacy( tornado.web.RequestHandler ):
    def get( self ):
        self.render( "privacy.html" )


class contact( tornado.web.RequestHandler ):
    def get( self ):
        self.render( "contact.html" )


class explore( tornado.web.RequestHandler ):
    def get( self ):
        pos = self.get_argument("pos", None)
        lvl = self.get_argument("lvl", None)
        idea = db.get("SELECT id FROM ideas WHERE (pos=%s OR %s IS NULL) AND (lvl=%s OR %s IS NULL) ORDER BY rand() LIMIT 1",
                      pos, pos, lvl, lvl)
        if idea:
            self.redirect( "/idea/" + str(idea.id) + "?" +
                         (("&pos="+pos) if pos else "") + 
                         (("&lvl="+lvl) if lvl else ""), status=303 )
        else:
            raise tornado.web.HTTPError(404)


class idea( tornado.web.RequestHandler ):
    def get( self, id ):
        pos = self.get_argument("pos",None)
        lvl = self.get_argument("lvl",None)
        idea = db.get("SELECT * FROM ideas WHERE id=%s AND (pos=%s OR %s IS NULL) AND (lvl=%s or %s IS NULL)",
                      id, pos, pos, lvl, lvl)
        if idea:
            idea.image = [ external_resource(i) for i in idea.image.split(';') if i ]
            idea.audio = [ external_resource(i) for i in idea.audio.split(';') if i ]
            self.render( "idea.html", idea=idea, pos=pos, lvl=lvl )
        else:
            raise tornado.web.HTTPError(404)


class ideas( tornado.web.RequestHandler ):
    def get( self ):
        ideas = db.query("SELECT id,text FROM ideas ORDER BY text")
        self.render( "ideas.html", ideas=ideas )

