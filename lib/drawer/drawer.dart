import 'package:courser/home/home_page.dart';
import 'package:flutter/material.dart';
import "package:courser/add-courses/add_courses.dart";
import 'package:courser/added-courses/added_courses.dart';
import 'package:courser/upvoted-courses/upvoted_courses.dart';
import 'package:courser/API/structures.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          new Container(child: new DrawerHeader(child: Align(alignment:Alignment.bottomLeft, child:Text('Username goes here', style: TextStyle(color: Colors.white),)),
              
          ),color: Colors.deepPurple,),
          new ListTile(
            title: new Text('Home '),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext) => callHome()));
            },
          ),
          new ListTile(
            title: new Text('Add a new course'),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext) => AddCourses()));
            },
          ),
          new ListTile(
            title: new Text('Added courses'),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext) => AddedCourses()));
            },
            
          ),
          new ListTile(
            title: new Text('Upvoted courses'),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext) => UpvCourses()));
            },
            
          )
        ],
      ),
    );
  }
}
