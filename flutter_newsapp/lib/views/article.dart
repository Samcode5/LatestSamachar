// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, annotate_overrides, override_on_non_overriding_member, prefer_const_constructors, sized_box_for_whitespace

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogURL;

  ArticleView({required this.blogURL});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            backgroundColor: Colors.white,
            title: Row(mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  Text("Sam", style: TextStyle(color: Colors.blue)),
                  Text("News", style: TextStyle(color: Colors.black))
                ]
                ),
                actions:<Widget>[
                  Opacity(
                    opacity: 0,
                    child:Container(
                      padding:EdgeInsets.symmetric(horizontal: 16),
                      child:Icon(Icons.save),

                    )
                    )
                ],
                centerTitle:true,
                elevation: 3,
                 ),
      body:Container(
         height:MediaQuery.of(context).size.height,
         width:MediaQuery.of(context).size.width,
        child: WebView(
            initialUrl: widget.blogURL,
            onWebViewCreated: ((WebViewController webViewController) {
              _completer.complete(webViewController);
            }
            
            )
            )
            
      )
    );
         
    
    
  }
}
