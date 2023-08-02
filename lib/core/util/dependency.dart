import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:newsappusingcleanarchitechture/data/data_source/local/hive_service.dart';
import 'package:newsappusingcleanarchitechture/data/data_source/remote/news_api_service.dart';
import 'package:newsappusingcleanarchitechture/data/repository/article_repository_impl.dart';
import 'package:newsappusingcleanarchitechture/domain/repository/article_repository.dart';
import 'package:newsappusingcleanarchitechture/domain/usecases/usecase.dart';

class DependencyCreator {
  static init() {
    Get.put(Dio());
    Get.put(HiveStorage());
    Get.put(NewsApiService(Get.find<Dio>()));
    Get.put<ArticleRepository>(ArticleRepositoryImpl(
        Get.find<NewsApiService>(), Get.find<HiveStorage>()));
    Get.lazyPut(() => GetArticleUseCase(Get.find<ArticleRepository>()));
  }
}
