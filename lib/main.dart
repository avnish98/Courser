import 'package:courser/User/login_page.dart';
import 'package:flutter/material.dart';
import 'package:courser/User/checks.dart';
import 'package:courser/Pages/home_page.dart';


void main() => runApp(MyApp());

int _userSignedIn = 1; // 1= home page , 0= login page

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
