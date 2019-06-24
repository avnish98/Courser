import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:courser/DB Interface/structures.dart';

class Testing extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: Text('Show data'),),
        body: RaisedButton(
          onPressed: (){
            List<Course> c1;
            DatabaseReference dbref=FirebaseDatabase.instance.reference();
    dbref.child('courses').child('0').once().then((DataSnapshot snap){
        /*Course c;
        c.loadData(snap.value);*/
        var data=snap.value;
        Course c=new Course(
          data['cid'],
           data['cname'], 
           data['uname'], 
           data['desc'],
           data['type'], 
           data['link'], 
           data['platform'], 
           data['upvCount'], 
           data['price'], 
           data['preReq']);
        c1 = [c];
        print('${c1.length}');},

        
          }
        ));
}
}