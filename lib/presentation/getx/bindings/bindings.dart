import 'package:get/get.dart';
import 'package:newsappusingcleanarchitechture/data/repository/article_repository_impl.dart';
import 'package:newsappusingcleanarchitechture/domain/repository/article_repository.dart';
import 'package:newsappusingcleanarchitechture/domain/usecases/usecase.dart';

class ArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetArticleUseCase(Get.find<ArticleRepository>()));
  }
}
