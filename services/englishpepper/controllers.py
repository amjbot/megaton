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


db = tornado.database.Connection(host="localhost",user="root",database="englishpepper",password="root")


def external_resource( external_url ):
    ext_hash = md5.new()
    ext_hash.update( external_url )
    ext_hash = ext_hash.hexdigest()
    internal_url = "/static/external/" + ext_hash
    return internal_url


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
            self.redirect( "/idea/" + str(idea.id) )
        else:
            raise tornado.web.HTTPError(404)


class idea( tornado.web.RequestHandler ):
    def get( self, id ):
        pos = None
        lvl = None
        idea = db.get("SELECT * FROM ideas WHERE id=%s", id)
        if idea:
            idea.image = external_resource(idea.image)
            self.render( "idea.html", idea=idea, pos=pos, lvl=lvl )
        else:
            raise tornado.web.HTTPError(404)


class ideas( tornado.web.RequestHandler ):
    def get( self ):
        ideas = db.query("SELECT id,text FROM ideas ORDER BY text")
        self.render( "ideas.html", ideas=ideas )


class _404( tornado.web.RequestHandler ):
    def get( self ):
        self.render( "404.html" )
