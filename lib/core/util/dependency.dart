part of cleanArchitectureUtils;

class DependencyCreator {
  static init() {
    Get.put(HiveStorage());
    Get.put<CacheService>(CacheServiceImplementation());
    Get.put<HttpService>(HttpServiceImpl());
    Get.put<NewsNetworkService>(NewsApiServiceImpl());
    // Get.put<ArticleRepository>(ArticleRepositoryImpl(
    //     Get.find<NewsNetworkService>(), Get.find<HiveStorage>()));

    Get.put<ArticleRepository>(
        ArticleRepositoryFromCacheImpl(Get.find<CacheService>()));
    Get.lazyPut(() => ArticleUseCase(Get.find<ArticleRepository>()));
  }
}
