import 'package:aotfanpage/Screens/authenticate/login_screen.dart';
import 'package:aotfanpage/displayPost.dart';
import 'package:aotfanpage/makepost.dart';
import 'package:aotfanpage/posts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'model/user_model.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
<<<<<<< HEAD
  
  verifyPopUp(BuildContext context) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Are you sure you want to log out?"),
        actions: <Widget> [
          MaterialButton(
            elevation: 5.0,
            child: Text('Yes'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          )
        ],
      );
    });
  }
=======
>>>>>>> 46cffc2ef312b1cfe99b3bb19cf08a59bfdf57dd

  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace, color: Colors.blue),
            onPressed: () {
              verifyPopUp(context);
            },
          ),
        ),
      
       floatingActionButton: FloatingActionButton(
         onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MakePost()));
         },
         child: Icon(Icons.add),
       ), 
      
    );
    
  }

}
