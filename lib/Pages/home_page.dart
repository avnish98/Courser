import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

// From Courser
import "package:courser/Basic UI Components/drawer.dart";
import 'package:courser/Basic UI Components/basicUI.dart';
import 'package:courser/DB Interface/structures.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Course> alldata;


  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    DatabaseReference ref=FirebaseDatabase.instance.reference();
    ref.child('course').once().then((DataSnapshot snap){
      var data=snap.value;
      for(int i=1;i<=99;i++){
        Course course=new Course(
          data[i]['cid'], 
          data[i]['cname'], 
          data[i]['uname'],
          data[i]['desc'], 
          data[i]['type'], 
          data[i]['link'], 
          data[i]['platform'], 
          data[i]['upvCount'], 
          data[i]['price'], 
          data[i]['preReq']
          );
          alldata.add(course);
      }
    });
    setState(() {
     print('length ${alldata.length}');
    });
  }

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
          onPressed: () {},
        )
      ],
    );

    // Generates grid of courses taking input the list of courses

    // Adds title to grid of courses
    Widget TitleCourseCards(String listTitle) {
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
          new Expanded(child: CourseCards(context, this.alldata)),
        ]))
      ]);
    }

    // Replace with list of courses in interests
  
    return Scaffold(
        key: _scaffoldKey,
        appBar: topBar,
        drawer: AppDrawer(),
        body: Padding(
            padding: EdgeInsets.all(15.0),
            child: TitleCourseCards("Recommendations for you" )));
  }
}
