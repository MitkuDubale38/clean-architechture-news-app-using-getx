import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsappusingcleanarchitechture/presentation/controllers/article_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  ArticleController articleController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        return articleController.isLoading.value == false
            ? ListView.builder(
                itemCount: articleController.articleList.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                          title: Text(
                              articleController.articleList[index].title)));
                })
            : const Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}
