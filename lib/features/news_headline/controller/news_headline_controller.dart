import 'package:get/get.dart';
import 'package:news_app/core/model/article.dart';
import 'package:news_app/core/news_repo.dart';
import 'package:news_app/core/repository/news_repo_impl.dart';

class NewsHeadlineController extends GetxController {
  NewsRepo _newsRepo = Get.find<NewsRepoImpl>();

  // ignore: empty_constructor_bodies
  NewsHeadlineController() {
    loadNewsHeadline();
  }
  RxBool isLoading = false.obs;
  RxList<Article> articles = RxList();

  loadNewsHeadline() async {
    showLoading();

    final result = await _newsRepo.getNewsHeadline();

    hideLoading();

    if (result != null) {
      articles = result.obs;
    } else {
      print("No data received");
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
