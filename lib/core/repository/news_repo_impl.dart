import 'package:get/get.dart';
import 'package:news_app/core/model/article.dart';
import 'package:news_app/core/model/news_response_model.dart';
import 'package:news_app/services/http_service.dart';
import 'package:news_app/services/http_service_impl.dart';

import '../news_repo.dart';

class NewsRepoImpl implements NewsRepo {
  HttpService _httpService = Get.put(HttpServiceImpl());

  NewsRepoImpl() {
    _httpService.init();
  }

  @override
  Future<List<Article>?> getNewsHeadline() async {
    try {
      final response =
          await _httpService.getRequest("/v2/top-headlines?country=us");
      final parsedResponse = NewsResponse.fromJson(response.data);
      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<Article>?> getSearchedNews(String query) async {
    try {
      final response =
          await _httpService.getRequest("/v2/everything?q= $query");
      final parsedResponse = NewsResponse.fromJson(response.data);
      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
