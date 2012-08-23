import tornado.httpserver
import tornado.ioloop

def extract_features( request ):
    features = {}
    features['protocol'] = request.protocol
    features['host'] = request.host
    features['version'] = request.version
    features['path'] = request.path
    features['method'] = request.method
    features['remote_ip'] = request.remote_ip
    features['uri'] = request.uri
    for k,v in request.headers.items():
        features['headers.'+k] = v
    for k,vs in request.arguments.items():
        for v in vs:
            features['arguments.'+k] = v
    return features

def handle_request(request):
    features = extract_features(request)
    message = "You requested %s\n" % (features,)
    request.write("HTTP/1.1 200 OK\r\nContent-Length: %d\r\n\r\n%s" % (
        len(message), message))
    request.finish()

http_server = tornado.httpserver.HTTPServer(handle_request)
http_server.listen(8888)
tornado.ioloop.IOLoop.instance().start()
