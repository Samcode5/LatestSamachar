// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, deprecated_member_use, unnecessary_new, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newsapp/helper/data.dart';
import 'package:flutter_newsapp/models/category_model.dart';
import 'package:flutter_newsapp/models/article_model.dart';
import 'package:flutter_newsapp/helper/news.dart';
import 'package:flutter_newsapp/views/article.dart';
import 'package:flutter_newsapp/views/category_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getcategory();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white60,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Text("Latest", style: TextStyle(color: Colors.blue)),
                Text("Samachar", style: TextStyle(color: Colors.black))
              ],
            ),
            elevation: 3),
        body: _loading
            ? Center(child: Container(child: CircularProgressIndicator()))
            : SingleChildScrollView(
                padding: EdgeInsets.only(left: 12, right: 12, top: 12),
                child: Container(
                    child: Column(children: <Widget>[
                  //category
                  Container(
                      height: 70,
                      child: ListView.builder(
                        itemCount: categories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return CategoryTile(
                            imageURL: categories[index].imageURL,
                            categoryName: categories[index].categoryName,
                          );
                        },
                      )),
                  // Display news
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

class CategoryTile extends StatelessWidget {
  final imageURL, categoryName;
  CategoryTile({this.imageURL, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CategoryNews(Category: categoryName.toLowerCase())));
        },
        child: Container(
          margin: EdgeInsets.only(right: 10),
          child: Stack(children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: imageURL,
                  width: 120,
                  height: 60,
                  fit: BoxFit.cover,
                )),

            //text in images
            Container(
                alignment: Alignment.center,
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.black26),
                child: Text(categoryName,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)))
          ]),
        ));
  }
}

//Blog
class Blogtile extends StatelessWidget {
  final String imageURL, title, desc, url;
  Blogtile(
      {required this.imageURL,
      required this.title,
      required this.desc,
      required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      blogURL: url,
                    )));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 16),
          child: Column(children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageURL)),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Text(desc, style: TextStyle(fontSize: 16, color: Colors.grey)),
          ])),
    );
  }
}
