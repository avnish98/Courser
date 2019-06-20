import 'package:flutter/material.dart';
import 'package:courser/drawer/drawer.dart';
import 'package:courser/BasicUI/basic_ui.dart';
import 'package:courser/API/structures.dart';

Course currCourse = Course(11,"Advanced Python Programming",'Developer','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    'Python','https://www.example.com','Udacity',12,0,"Somethign link");
Course currCourse2 = Course(11,"Advanced Python Programming 2",'Developer','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    'Python','https://www.example.com','Udacity',12,0,"HTML");
Course currCourse3 = Course(11,"Advanced Python Programming 3",'Developer','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    'Python','https://www.example.com','Udacity',12,0,"CSS");
Course currCourse4 = Course(11,"Advanced Python Programming 4 ",'Developer','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    'Python','https://www.example.com','Udacity',12,0,"JS");
List<Course> courseList = [currCourse, currCourse2, currCourse3, currCourse4];

class UpvCourses extends StatefulWidget {
  UpvCourses({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _UpvCourseState createState() => _UpvCourseState();
}

class _UpvCourseState extends State<UpvCourses> {
  // TODO : Courses upvoted by user
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List <String> itemList = ["Applied Data Science with Python Specialization",
      "Introduction to Data Science in Python",
      "Python 3 Programming Specialization",
    ];
  @override
  Widget build(BuildContext context) {
    
    // Appbar of added courses page
    final topBar = SecondaryAppBar('Courses upvoted by you', _scaffoldKey);

    final upvotedCourses = CourseCards(context, courseList);

    return Scaffold(
        key: _scaffoldKey,
        appBar: topBar,
        drawer: AppDrawer(),
        body: upvotedCourses,
        );
  }
}
