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


class BaseHandler( tornado.web.RequestHandler ):
    pass


class index( BaseHandler ):
    def get( self ):
        self.render( "index.html" )

class privacy( BaseHandler ):
    def get( self ):
        self.render( "privacy.html" )

class lesson1( BaseHandler ):
    def get( self ):
        noun = self.get_argument("noun",None)
        if noun:
            self.render( "lesson1.html", noun=noun )
        else:
            noun = db.get("SELECT * FROM ideas WHERE pos='noun' ORDER BY rand() LIMIT 1").text
            self.redirect( "/lesson1?noun=" + tornado.escape.url_escape(noun) )

class _404( BaseHandler ):
    def get( self ):
        self.render( "404.html" )
