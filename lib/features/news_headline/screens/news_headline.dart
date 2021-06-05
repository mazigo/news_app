import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:news_app/core/views/drawer.dart';
import 'package:news_app/features/news_headline/controller/news_headline_controller.dart';

class NewsHeadline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsHeadlineController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("News Headline"),
      ),
      drawer: getAppDrawer(),
      body: Obx(() {
        return controller.isLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                margin: const EdgeInsets.all(10),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          controller.articles[index].urlToImage == null
                              ? Container()
                              : Image.network(
                                  controller.articles[index].urlToImage),
                          SizedBox(
                            height: 8,
                          ),
                         controller.articles[index].title == null
                              ? Container()
                              : Text(
                            controller.articles[index].title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 4),
                         controller.articles[index].author == null
                              ? Container()
                              : Align(
                            alignment: Alignment.centerRight,
                            child: Text(controller.articles[index].author,
                          style: TextStyle(
                            fontSize: 12, 
                          )),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                         controller.articles[index].description == null
                              ? Container()
                              : Text(
                            controller.articles[index].description,
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: controller.articles.length));
      }),
    );
  }
}
