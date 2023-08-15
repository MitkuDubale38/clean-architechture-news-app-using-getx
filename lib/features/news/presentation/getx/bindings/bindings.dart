import 'package:get/get.dart';
import 'package:newsappusingcleanarchitechture/features/news/presentation/getx/controllers/article_controller.dart';

class ArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleController());
  }
}
