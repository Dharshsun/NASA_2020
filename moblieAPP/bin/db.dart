import 'dart:async';
import 'dart:io';

final File file = File('fire1.jpg');
Future main() async {
  //bind to serverSocket
  HttpServer server = await HttpServer.bind('127.0.0.1', 8080);
  print('Listening on Localhost:${server.port}');

  await for (var req in server) {
    if (await file.exists()) {
      print("Serving ${file.path}");
      req.response.headers.contentType = ContentType.binary;
      await file.openRead().pipe(req.response);
    }
  }
}
