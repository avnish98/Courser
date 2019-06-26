import 'dart:developer';

import 'package:flutter/material.dart';

// From Courser
import "package:courser/Basic UI Components/drawer.dart";
import 'package:courser/Basic UI Components/basicUI.dart';
import 'package:courser/DB Interface/structures.dart';
import 'package:courser/';

// Firebase
import 'package:firebase_database/firebase_database.dart';
/*
Widget MyHomePage() {
  Course currCourse = Course(
      11,
      "Advanced Python Programming",
      'Developer',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'Python',
      'https://www.example.com',
      'Udacity',
      12,
      'Free',
      "Somethign link");
  Course currCourse2 = Course(
      11,
      "Advanced Python Programming 2",
      'Developer',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'Python',
      'https://www.example.com',
      'Udacity',
      12,
      'Free',
      "HTML");
  Course currCourse3 = Course(
      11,
      "Advanced Python Programming 3",
      'Developer',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'Python',
      'https://www.example.com',
      'Udacity',
      12,
      'Free',
      "CSS");
  Course currCourse4 = Course(
      11,
      "Advanced Python Programming 4 ",
      'Developer',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'Python',
      'https://www.example.com',
      'Udacity',
      12,
      'Free',
      "JS");
Course currCourse5 = Course(
      11,
      "Advanced Python Programming 4 ",
      'Developer',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'Python',
      'https://www.example.com',
      'Udacity',
      12,
      'Free',
      "JS");
Course currCourse6 = Course(
      11,
      "Advanced Python Programming 4 ",
      'Developer',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'Python',
      'https://www.example.com',
      'Udacity',
      12,
      'Free',
      "JS");
Course currCourse7 = Course(
      11,
      "Advanced Python Programming 4 ",
      'Developer',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'Python',
      'https://www.example.com',
      'Udacity',
      12,
      'Free',
      "JS");
Course currCourse8 = Course(
      11,
      "Advanced Python Programming 4 ",
      'Developer',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'Python',
      'https://www.example.com',
      'Udacity',
      12,
      'Free',
      "JS");

  List<Course> courseList = [currCourse, currCourse2, currCourse3, currCourse4,currCourse5,currCourse6,currCourse7,currCourse8];

  return (MyHomePage());
}
*/

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Course> c1 = [];
  List<String> cnameList = [];

  /*
  MyHomePage(List<Course> courseList) {
    this.c1 = courseList;
  }
  
  */
  @override
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref
        .child('courses')
        .orderByChild('upvCount')
        .once()
        .then((DataSnapshot snap) {
      var data = snap.value;
      for (int i = 0; i < data.length; i++) {
        Course c;
        c = new Course(
          data[i]['cid'],
          data[i]['cname'],
          data[i]['uname'],
          data[i]['desc'],
          data[i]['type'],
          data[i]['link'],
          data[i]['platform'],
          data[i]['upvCount'],
          data[i]['price'],
          data[i]['prereq'],
        );
        this.c1.add(c);
        this.cnameList.add(data[i]['cname']);
        print('$c');

        // print('${c.cname}');
      }
      setState(() {
        print('length ${c1.length}');
      });
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // Home page

    // App bar of home page
    final topBar = AppBar(
      title: Text(
        'Courser',
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
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.deepPurple,
          ),
          onPressed: () {
            showSearch(context: context, delegate: DataSearch(this.cnameList));
          },
        )
      ],
    );

    // Generates grid of courses taking input the list of courses

    // Adds title to grid of courses
    Widget TitleCourseCards(String listTitle, List<String> itemList) {
      return Row(children: <Widget>[
        new Expanded(
            child: Column(children: <Widget>[
          SizedBox(height: 10.0),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                listTitle,
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              )),
          SizedBox(
            height: 10.0,
          ),
          new Expanded(child: CourseCards(context, c1)),
        ]))
      ]);
    }

    // Replace with list of courses in interests
    List<String> itemList = [
      "Python for Everybody Specialization",
      "Programming for Everybody (Getting Started with Python)",
      "Python Data Structures",
      "Applied Data Science with Python Specialization",
      "Introduction to Data Science in Python",
      "Python 3 Programming Specialization",
    ];

    return Scaffold(
        key: _scaffoldKey,
        appBar: topBar,
        drawer: AppDrawer(),
        body: Padding(
            padding: EdgeInsets.all(15.0),
            child: TitleCourseCards("Recommendations for you", itemList)));
  }
}

class DataSearch extends SearchDelegate {
  List<String> cnameList;

  DataSearch(List<String> input) {
    this.cnameList = input;
  }

  List<String> popCourses = [
    'Python for Everybody Specialization',
    'Programming for Everybody (Getting Started with Python)',
    'Python Data Structures',
    'Applied Data Science with Python Specialization',
    'Introduction to Data Science in Python'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }


  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults

    List<String> results = cnameList.where((p) => p.startsWith(query)).toList();
    return ListView.builder(itemBuilder: (context, index) {
      return GestureDetector(
          onTap: (){

          },
          child:Card(
        child: Center(
          child: Text(results[index]),
        ),
      ));
    },
    itemCount: results.length,);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    final suggestions = query.isEmpty
        ? popCourses
        : cnameList.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            showResults(context);
          },
          title: Text(suggestions[index]),
        );
      },
      itemCount: suggestions.length,
    );
  }
}
