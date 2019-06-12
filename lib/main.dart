import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Root Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appbar: Appbar(
            title: Text('Login page')
        ),
        body: container(
            child: column(
              children: <Widget>[

                Textfield(
                    decoration: InputDecoration(
                        labelText: 'Username',
                        hintText: 'enter a specific name e.g. abc1200 '
                    )

                )
              ],
            )
        )
    )
  }
}
      //title: '',
      //theme: ThemeData(
        //primarySwatch: Colors.blue,
      //),
      //body:
    //);
  //}
//}
