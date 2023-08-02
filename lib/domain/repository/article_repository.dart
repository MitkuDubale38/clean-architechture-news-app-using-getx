import 'package:newsappusingcleanarchitechture/core/resources/data_state.dart';
import 'package:newsappusingcleanarchitechture/core/resources/local_data_state.dart';
import 'package:newsappusingcleanarchitechture/domain/entity/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
  Future<LocalDataState<bool>> addToFavorite(ArticleEntity article);
  Future<LocalDataState<List<ArticleEntity>>> getFavoriteArticles();
  Future<LocalDataState<bool>> removeFromFavorite(ArticleEntity article);
}
