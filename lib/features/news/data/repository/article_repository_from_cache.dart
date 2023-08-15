import 'dart:convert';

import 'package:newsappusingcleanarchitechture/core/cache/cache_data_state.dart';
import 'package:newsappusingcleanarchitechture/core/cache/cache_service.dart';
import 'package:newsappusingcleanarchitechture/core/cache/cache_service_impl.dart';
import 'package:newsappusingcleanarchitechture/core/network/Api/NewsApi/newsApiCacheProps.dart';
import 'package:newsappusingcleanarchitechture/core/resources/data_state.dart';
import 'package:newsappusingcleanarchitechture/core/resources/local_data_state.dart';
import 'package:newsappusingcleanarchitechture/features/news/data/models/article.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/entity/article.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/repository/article_repository.dart';

class ArticleRepositoryFromCacheImpl implements ArticleRepository {
  final CacheService _cacheService;
  ArticleRepositoryFromCacheImpl(this._cacheService);

  @override
  Future<DataState<List<ArticleModel?>>> getNewsArticles() async {
    CacheServiceImplementation cacheServiceImplementation =
        CacheServiceImplementation();
    var data = await cacheServiceImplementation
        .cacheData(NewsApiCacheProperty("News", ""));
    if (data is CacheDataFailed) {
      var result = jsonDecode(data!.data);
      List<ArticleModel> value = await result
          .map<ArticleModel>(
              (dynamic i) => ArticleModel.fromJson(i as Map<String, dynamic>))
          .toList();
      return DataSuccess(value);
    } else {
      return const DataFailed("Error occured while loading news articles");
    }
  }

  @override
  Future<LocalDataState<bool>> addToFavorite(ArticleEntity article) {
    // TODO: implement addToFavorite
    throw UnimplementedError();
  }

  @override
  Future<LocalDataState<List<ArticleEntity>>> getFavoriteArticles() {
    // TODO: implement getFavoriteArticles
    throw UnimplementedError();
  }

  @override
  Future<LocalDataState<bool>> removeFromFavorite(ArticleEntity article) {
    // TODO: implement removeFromFavorite
    throw UnimplementedError();
  }
}
// CacheDataSuccess CacheDataSuccess (Instance of 'CacheDataSuccess<dynamic>')
