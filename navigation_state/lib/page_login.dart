import 'package:flutter/material.dart';
import 'package:navigation_state/login_form_demo_v2.dart';
import 'package:navigation_state/state_simple.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController =
      TextEditingController(text: 'your_name@email.com');
  final TextEditingController _passwordController =
      TextEditingController(text: 'input password');

  void _onLogin(BuildContext context) {
    final String email = _emailController.text;
    final SimpleState state = Provider.of<SimpleState>(context);
    state.setEmail(email);

    Navigator.pushNamed(context, MAIN_PAGE);
  }

  void onCancel() => exit(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 120, 20, 120),
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'heoro',
              child: CircleAvatar(
                child: Image.asset('assets/'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
