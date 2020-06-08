import 'package:aicflutter5/result.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Training',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Noto Sans JP",
      ),
      home: DefaultTextStyle.merge(
        style: TextStyle(
          height: 1.5
        ),
          child: MyHomePage()
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String genderAns = "男性";
  bool haveDog = false;
  double feel = 0.4;
  TextEditingController favoriteNumberController;

  @override
  void initState() {
    super.initState();
    favoriteNumberController = new TextEditingController(text: "334");
  }

  @override
  void dispose() {
    favoriteNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 800.0,
                  height: 500.0,
                  margin: EdgeInsets.all(16.0),
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      "運勢占い",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0
                      ),
                    ),
                  ),
                ),
                Text(
                    "質問1. 性別を教えて下さい",
                  style: TextStyle(
                    fontSize: 30.0
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("男性"),
                    Radio(
                      value: "男性",
                      groupValue: genderAns,
                      onChanged: (value) {
                        setState(() {
                          genderAns = value;
                        });
                      },
                    ),
                    Text("女性"),
                    Radio(
                      value: "女性",
                      groupValue: genderAns,
                      onChanged: (value) {
                        setState(() {
                          genderAns = value;
                        });
                      },
                    ),
                  ],
                ),
                Text(
                  "質問2. 犬を飼っていますか？",
                  style: TextStyle(
                      fontSize: 30.0
                  ),
                ),
                Switch(
                  value: haveDog,
                  onChanged: (value) {
                    setState(() {
                      haveDog = value;
                    });
                  },
                ),
                Text(
                  "質問3. 現在の気分は？",
                  style: TextStyle(
                      fontSize: 30.0
                  ),
                ),
                Text("${(feel * 100).round()}"),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("悪い"),
                    Slider(
                      value: feel,
                      onChanged: (value) {
                        setState(() {
                          feel = value;
                        });
                      },
                    ),
                    Text("良い")
                  ],
                ),
                Text(
                  "質問4. 好きな数字は？",
                  style: TextStyle(
                      fontSize: 30.0
                  ),
                ),
                Container(
                  width: 400.0,
                  child: TextField(
                    controller: favoriteNumberController,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  "質問5. チェックしてみてください",
                  style: TextStyle(
                      fontSize: 30.0
                  ),
                ),
                Checkbox(
                  value: haveDog,
                  onChanged: (value) {
                    setState(() {
                      haveDog = value;
                    });
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ResultPage(genderAns, haveDog, feel, favoriteNumberController.text);
                        },
                      ),
                    );
                  },
                  color: Colors.red,
                  child: Text(
                      "結果を見る",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          )
        )
    );
  }
}