import 'package:dio/dio.dart';
import 'package:newsappusingcleanarchitechture/core/network/Api/NewsApi/newsApiService.dart';
import 'package:newsappusingcleanarchitechture/core/resources/data_state.dart';
import 'package:newsappusingcleanarchitechture/core/resources/local_data_state.dart';
import 'package:newsappusingcleanarchitechture/features/news/data/data_source/local/hive_service.dart';
import 'package:newsappusingcleanarchitechture/features/news/data/models/article.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/entity/article.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsNetworkService _newsApiService;
  final HiveStorage _hiveStorage;
  ArticleRepositoryImpl(this._newsApiService, this._hiveStorage);

  @override
  Future<DataState<List<ArticleModel?>>> getNewsArticles() async {
    final httpResponse = await _newsApiService.fetchNewsArticles(
        "techcrunch.com", "2a49c2171ea1471f8221aae7966a38c5");
    return httpResponse;
  }

  @override
  Future<LocalDataState<bool>> addToFavorite(ArticleEntity article) async {
    final favData = await _hiveStorage.getSavedData("favorites");
    List<Map<String, dynamic>> articles = [...favData ?? []];
    articles.add(ArticleModel.fromEntity(article).toMap());
    try {
      await _hiveStorage.saveData("favorites", articles);
      return const LocalDataSuccess(true);
    } catch (ex) {
      return const LocalDataFailed(false);
    }
  }

  @override
  Future<LocalDataState<List<ArticleModel>>> getFavoriteArticles() async {
    try {
      final favData = await _hiveStorage.getSavedData("favorites");
      List<ArticleModel> articles =
          (favData as List).map((x) => ArticleModel.fromJson(x)).toList();
      return LocalDataSuccess(articles);
    } catch (ex) {
      return LocalDataFailed(ex);
    }
  }

  @override
  Future<LocalDataState<bool>> removeFromFavorite(ArticleEntity article) async {
    try {
      await _hiveStorage.removeItemFromData(
          "favorites", ArticleModel.fromEntity(article).toMap());
      return const LocalDataSuccess(true);
    } catch (ex) {
      return const LocalDataFailed(false);
    }
  }
}
