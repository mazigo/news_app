import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/views/drawer.dart';
import 'package:news_app/features/search_news/controller/search_news_controller.dart';

class SearchNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchNewsController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Search News"),
      ),
      drawer: getAppDrawer(),
      body: Column(
        children: [
          TextField(
            controller: controller.searchTextController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: "Search news here",
            ),
          ),
          Expanded(child: Obx(() {
            return controller.isLoading.isTrue? Center(child: CircularProgressIndicator(),):
            controller.articles.isEmpty? Center(child: Text("No available news at the moment"),):
            Container(
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
          }))
        ],
      ),
    );
  }
}
