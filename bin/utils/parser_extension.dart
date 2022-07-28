extension ParserExtension on String {
  toType(Type type) {
    switch (type) {
      case String:
        return toString();
      case int:
        return int.tryParse(toString()) ?? -1;
      default:
        return toString();
    }
  }
}
