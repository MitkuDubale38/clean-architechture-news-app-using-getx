import 'dart:convert';

import 'package:newsappusingcleanarchitechture/core/cache/cache_attrib_options.dart';
import 'package:newsappusingcleanarchitechture/core/cache/cache_data_state.dart';
import 'package:newsappusingcleanarchitechture/core/cache/cache_service.dart';
import 'package:newsappusingcleanarchitechture/core/cache/cache_service_impl.dart';
import 'package:newsappusingcleanarchitechture/core/network/Api/NewsApi/newsApiCacheProps.dart';
import 'package:newsappusingcleanarchitechture/core/resources/data_state.dart';
import 'package:newsappusingcleanarchitechture/features/news/data/models/article.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/entity/article.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/repository/article_repository.dart';

class ArticleRepositoryFromCacheImpl implements ArticleRepository {
  final CacheService cacheService;
  ArticleRepositoryFromCacheImpl(this.cacheService);
  CacheServiceImplementation cacheServiceImplementation =
      CacheServiceImplementation();
  @override
  Future<DataState<List<ArticleModel?>>> getNewsArticles() async {
    var data = await cacheServiceImplementation.cacheData(NewsApiCacheProperty(
        isAddingAnItemToCacheList: false,
        dataKey: "News",
        operation: OPERATIONS.READ));
    if (data is CacheDataSuccess) {
      var result = jsonDecode(data.data);
      List<ArticleModel> value = await result
          .map<ArticleModel>(
              (dynamic i) => ArticleModel.fromJson(i as Map<String, dynamic>))
          .toList();
      return DataSuccess(value);
    } else {
      return const DataFailed("Error getting news articles");
    }
  }

  @override
  Future<DataState<List<ArticleEntity>>> getFavorites() async {
    try {
      var favData = await cacheServiceImplementation.cacheData(
          NewsApiCacheProperty(dataKey: "FAV", operation: OPERATIONS.READ));
      List<ArticleModel> articles = (jsonDecode(favData!.data) as List)
          .map((x) => ArticleModel.fromJson(x))
          .toList();
      return DataSuccess(articles);
    } catch (ex) {
      return DataFailed(ex);
    }
  }

  @override
  Future<DataState<String>> saveArticleToFavorites(
      ArticleEntity article) async {
    try {
      List<dynamic> previousData = [];
      dynamic data = await cacheServiceImplementation.cacheData(
          NewsApiCacheProperty(dataKey: "FAV", operation: OPERATIONS.READ));
      if (data.data != null) {
        var prevDataTemp = jsonDecode(data.data);
        previousData = [...prevDataTemp];
      }
      dynamic currentData = ArticleModel.fromEntity(article).toMap();
      previousData.add(currentData);

      await cacheServiceImplementation.cacheData(NewsApiCacheProperty(
          isAddingAnItemToCacheList: true,
          dataKey: "FAV",
          dataValue: jsonEncode(previousData),
          operation: OPERATIONS.CREATE));
      return const DataSuccess("HIVE SAVED");
    } catch (ex) {
      return const DataFailed(false);
    }
  }

  @override
  Future<DataState<String>> saveFavorites(List<ArticleEntity> articles) async {
    try {
      await cacheServiceImplementation.cacheData(NewsApiCacheProperty(
          isAddingAnItemToCacheList: true,
          dataKey: "FAV",
          dataValue: jsonEncode(articles),
          operation: OPERATIONS.CREATE));
      return const DataSuccess("HIVE SAVED");
    } catch (ex) {
      return const DataFailed(false);
    }
  }
}
