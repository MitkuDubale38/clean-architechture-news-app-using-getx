import 'package:newsappusingcleanarchitechture/features/news/data/models/article.dart';

abstract class NewsNetworkService {
  Future<List<ArticleModel?>> fetchNewsArticles(
      String domains, String accessToken);
}
