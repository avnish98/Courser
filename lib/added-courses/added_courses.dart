import 'package:flutter/material.dart';
import '../drawer/drawer.dart';
import '../BasicUI/basic_ui.dart';
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

class AddedCourses extends StatefulWidget {
  AddedCourses({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AddedCourseState createState() => _AddedCourseState();
}

class _AddedCourseState extends State<AddedCourses> {
  // TODO : Courses added by user
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
   List<String> itemList = [
      "Python for Everybody Specialization",
      "Programming for Everybody (Getting Started with Python)",
      "Python Data Structures"];

  @override
  Widget build(BuildContext context) {
    
    // Appbar of added courses page
    final topBar = SecondaryAppBar('Courses added by you', _scaffoldKey);

    final addedCourses = CourseCards(context, courseList);

    return Scaffold(
        key: _scaffoldKey,
        appBar: topBar,
        drawer: AppDrawer(),
        body: addedCourses,
        );
  }
}
