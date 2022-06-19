// ignore_for_file: unused_local_variable
import 'dart:convert';
import 'package:flutter_newsapp/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=6e678cb291c44f3792e3e6c05e478c00";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        //checking that all images and description is there
        if (element["urlToImage"] != null && element["description"] != null) {
          //create object
          ArticleModel articleModel = ArticleModel(
            title:element["title"],
            author:element["author"],
            description:element["description"],
            url:element["url"],
            urlToImage:element["urlToImage"],
            content:element["content"],
          );

          news.add(articleModel);
        }
      });
    }
  }

 
}

class CategoryNewsClass{
  List<ArticleModel> news = [];

  Future<void> getNews(String category ) async {
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=6e678cb291c44f3792e3e6c05e478c00";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        //checking that all images and description is there
        if (element["urlToImage"] != null && element["description"] != null) {
          //create object
          ArticleModel articleModel = ArticleModel(
            title:element["title"],
            author:element["author"],
            description:element["description"],
            url:element["url"],
            urlToImage:element["urlToImage"],
            content:element["content"],
          );

          news.add(articleModel);
        }
      });
    }
  }
}