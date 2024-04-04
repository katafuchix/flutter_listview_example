import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListPage();
  }
}

class _ListPage extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'スクショ！',
        ),
      ),
      body: Center(
// -*-*-*-*-*-*-*-*- ListView使ってるとこ -*-*-*-*-*-*-*-*-
        child: ListView(
          //scrollDirection: Axis.horizontal, // 横
          padding: EdgeInsets.all(36.0),
          shrinkWrap: true,
          children: [
            Container(
              color: Colors.red,
              child: Text(
                "ジョナサン・ジョースター",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            Container(
              color: Colors.green,
              child: Text(
                "ジョセフ・ジョースター",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            Container(
              color: Colors.blue,
              child: Text(
                "空条承太郎",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0),
              ),
            ),
          ],
        ),
// -*-*-*-*-*-*-*-*- ListView使ってるとこ -*-*-*-*-*-*-*-*-
      ),
    );
  }
}