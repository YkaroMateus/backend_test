import 'dart:io';
import 'parser_extension.dart';

class CustomEnv {
  static Map<String, String> _map = {};
  static String file = ".env";

  static Future<Type> get<Type>({required String key}) async {
    if (_map.isEmpty) await _load();
    // return _map[key];
    return _map[key]!.toType(Type);
  }

  static Future<void> _load() async {
    List<String> lines = (await _readFile()).split("\n");
    _map = {for (var line in lines) line.split("=")[0]: line.split("=")[1]};
    // EX: {"chave":"valor"}
  }

  static Future<String> _readFile() async {
    return await File(file).readAsString();
  }
}
