import 'dart:math';

import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  String _gender;
  bool _haveDog;
  double _feel;
  String _favoriteNumber;

  String resultValue;

  ResultPage(String gender, bool haveDog, double feel, String favoriteNumber) {
    _gender = gender;
    _haveDog = haveDog;
    _feel = feel;
    _favoriteNumber = favoriteNumber;

    if(_haveDog) {
      resultValue = "大吉！";
    }
    else {
      resultValue = result[Random().nextInt(result.length)];
    }
  }

  List<String> result = ["大吉！", "中吉！", "吉！", "凶", "大凶！！！"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("結果は..."),
            Text(
              resultValue,
              style: TextStyle(
                color: Colors.red,
                fontSize: 60.0
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("戻る"),
            ),
            Text("性別"),
            Text(_gender),
            Text("犬を飼っているか"),
            Text("$_haveDog"),
            Text("今の気分"),
            Text("$_feel"),
            Text("好きな数字"),
            Text("$_favoriteNumber"),
          ],
        ),
      ),
    );
  }
}