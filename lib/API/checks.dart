import 'package:courser/login-page/login_page.dart';
import 'package:courser/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:courser/API/structures.dart';

Widget UserSignInCheck (int val){
  if (val == 0){
    return LoginPage();
  }

  else if (val ==1){
  return callHome();
  }
}
