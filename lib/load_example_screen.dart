import 'package:flutter/material.dart';

class LoadExampleScreen extends StatefulWidget {
  LoadExampleScreen({super.key});

  @override
  LoadExampleScreenState createState() => LoadExampleScreenState();
}

class LoadExampleScreenState extends State<LoadExampleScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          // https://qiita.com/bon_ninax/items/331eabfdd2cab9efca96
          onPressed: () async {
            showProgressDialog(context);
            //await Future<dynamic>.delayed(Duration(seconds: 2));// dialogをawaitできないので、遅延させて調整。。他の方法知っている方いらっしゃいましたら教えてください！！

            // await 何かの処理

            // 処理が完了したらローディングを消す
            //if (isCompleted) Navigator.of(context).pop(); // これだと消えない。。
            //Navigator.of(context, rootNavigator: true).pop();

          },
          child: Text('登録する'),

        )
      ),
    );
  }
}

// 全画面プログレスダイアログを表示する関数
void showProgressDialog(context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    transitionDuration: Duration.zero, // これを入れると遅延を入れなくて
    barrierColor: Colors.black.withOpacity(0.5),
    pageBuilder: (BuildContext context, Animation animation,
        Animation secondaryAnimation) {
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}