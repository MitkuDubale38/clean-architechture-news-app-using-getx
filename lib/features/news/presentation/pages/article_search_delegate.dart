import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/entity/article.dart';
import 'package:newsappusingcleanarchitechture/features/news/presentation/getx/controllers/article_controller.dart';

class ArticleSearchDelegate extends SearchDelegate<List<ArticleEntity>> {
  final List<ArticleEntity> articles;
  ArticleController articleController = Get.find();

  @override
  String get query;

  ArticleSearchDelegate(this.articles);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, []);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    articleController.search(query, articles);
    List<ArticleEntity> results = articleController.searchResultsArticleList;
    return Obx(() {
      return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final article = results[index];
          return ListTile(
            title: Text(article.title!),
            subtitle: Text(article.description!),
            onTap: () {},
          );
        },
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ArticleEntity> results = articleController.searchResultsArticleList;
    articleController.search(query, articles);
    return Obx(() {
      return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final article = results[index];
          return ListTile(
            title: Text(article.title!),
            subtitle: Text(article.description!),
            onTap: () {},
          );
        },
      );
    });
  }
}
