import 'package:flutter/material.dart';

// From Courser
import 'package:courser/Pages/home_page.dart';
import "package:courser/Pages/add_courses.dart";
import 'package:courser/Pages/added_courses.dart';
import 'package:courser/Pages/upvoted_courses.dart';
import 'package:courser/DB Interface/structures.dart';

class AppDrawer extends StatelessWidget {

  User currUser;

  AppDrawer(User u){
    this.currUser = u;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          new Container(
            child: new DrawerHeader(
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Username goes here',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            color: Colors.deepPurple,
          ),
          new ListTile(
            title: new Text('Home '),
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (BuildContext) => MyHomePage(this.currUser)));
            },
          ),
          new ListTile(
            title: new Text('Add a new course'),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext) => AddCourses(this.currUser)));
            },
          ),
          new ListTile(
            title: new Text('Added courses'),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext) => AddedCourses(this.currUser)));
            },
          ),
          new ListTile(
            title: new Text('Upvoted courses'),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext) => UpvCourses(this.currUser)));
            },
          )
        ],
      ),
    );
  }
}
