import 'package:courser/Pages/home_page.dart';
import 'package:courser/User/login_page.dart';
import 'package:flutter/material.dart';
import 'package:courser/User/checks.dart';

void main() => runApp(MyApp());

int _userSignedIn = 1;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenCourser',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
