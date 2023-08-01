import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:newsappusingcleanarchitechture/domain/entity/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    int? id,
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
          id: id,
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
}
