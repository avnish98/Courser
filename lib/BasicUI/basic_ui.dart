/* This file contains basic UI components created for reusability */

import 'package:flutter/material.dart';
import 'package:courser/course-description/course_desc.dart';
import 'package:courser/API/structures.dart';

// Generates a string title
/* Used at 
Add Courses page
Course Description page


*/
Widget titleGen(String title, double size, var weight, var tcolor) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      child: Text(
        title,
        style: TextStyle(
            color: tcolor,
            fontFamily: "Roboto",
            fontSize: size,
            fontWeight: weight),
      ),
    ),
  );
}

// Generates a description
/* Used at 
Course Description page



*/
Widget valueGen(String value) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      child: Text(
        value,
        style: TextStyle(
            color: Colors.black,
            fontFamily: "Roboto",
            fontSize: 18.0,
            fontWeight: FontWeight.w400),
      ),
    ),
  );
}

// Generates a Text Field
/* Used at 
Add Courses page



*/
Widget TFieldGen(String decoration) {
  return TextField(decoration: InputDecoration(hintText: decoration));
}

// Generates a Button
/* Used at 
Add Courses page



*/
Widget ButtonGen(BuildContext context, String buttonText, var textColor,
    var buttonColor) {
  return Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(10.0),
    color: buttonColor,
    child: MaterialButton(
      minWidth: MediaQuery
          .of(context)
          .size
          .width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      onPressed: () {},
      child: Text(buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 21.0, color: textColor)),
    ),
  );
}

// Generates a Secondary app bar (App bars for pages other than home page)
/* Used at 
Add Courses page



*/
Widget SecondaryAppBar(String title, GlobalKey<ScaffoldState> _scaffoldKey) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: Colors.deepPurple),
      textAlign: TextAlign.left,
    ),
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: 0.0,
    leading: IconButton(
      icon: Icon(
        Icons.menu,
        color: Colors.deepPurple,
      ),
      onPressed: () => _scaffoldKey.currentState.openDrawer(),
    ),
  );
}

Course currCourse = Course(11,"Advanced Python Programming",'Developer',
        '12-03-2019','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        'Python','https://www.example.com','Udacity',12,0);

/*Generates course cards on input of String list
Used at:
Home Page
Added Courses Page
Upvoted Courses Page


*/
Widget CourseCards (BuildContext context, List<Course> courseList){
      return GridView.count(
          crossAxisCount: 2,
          children: List.generate(courseList.length, (index) {
            return GestureDetector(
              onTap:(){Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CourseDesc(currCourse)),);},
              child:Card(
              //color: Colors.black,
              child:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/python.jpg"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
        ),
        child:

              Align(
                  alignment: Alignment.bottomCenter,
                  child:Padding(
                      padding: EdgeInsets.all(0.5),
                      child:Text(
                        courseList[index].cname,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ))
              )
              ,
            )
      ));})
      );}