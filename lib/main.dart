import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        title: 'Courser',
        home: MyHomePage(title:"Login page"),
        debugShowCheckedModeBanner: false,
      )
  );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Roboto', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {

    final TField =  TextField();
    final LButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.purple,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("SIGN IN",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 21.0,color: Colors.white)),
      ),
    );

    final SignUp= Align(
      alignment: Alignment.center,
      child: Container(
          child:Text("SIGN UP FOR AN ACCOUNT",
            style: TextStyle(fontSize: 12.0,color: Colors.grey, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          )
      ),
    );

    final PassWordText = Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child: Text(
          "Password",
          style: TextStyle(color: Colors.grey, fontFamily: "Roboto", fontSize: 12.0, fontWeight: FontWeight.bold),
        ),
      ),
    );

    final SignIn = Align(
      alignment: Alignment.center,
      child: Container(
        child: Text(
          "Sign in to continue",
          style: TextStyle(color: Colors.grey, fontFamily: "Roboto", fontSize: 14.0, fontWeight: FontWeight.w400),
        ),
      ),
    );

    final UNameText =  Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child: Text(
          "Username",
          style: TextStyle(color: Colors.grey, fontFamily: "Roboto", fontSize: 12.0, fontWeight: FontWeight.bold),
        ),
      ),
    );

    final Welcome = Align(
      alignment: Alignment.center,
      child: Container(
        child: Text(
          "Welcome to Courser",
          style: TextStyle(color: Colors.purple, fontFamily: "Roboto", fontSize: 21.0),
        ),
      ),
    );

    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 35.0,
                    ),
                    Welcome,
                    SizedBox(
                      height: 5.0,
                    ),
                    SignIn,
                    SizedBox(
                      height: 220.0,
                    ),
                    SizedBox(height: 45.0),
                    UNameText,
                    TField,
                    SizedBox(height: 15.0),
                    PassWordText,
                    TField,
                    SizedBox(
                      height: 10.0,
                    ),
                    LButton,
                    SizedBox(
                      height: 10.0,
                    ),
                    SignUp,
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}