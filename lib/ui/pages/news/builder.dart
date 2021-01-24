import 'package:filcnaplo/data/context/app.dart';
import 'package:filcnaplo/data/models/new.dart';
import 'package:filcnaplo/ui/pages/news/tile.dart';

class NewsBuilder {
  List<NewsTile> newsTiles = [];

  NewsBuilder();

  void build() {
    newsTiles = [];
    List<News> news = [];
    news = app.user.sync.news.data.where((n) => n.title != null).toList();
    news.forEach((n) => newsTiles.add(NewsTile(n)));
  }
}
