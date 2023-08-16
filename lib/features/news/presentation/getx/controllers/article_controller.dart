import 'package:get/get.dart';
import 'package:newsappusingcleanarchitechture/core/resources/data_state.dart';
import 'package:newsappusingcleanarchitechture/core/resources/local_data_state.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/entity/article.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/usecases/add_to_favorites_use_case.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/usecases/get_favorites_use_case.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/usecases/remove_from_favorites.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/usecases/search_articles_usecase.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/usecases/usecase.dart';

class ArticleController extends GetxController {
  Rx<bool> isLoading = false.obs;
  RxList<ArticleEntity> articleList = RxList<ArticleEntity>([]);
  RxList<ArticleEntity> favArticleList = RxList<ArticleEntity>([]);
  RxList<ArticleEntity> searchResultsArticleList = RxList<ArticleEntity>([]);
  final ArticleUseCase _articleUseCase = ArticleUseCase(Get.find());
  final SaveToFavoritesUsecase _saveFavArticleUseCase =
      SaveToFavoritesUsecase(Get.find());
  final GetFavoritesArticleUseCase _getFavArticleUseCase =
      GetFavoritesArticleUseCase(Get.find());
  final RemoveFromFavoritesUsecase _removeFavArticleUseCase =
      RemoveFromFavoritesUsecase(Get.find());
  final SearchArticleUseCase _searchArticleUseCase = SearchArticleUseCase();

  @override
  void onReady() {
    loadData();
    getFavArticleData();
    super.onReady();
  }

  void loadData() async {
    isLoading.value = true;
    final articles = await _articleUseCase.call();
    if (articles is DataSuccess) {
      articleList.addAll(Iterable.castFrom(articles.data!));
    } else if (articles is DataFailed) {
      Get.snackbar(
        "Error",
        articles.error,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    isLoading.value = false;
    update();
  }

  void addToFavorites(ArticleEntity article) async {
    final savedArticle = await _saveFavArticleUseCase.call(
        param: SaveToFavoritesParams(article: article));
    if (savedArticle is DataSuccess) {
      getFavArticleData();
      Get.snackbar(
        "Success",
        "Saved to favorites",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void getFavArticleData() async {
    final articles = await _getFavArticleUseCase.call();
    if (articles is DataSuccess) {
      favArticleList.assignAll(Iterable.castFrom(articles.data!.obs));
      update();
    }
  }

  void removeFromFavorites(ArticleEntity article) async {
    final status = await _removeFavArticleUseCase.call(
        param: RemoveFromFavoritesParams(articleToBeRemoved: article));
    if (status is DataSuccess) {
      getFavArticleData();
      Get.snackbar(
        "Success",
        "Removed from favorites",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void search(String query, List<ArticleEntity> articles) async {
    List<ArticleEntity> result = await _searchArticleUseCase.call(
        param: SearchArticleParams(articles: articles, query: query));
    searchResultsArticleList.assignAll(result);
  }

  bool isFavorite(ArticleEntity article) {
    return favArticleList.any((element) => element.title == article.title);
  }
}
