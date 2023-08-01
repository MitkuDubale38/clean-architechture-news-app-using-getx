import 'package:dio/dio.dart';
import 'package:newsappusingcleanarchitechture/data/models/article.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
part "news_api_service.g.dart";

@RestApi(baseUrl: "https://newsapi.org/v2/")
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET("/everything")
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query('apiKey') String? apiKey,
    @Query('domains') String? domain,
  });
}
