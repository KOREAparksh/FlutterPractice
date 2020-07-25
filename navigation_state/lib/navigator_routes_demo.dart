import 'package:flutter/material.dart';
import 'package:navigation_state/navigator_push_demo.dart';

void main() => runApp(NavigatorRoutesDemo());

class NavigatorRoutesDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/next': (context) => NextPage(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  _showNextPage(BuildContext context) => Navigator.pushNamed(context, '/next');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navigator routes 데모')),
      body: Center(
        child: RaisedButton(
          onPressed: () => _showNextPage(context),
          child: Text('상세페이지로 이동'),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  _backToMainPage(BuildContext context) => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('다음페이지')),
      body: Center(
        child: RaisedButton(
          onPressed: () => _backToMainPage(context),
          child: Text('메인페이지로 돌아가기'),
        ),
      ),
    );
  }
}
