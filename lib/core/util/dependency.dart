import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:newsappusingcleanarchitechture/core/network/Api/NewsApi/newsApiService.dart';
import 'package:newsappusingcleanarchitechture/core/network/Api/NewsApi/newsApiServiceImpl.dart';
import 'package:newsappusingcleanarchitechture/core/util/HttpClient/HttpServiceImpl.dart';
import 'package:newsappusingcleanarchitechture/core/util/HttpClient/httpService.dart';
import 'package:newsappusingcleanarchitechture/features/news/data/data_source/local/hive_service.dart';
import 'package:newsappusingcleanarchitechture/features/news/data/repository/article_repository_impl.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/repository/article_repository.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/usecases/usecase.dart';

class DependencyCreator {
  static init() {
    Get.put(Dio());
    Get.put(HiveStorage());
    Get.put<HttpService>(HttpServiceImpl());
    Get.put<NewsNetworkService>(NewsApiServiceImpl());
    Get.put<ArticleRepository>(ArticleRepositoryImpl(
        Get.find<NewsNetworkService>(), Get.find<HiveStorage>()));
    Get.lazyPut(() => ArticleUseCase(Get.find<ArticleRepository>()));
  }
}
