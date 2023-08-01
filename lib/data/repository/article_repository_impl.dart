import 'dart:io';

import 'package:dio/dio.dart';
import 'package:newsappusingcleanarchitechture/core/resources/data_state.dart';
import 'package:newsappusingcleanarchitechture/data/data_source/remote/news_api_service.dart';
import 'package:newsappusingcleanarchitechture/domain/entity/article.dart';
import 'package:newsappusingcleanarchitechture/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
          apiKey: "2a49c2171ea1471f8221aae7966a38c5", domain: "techcrunch.com");

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.statusMessage,
            type: DioExceptionType.badResponse,
            response: httpResponse.response,
          ),
        );
      }
    } on DioException catch (ex) {
      return DataFailed(ex);
    }
  }
}
