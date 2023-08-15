import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:newsappusingcleanarchitechture/core/cache/cache_service_impl.dart';
import 'package:newsappusingcleanarchitechture/core/network/Api/NewsApi/newsApiCacheProps.dart';
import 'package:newsappusingcleanarchitechture/core/network/Api/NewsApi/newsApiHttpAttributes.dart';
import 'package:newsappusingcleanarchitechture/core/network/Api/NewsApi/newsApiService.dart';
import 'package:newsappusingcleanarchitechture/core/resources/data_state.dart';
import 'package:newsappusingcleanarchitechture/core/util/util.dart';
import 'package:newsappusingcleanarchitechture/features/news/data/models/article.dart';

class NewsApiServiceImpl implements NewsNetworkService {
  @override
  Future<DataState<List<ArticleModel?>>> fetchNewsArticles(
      String domains, String accessToken) async {
    var httpService = Get.find<HttpService>();
    dynamic response =
        await httpService.sendHttpRequest(NewsApiHttpAttributes());
    try {
      final result = jsonDecode(response!.body);
      List<ArticleModel> value = await result["articles"]
          .map<ArticleModel>(
              (dynamic i) => ArticleModel.fromJson(i as Map<String, dynamic>))
          .toList();
      CacheServiceImplementation cacheServiceImplementation =
          CacheServiceImplementation();
      cacheServiceImplementation
          .cacheData(NewsApiCacheProperty("News", jsonEncode(value)));
      return DataSuccess(value);
    } on HttpException catch (ex) {
      return DataFailed(
          HttpException(HandleHttpException().handleHttpResponse(ex)));
    } catch (ex) {
      return const DataFailed("Failed to fetch articles");
    }
  }
}
