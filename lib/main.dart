import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsappusingcleanarchitechture/config/routes/routes.dart';
import 'package:newsappusingcleanarchitechture/core/util/dependency.dart';

void main() {
  DependencyCreator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 23, 23, 23)),
      ),
      getPages: routes,
    );
  }
}
