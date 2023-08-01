import 'package:get/get.dart';
import 'package:newsappusingcleanarchitechture/core/resources/data_state.dart';
import 'package:newsappusingcleanarchitechture/domain/entity/article.dart';
import 'package:newsappusingcleanarchitechture/domain/usecases/usecase.dart';

class ArticleController extends GetxController {
  Rx<bool> isLoading = false.obs;
  RxList articleList = <ArticleEntity>[].obs;
  final GetArticleUseCase _articleUseCase = GetArticleUseCase(Get.find());

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() async {
    isLoading.value = true;
    final articles = await _articleUseCase.call();
    if (articles is DataSuccess) {
      articleList.addAll(articles.data!.toList());
    }
  }
}
