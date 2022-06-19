// ignore_for_file: override_on_non_overriding_member, unused_field, use_key_in_widget_constructors, prefer_const_constructors, annotate_overrides, non_constant_identifier_names, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_newsapp/helper/news.dart';
import 'package:flutter_newsapp/models/article_model.dart';
import 'package:flutter_newsapp/views/home.dart';
//import '../helper/data.dart';

class CategoryNews extends StatefulWidget {
  final String Category;
  CategoryNews({required this.Category});
  
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  @override
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.Category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Text("Sam", style: TextStyle(color: Colors.blue)),
                Text("News", style: TextStyle(color: Colors.black))
              ]),
          actions: <Widget>[
            Opacity(
                opacity: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.save),
                ))
          ],
          centerTitle: true,
          elevation: 3,
        ),
        body:_loading 
        ? Center(child: Container(child: CircularProgressIndicator()))
        :
        SingleChildScrollView(
          padding: EdgeInsets.only(left: 12, right: 12, top: 12),
          child: Container(
              child: Column(children: <Widget>[
            Container(
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Blogtile(
                          imageURL: articles[index].urlToImage,
                          title: articles[index].title,
                          desc: articles[index].description,
                          url: articles[index].url);
                    }))
              
          ])),
        ));
  }
}
