import 'package:courser/login-page/login_page.dart';
import 'package:courser/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:courser/API/structures.dart';

Course currCourse = Course(11,"Advanced Python Programming",'Developer',
    '12-03-2019','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    'Python','https://www.example.com','Udacity',12,0);
Course currCourse2 = Course(11,"Advanced Python Programming 2",'Developer',
    '12-03-2019','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    'Python','https://www.example.com','Udacity',12,0);
Course currCourse3 = Course(11,"Advanced Python Programming 3",'Developer',
    '12-03-2019','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    'Python','https://www.example.com','Udacity',12,0);
Course currCourse4 = Course(11,"Advanced Python Programming 4 ",'Developer',
    '12-03-2019','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    'Python','https://www.example.com','Udacity',12,0);
List<Course> courseList = [currCourse, currCourse2, currCourse3, currCourse4];

Widget UserSignInCheck (int val){
  if (val == 0){
    return LoginPage();
  }

  else if (val ==1){
  return MyHomePage(courseList);
  }
}
