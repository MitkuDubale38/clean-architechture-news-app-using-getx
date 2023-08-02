import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsappusingcleanarchitechture/features/news/presentation/controllers/article_controller.dart';
import 'package:newsappusingcleanarchitechture/features/news/presentation/pages/article_search_delegate.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});

  ArticleController articleController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              final result = await showSearch(
                context: context,
                delegate: ArticleSearchDelegate(articleController.articleList),
              );
              if (result != null) {
                // handle search result
              }
            },
          )
        ],
      ),
      body: GetBuilder<ArticleController>(
        builder: (articleController) {
          return articleController.isLoading.value == false
              ? ListView.builder(
                  itemCount: articleController.articleList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title:
                            Text(articleController.articleList[index].title!),
                        subtitle: Text(
                            articleController.articleList[index].description!),
                        trailing: IconButton(
                            icon: articleController.favArticleList
                                    .where((element) =>
                                        element.title ==
                                        articleController
                                            .articleList[index].title)
                                    .toList()
                                    .isNotEmpty
                                ? const Icon(Icons.favorite)
                                : const Icon(Icons.favorite_outline),
                            onPressed: () {
                              articleController.favArticleList
                                      .where((element) =>
                                          element.title ==
                                          articleController
                                              .articleList[index].title)
                                      .toList()
                                      .isNotEmpty
                                  ? articleController.removeFromFavorites(
                                      articleController.articleList[index])
                                  : articleController.addToFavorites(
                                      articleController.articleList[index]);
                            }),
                      ),
                    );
                  })
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
