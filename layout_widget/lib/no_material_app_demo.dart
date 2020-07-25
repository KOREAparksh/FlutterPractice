import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(NoMaterialApp());

class NoMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '머테리얼 앱',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.purple,
        accentColor: Colors.cyan[600],
        fontFamily: 'NanumGothic',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('진짜 머티리얼 앱')),
        body: Text(
          '이제야 제대로 된 앱입니다.',
          style: TextStyle(
            fontFamily: 'NotoSans',
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
