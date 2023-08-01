import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:newsappusingcleanarchitechture/data/data_source/remote/news_api_service.dart';
import 'package:newsappusingcleanarchitechture/data/repository/article_repository_impl.dart';
import 'package:newsappusingcleanarchitechture/domain/repository/article_repository.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(() => Dio());
    Get.lazyPut(() => NewsApiService(Get.find<Dio>()));
    Get.lazyPut<ArticleRepository>(
        () => ArticleRepositoryImpl(Get.find<NewsApiService>()));
  }
}
