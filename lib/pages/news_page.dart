import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_boss/model/news.dart';
import 'package:flutter_boss/pages/news/news_item.dart';
import 'package:http/http.dart' as http;

class NewsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> with AutomaticKeepAliveClientMixin {
  List<News> _newsList = List<News>();

  @override
  bool get wantKeepAlive => true;

  Future<List<News>> _fetchNewsList() async {
    final response = await http.get('http://v.juhe.cn/toutiao/index?type=keji&key=4c52313fc9247e5b4176aed5ddd56ad7');
    List<News> newsList = List<News>();
    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      for (dynamic data in result['result']['data']) {
        News jobData = News.fromJson(data);
        newsList.add(jobData);
      }
      return newsList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: new Text('新 闻',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
      ),
      body: new Center(
        child: FutureBuilder(
          future: _fetchNewsList(),
          builder: (context, AsyncSnapshot snapshot){
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              default:
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                else
                  return _createListView(context, snapshot);
            }
          },
        ),
      ),
    );
  }

  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<News> jobList = snapshot.data;
    return ListView.builder(
      key: new PageStorageKey('news-list'),
      itemCount: jobList.length,
      itemBuilder: (BuildContext context, int index) {
        return new NewsItem(onPressed: () {}, news: jobList[index]);
      },
    );
  }
}