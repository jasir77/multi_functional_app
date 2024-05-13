import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Models/models.dart';

class NewsController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  RxList<Article> articles = <Article>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNews('Latest news');
  }

  Future<void> fetchNews(String searchTerm) async {
    final apiKey = '58b3ac798dee43adadcca656bae0f60b';
    final url = 'https://newsapi.org/v2/everything?q=$searchTerm&apiKey=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      final responseData = json.decode(response.body);

      if (responseData['status'] == 'ok') {
        List<Article> fetchedArticles = (responseData['articles'] as List)
            .map((article) => Article.fromJson(article))
            .toList();
        articles.assignAll(fetchedArticles);
      } else {
        throw Exception('Failed to load news');
      }
    } catch (error) {
      print(error);
    }
  }

  void searchNews(String searchTerm) {
    fetchNews(searchTerm);
  }
}
