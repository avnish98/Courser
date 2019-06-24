import 'package:flutter/material.dart';

// From Courser
import 'package:courser/Basic UI Components/drawer.dart';
import 'package:courser/Basic UI Components/basicUI.dart';
import 'package:courser/DB Interface/structures.dart';
import 'package:firebase_database/firebase_database.dart';
class AddCourses extends StatefulWidget {
  AddCourses({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AddCourseState createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourses> {
   bool _autovalidate = false;
  GlobalKey<FormState> _key = new GlobalKey();  
  

  var _courseTypes = ['Web Development', 'Python', 'Java', 'Flutter'];
  var _courseTypeSelected = 'Web Development';

  var _priceTypes = ['Free', 'Paid'];
  var _priceTypeSelected = 'Free';
  int cid=0;
  String scname,splatform,sprereq,slink,stype,sprice,sdesc;

  final cnameController = TextEditingController();
  final platformController = TextEditingController();
  final prereqController = TextEditingController();
  final linkController = TextEditingController();
  final typeController = TextEditingController();
  final priceController = TextEditingController();
  final descController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // Add courses page ( For any help see : ../BasicUI/basicui.dart)

    // Appbar of add courses page
    final topBar = SecondaryAppBar('Add a new course', _scaffoldKey);

    // Course Name
    final cnameText =
        titleGen("Course Name", 12.0, FontWeight.bold, Colors.grey);

    final cname = TextFormField(
        controller: cnameController,
        validator: (input) {
          if (input.isEmpty) {
            return "Please enter a valid Course name";
          }
        },
        decoration:
            InputDecoration(hintText: "JavaScript for Web Development"),
            onSaved:(val){
              scname=val;
            });

    //Course Platform
    final platformText =
        titleGen("Platform", 12.0, FontWeight.bold, Colors.grey);

    final platform = TextFormField(
        controller: platformController,
        validator: (input) {
          if (input.isEmpty) {
            return "Please enter a valid Platform name";
          }
        },
        decoration: InputDecoration(hintText: "Udacity"),
            onSaved:(val){
              splatform=val;
            });

    // Prerequisites
    final prereqText = titleGen(
        "Pre Requisites for course", 12.0, FontWeight.bold, Colors.grey);

    final prereq = TextFormField(
        controller: prereqController,
        validator: (input) {
          if (input.isEmpty) {
            return "Please enter a valid pre requisites ";
          }
        },
        decoration: InputDecoration(hintText: "Basic knowledge of HTML & CSS"),
            onSaved:(val){
              sprereq=val;
            });

    // Link
    final linkText =
        titleGen("Link to Course", 12.0, FontWeight.bold, Colors.grey);

    final link = TextFormField(
        controller: linkController,
        validator: (input) {
          if (input.isEmpty) {
            return "Please enter a valid Course name";
          }
        },
        decoration: InputDecoration(hintText: "https://www.example.com/"),
            onSaved:(val){
              slink=val;
            });
    

    // Type of Course
    final typeText = titleGen("Type", 12.0, FontWeight.bold, Colors.grey);

    // To change course type on selection from dropdown
    void _onCourseSelected(String newValueSelected) {
      setState(() {
        stype = newValueSelected;
      });
    }

    // DropDown list of types of courses
    final type = Align(
        alignment: Alignment.centerLeft,
        child: DropdownButton<String>(
          items: _courseTypes.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(dropDownStringItem),
            );
          }).toList(),
          onChanged: (String newValueSelected) {
            _onCourseSelected(newValueSelected);
          },
          value: _courseTypeSelected,
        ));

    // Price of Course
    final freeText = titleGen("Price", 12.0, FontWeight.bold, Colors.grey);

    // To change course type on selection from dropdown
    void _onPriceSelected(String newValueSelected) {
      setState(() {
        sprice = newValueSelected;
      });
    }

    // DropDown list of Price (Free or Paid)
    final free = Align(
        alignment: Alignment.centerLeft,
        child: DropdownButton<String>(
          items: _priceTypes.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(dropDownStringItem),
            );
          }).toList(),
          onChanged: (String newValueSelected) {
            _onPriceSelected(newValueSelected);
          },
          value: _priceTypeSelected,
        ));

    // Description
    final descText =
        titleGen("Description", 12.0, FontWeight.bold, Colors.grey);

    final desc = TextFormField(
        controller: descController,
        validator: (input) {
          if (input.isEmpty) {
            return "Please enter a valid description";
          }
        },
        decoration:
            InputDecoration(hintText: "JavaScript is a client side language"),
            onSaved:(val){
              sdesc=val;
            });

    // Padding between textfields
    final spacer = SizedBox(height: 10.0);

    // Submit button
    final sButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.deepPurple,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          writeData();
        },
        child: Text("Add Course",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 21.0, color: Colors.white)),
      ),
    );

    //ButtonGen(context, 'SUBMIT', Colors.white, Colors.deepPurple);
    return Scaffold(
        key: _scaffoldKey,
        appBar: topBar,
        drawer: AppDrawer(),
        body: SingleChildScrollView(
            child:Center(
              
                child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child:Form( 
                         key: _key,
                         autovalidate: _autovalidate,
        
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          cnameText,
                          cname,
                          spacer,
                          platformText,
                          platform,
                          spacer,
                          prereqText,
                          prereq,
                          spacer,
                          linkText,
                          link,
                          spacer,
                          typeText,
                          type,
                          spacer,
                          freeText,
                          free,
                          spacer,
                          descText,
                          desc,
                          spacer,
                          sButton
                        ],
                      ),
                    ))))));
  }
   void writeData(){
        if (_key.currentState.validate()) {
          cid++;
      _key.currentState.save();
      final DatabaseReference ref = FirebaseDatabase.instance.reference();
      var data = {
        "cid":cid,
        "cname": scname,
        "uname":"a",
        "desc":sdesc,
        "type":stype,
        "link":slink,
        "platform":splatform,
        "upvCount":"10",
        "price":sprice,
        "preReq":sprereq,
      };
      ref.child('course').push().set(data).then((v) {
        _key.currentState.reset();
      });
      Navigator.pop(context);
    } 
    else {
      setState(() {
        _autovalidate = true;
      });
    }
  }
}
