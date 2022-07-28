import 'package:shelf/shelf.dart';

import 'apis/blog_api.dart';
import 'apis/login_api.dart';
import 'infrastructure/middleware_interception.dart';
import 'infrastructure/server_custom.dart';
import 'services/news_service.dart';

void main() async {
  var cascateHandler = Cascade().add(LoginApi().handler).add(BlogApi(NewsService()).handler).handler;
  var handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(MiddlewareInterception().middleware)
      .addHandler(cascateHandler);

  await ServerCustom().initialize(
    handler: handler,
    address: "localhost",
    port: 8280,
    // await CustomEnv.get<String>(key: "server_address"),
    // await CustomEnv.get<int>(key: "server_port"),
  );
}
