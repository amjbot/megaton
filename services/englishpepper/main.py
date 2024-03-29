#!/usr/bin/env python

import controllers
import os.path
import tornado.web
import tornado.httpserver
import tornado.ioloop
import tornado.process
import sys

settings = dict(
   cookie_secret  = "w9mqcmh8chmvwh8vwnh8vh8nvwh8vhvqfhmvqmhqv",
   static_path    = os.path.join(os.path.dirname(__file__), "static"),
   template_path  = os.path.join(os.path.dirname(__file__), "views"),
   xsrf_cookies   = True
)

application = tornado.web.Application( [
    ( "^/",                          controllers.index         ),
    ( "^/privacy",                   controllers.privacy       ),
    ( "^/contact",                   controllers.contact       ),
    ( "^/explore",                   controllers.explore       ),
    ( "^/idea/(?P<id>[0-9]+)",       controllers.idea          ),
    ( "^/ideas",                     controllers.ideas         ),
    ( "^/sitemap.xml",               controllers.sitemap       ),
], **settings )


if __name__=="__main__":
    tornado.process.fork_processes(0)
    tornado.httpserver.HTTPServer(application, xheaders=True ).listen( 80 )
    tornado.ioloop.IOLoop.instance().start()
