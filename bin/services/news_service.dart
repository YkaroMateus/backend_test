import '../models/news_model.dart';
import 'generic_services.dart';

import '../utils/list_extension.dart';

class NewsService implements GenericServices<NewsModel> {
  final List<NewsModel> _fakeDB = [];
  @override
  bool delete(int id) {
    _fakeDB.removeWhere((e) => e.id == id);
    return true;
  }

  @override
  List<NewsModel> findAll() {
    return _fakeDB;
  }

  @override
  NewsModel findOne(int id) {
    return _fakeDB.firstWhere((e) => e.id == id);
  }

  @override
  bool save(NewsModel value) {
    NewsModel? model = _fakeDB.firstWhereOrNull((e) => e.id == value.id);
    if (model == null) {
      _fakeDB.add(value);
    } else {
      var index = _fakeDB.indexOf(model);
      _fakeDB[index] = value;
    }

    return true;
  }
}
