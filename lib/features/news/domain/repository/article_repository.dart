import 'package:newsappusingcleanarchitechture/core/resources/data_state.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/entity/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity?>>> getNewsArticles();
  Future<DataState<String>> saveArticleToFavorites(ArticleEntity article);
  Future<DataState<String>> saveFavorites(List<ArticleEntity> articles);
  Future<DataState<List<ArticleEntity>>> getFavorites();
}
