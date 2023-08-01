import 'package:newsappusingcleanarchitechture/core/resources/data_state.dart';
import 'package:newsappusingcleanarchitechture/domain/entity/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
