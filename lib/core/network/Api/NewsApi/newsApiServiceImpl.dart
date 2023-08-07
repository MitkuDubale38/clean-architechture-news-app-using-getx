import 'dart:convert';

import 'package:get/get.dart';
import 'package:newsappusingcleanarchitechture/core/network/Api/NewsApi/newsApiHttpAttributes.dart';
import 'package:newsappusingcleanarchitechture/core/network/Api/NewsApi/newsApiService.dart';
import 'package:newsappusingcleanarchitechture/core/util/HttpClient/httpService.dart';
import 'package:newsappusingcleanarchitechture/features/news/data/models/article.dart';

class NewsApiServiceImpl implements NewsNetworkService {
  @override
  Future<List<ArticleModel?>> fetchNewsArticles(
      String domains, String accessToken) async {
    var httpService = Get.find<HttpService>();
    try {
      String? response = await httpService.send(NewsApiHttpAttributes());
      if (response != null) {
        final result = jsonDecode(response);
        List<ArticleModel> value = await result["articles"]
            .map<ArticleModel>(
                (dynamic i) => ArticleModel.fromJson(i as Map<String, dynamic>))
            .toList();
        return value;
      } else {
        return List<ArticleModel>.empty();
      }
    } catch (ex) {
      return List<ArticleModel>.empty();
    }
  }
}
