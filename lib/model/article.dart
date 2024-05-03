import 'dart:ffi';

import 'package:ezhuthukal_app/model/functions/articles.dart';

class Article {
  int id;
  int user;
  String title;
  String text;
  dynamic rating;
  DateTime date;
  dynamic articleImage;

  Article({
    required this.id,
    required this.user,
    required this.title,
    required this.text,
    required this.rating,
    required this.date,
    required this.articleImage,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["id"],
        user: json["user"],
        title: json["title"],
        text: json["text"],
        rating: json["rating"],
        date: DateTime.parse(json["date"]),
        articleImage: json["article_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "title": title,
        "text": text,
        "rating": rating,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "article_image": articleImage,
      };
}

Future<List<Article>> generateDummyArticles() async {
  var dummyArticles = await ArticleFunctions.getAllArticles();
  List<Article> res = [];
  for (int i = 0; i < dummyArticles.length; i++) {
    res.add(Article.fromJson(dummyArticles[i]));
  }
  return res;
}
