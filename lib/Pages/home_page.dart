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
  List<Course> alldata=[];


  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    DatabaseReference ref=FirebaseDatabase.instance.reference();
    ref.child('courses').once().then((DataSnapshot snap){
      var data=snap.value;
      alldata.clear();
        Course course=new Course(
          data['cid'], 
          data['cname'],
          data['desc'], 
          data['link'], 
          data['platform'], 
          data['preReq'],
          data['price'], 
          data['type'], 
          data['uname'],
          data['upvCount'], 
          );
          print('${course.cname}');
          this.alldata.add(course);
      
    });
    setState(() {
     print('length ${alldata.length}');
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home:Scaffold(
      appBar: AppBar(title: Text('Firebase data'),),
      body: Container(
        child: alldata.length==0? Text('No data is available')
        :ListView.builder(
          itemCount: alldata.length,
          itemBuilder: (_,index){
            return UI(
              alldata[index].cname
            );
          },
        ),
      ),
      )
    );
  }
  Widget UI(String Cname){
    return Card(
      elevation: 10.0,
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('CName: $Cname',style: Theme.of(context).textTheme.title),
          ],
        ),
      ),
    );
  }

}

  /*@override
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
}*/
