import 'package:get/get.dart';
import 'package:newsappusingcleanarchitechture/presentation/getx/bindings/bindings.dart';
import 'package:newsappusingcleanarchitechture/presentation/pages/home.dart';

List<GetPage<dynamic>> routes = [
  GetPage(
    name: '/',
    page: () => Home(),
    binding: ArticleBinding(),
  ),
];
