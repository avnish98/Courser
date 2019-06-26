import 'package:flutter/material.dart';
import 'package:courser/User/login_page.dart';

void main() => runApp(MyApp());

int _userSignedIn = 1; // 1= home page , 0= login page

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenCourser',  // app name
      home: LoginPage(),
      debugShowCheckedModeBanner: false,  //to remove debug tag
    );
  }
}
