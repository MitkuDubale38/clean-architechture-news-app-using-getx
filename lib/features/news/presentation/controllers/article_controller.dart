import 'package:get/get.dart';
import 'package:newsappusingcleanarchitechture/core/resources/data_state.dart';
import 'package:newsappusingcleanarchitechture/core/resources/local_data_state.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/entity/article.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/usecases/usecase.dart';

class ArticleController extends GetxController {
  Rx<bool> isLoading = false.obs;
  RxList<ArticleEntity> articleList = RxList<ArticleEntity>([]);
  RxList<ArticleEntity> favArticleList = RxList<ArticleEntity>([]);
  final ArticleUseCase _articleUseCase = ArticleUseCase(Get.find());

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
      articleList.addAll(articles.data!.toList());
    }
    isLoading.value = false;
    update();
  }

  void addToFavorites(ArticleEntity article) async {
    final savedArticle = await _articleUseCase.saveToFavorites(article);
    if (savedArticle is LocalDataSuccess) {
      getFavArticleData();
      Get.snackbar(
        "Success",
        "Saved to favorites",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void getFavArticleData() async {
    final articles = await _articleUseCase.getFavArticles();
    if (articles is LocalDataSuccess) {
      favArticleList.assignAll(articles.data!.obs);
      update();
    }
  }

  void removeFromFavorites(ArticleEntity article) async {
    final status = await _articleUseCase.removeFromFavorites(article);
    if (status is LocalDataSuccess) {
      getFavArticleData();
      Get.snackbar(
        "Success",
        "Removed from favorites",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  List<ArticleEntity> search(String query, List<ArticleEntity> articles) {
    List<ArticleEntity> results =
        _articleUseCase.searchArticle(query, articles);
    return results;
  }

  bool isFavorite(ArticleEntity article) {
    return favArticleList.any((element) => element.title == article.title);
  }
}
