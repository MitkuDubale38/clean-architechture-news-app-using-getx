import 'package:flutter/material.dart';
import 'package:newsappusingcleanarchitechture/core/util/dependency.dart';
import 'package:newsappusingcleanarchitechture/presentation/getx/bindings/bindings.dart';
import 'package:newsappusingcleanarchitechture/presentation/pages/home.dart';

void main() {
  DependencyCreator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ArticleBinding().dependencies();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}
