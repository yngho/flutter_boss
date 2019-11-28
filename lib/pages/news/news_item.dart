import 'package:flutter/material.dart';
import 'package:flutter_boss/model/job.dart';
import 'package:flutter_boss/model/news.dart';

class NewsItem extends StatelessWidget {
  final News news;
  NewsItem({Key key, this.news, this.onPressed}): super(key: key);

  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.only(
          left: 18.0, top: 10.0, right: 18.0, bottom: 10.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize:  MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    news.title,
                    style: new TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                Text(
                  news.date,
                  style: TextStyle(color: new Color(0xFF54cbc4), fontSize: 18),
                ),
              ],
            ),
            Center(
              child: Image.network(
                news.thumbnailPic1
              )
            )
          ],
        ),
      ),
    );
  }
}

