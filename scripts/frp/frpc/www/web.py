#!/usr/bin/env python
import sys
import web

urls = (
    '/', 'index'
)

class index:
    def GET(self):
        return "Hello, world!"

if __name__ == "__main__":
    sys.argv.append('0.0.0.0:80')
    app = web.application(urls, globals())
    app.run()
