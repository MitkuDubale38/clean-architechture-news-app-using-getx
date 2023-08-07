import 'dart:convert';

import 'package:newsappusingcleanarchitechture/features/news/domain/entity/article.dart';

ArticleModel articleResponseFromJson(String str) =>
    ArticleModel.fromJson(json.decode(str));

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) : super(
          author: author,
          content: content,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          description: description,
          title: title,
        );
  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      author: map["author"] ?? "",
      title: map["title"] ?? "",
      description: map["description"] ?? "",
      url: map["url"] ?? "",
      urlToImage: map["urlToImage"] ?? "",
      publishedAt: map["publishedAt"] ?? "",
      content: map["content"] ?? "",
    );
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  factory ArticleModel.fromEntity(ArticleEntity entity) {
    return ArticleModel(
      author: entity.author,
      content: entity.content,
      description: entity.description,
      publishedAt: entity.publishedAt,
      title: entity.title,
      url: entity.url,
      urlToImage: entity.urlToImage,
    );
  }
}
