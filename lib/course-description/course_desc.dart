import 'package:flutter/material.dart';
import '../BasicUI/basic_ui.dart';
import 'package:courser/API/structures.dart';

class CourseDesc extends StatelessWidget {

  Course currCourse;

  CourseDesc(Course c1){
    this.currCourse = c1;
  }

  @override
  Widget build(BuildContext context) {
    // App bar of Course page
    final courseDescBar = AppBar(
        title: Text(
          "Course Details",
          style: TextStyle(color: Colors.deepPurple),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.deepPurple,
          ),
          onPressed: () {Navigator.pop(context);},
        ));

    // TODO: Return a picture according to type of course
    final courseImage = 0;

    final linkButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.deepPurple,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("LINK",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 21.0, color: Colors.white)),
      ),
    );

    final likeButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {},
          child: Icon(
            Icons.thumb_up,
            color: Colors.deepPurple,
          )),
    );

    final linkAndUpvote = Row(
      children: <Widget>[
        likeButton,
        SizedBox(
          width: 20.0,
        ),
        titleGen("${currCourse.upvCount}", 18.0, FontWeight.bold, Colors.black),
        SizedBox(
          width: 100.0,
        ),
        linkButton
      ],
    );

    // Reviews
    final reviewBox = TextField(
        decoration: InputDecoration(hintText: "Add your comment here....."));

    final reviewSubButton = ButtonGen(context, "SUBMIT REVIEW", Colors.white, Colors.black);

    final reviewContainer = new SizedBox(
        height: 500.0,
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Card(
                    elevation: 5.0,
                    child: Column(
                      children: <Widget>[
                        titleGen("Username", 12.0, FontWeight.bold,
                            Colors.deepPurple),
                        Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ")
                      ],
                    ),
                  ));
            }));

    final spacerCourseDesc = SizedBox(
      height: 20.0,
    );

    return Scaffold(
        appBar: courseDescBar,
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              titleGen("Description", 32.0, FontWeight.bold, Colors.black),
              spacerCourseDesc,
              titleGen("Description", 18.0, FontWeight.bold, Colors.black),
              valueGen('${currCourse.desc}'),
              spacerCourseDesc,
              titleGen("Platform", 18.0, FontWeight.bold, Colors.black),
              valueGen(currCourse.platform),
              spacerCourseDesc,
              titleGen("Pre-Requisites", 18.0, FontWeight.bold, Colors.black),
              valueGen(currCourse.preReq),
              spacerCourseDesc,
              titleGen("Type", 18.0, FontWeight.bold, Colors.black),
              valueGen(currCourse.type),
              spacerCourseDesc,
              titleGen("Price", 18.0, FontWeight.bold, Colors.black),
              valueGen(iffree(currCourse.free)),
              spacerCourseDesc,
              titleGen("Added by",18.0,FontWeight.bold, Colors.black),
              valueGen(currCourse.uname),
              spacerCourseDesc,
              titleGen("Added on",18.0,FontWeight.bold, Colors.black),
              valueGen(currCourse.createdDate),
              spacerCourseDesc,
              linkAndUpvote,
              spacerCourseDesc,
              titleGen("Reviews",18.0,FontWeight.bold, Colors.black),
              reviewBox,
              spacerCourseDesc,
              reviewSubButton,
              spacerCourseDesc,
              titleGen("Reviews", 18.0, FontWeight.bold, Colors.black),
              reviewContainer
            ],
          ),
        )));
  }
}
