import 'package:newsappusingcleanarchitechture/core/resources/data_state.dart';
import 'package:newsappusingcleanarchitechture/features/news/data/models/article.dart';

abstract class NewsNetworkService {
  Future<DataState<List<ArticleModel?>>> fetchNewsArticles(
      String domains, String accessToken);
}
