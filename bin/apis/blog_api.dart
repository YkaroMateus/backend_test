import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/news_model.dart';
import '../services/generic_services.dart';

class BlogApi {
  final GenericServices<NewsModel> _service;
  BlogApi(this._service);

  Handler get handler {
    Router router = Router();
    // Listagem
    router.get("/blog/noticias", (Request request) {
      List<NewsModel> noticias = _service.findAll();
      List<Map> noticiasMap = noticias.map((e) => e.toJson()).toList();
      return Response.ok(
        jsonEncode(noticiasMap),
        headers: {"content-type": "application/json"},
      );
    });

    // Nova noticia
    router.post("/blog/noticias", (Request request) async {
      var body = await request.readAsString();
      _service.save(NewsModel.fromJson(jsonDecode(body)));
      return Response(201);
    });

    // /blog/noticias?id=1 >> update
    router.put("/blog/noticias", (Request request) {
      // _service.save('');
      String? id = request.url.queryParameters["id"];
      return Response.ok("Atualizado");
    });

    // /blog/noticias?id=1 >> delete
    router.delete("/blog/noticias", (Request request) {
      // _service.delete(1);
      String? id = request.url.queryParameters["id"];
      return Response.ok("");
    });

    return router;
  }
}
