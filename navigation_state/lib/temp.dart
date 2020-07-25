import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(RowColumnDemo());

class RowColumnDemo extends StatelessWidget {
  static const String _title = "로그인화면 위젯 데모";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.fromLTRB(20, 120, 20, 120),
          color: Colors.white60,
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/test_image.png", width: 100),
              SizedBox(height: 45.0),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                initialValue: 'Your_name@email.com',
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(height: 45.0),
              TextFormField(
                obscureText: true,
                initialValue: 'Yoursdfsd',
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(height: 45),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('login'),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  RaisedButton(
                    child: Text('cancel'),
                    color: Colors.white60,
                    onPressed: () {
                      exit(0);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
