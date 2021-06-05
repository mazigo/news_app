import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/features/search_news/binding/search_news_binding.dart';

import 'features/news_headline/binding/news_headline_binding.dart';
import 'features/news_headline/screens/news_headline.dart';
import 'features/search_news/screens/search_news.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: "/news_headline", page: () => NewsHeadline(), binding: NewsHeadlineBinding()),
        GetPage(name: "/search_news", page: () => SearchNews(), binding: SearchNewsBinding()),
      ],
      initialRoute: "/news_headline",
    );
  }
}
