<<<<<<< HEAD
import 'package:aotfanpage/Screens/authenticate/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
=======
import 'package:firebase_core/firebase_core.dart';
import 'package:aotfanpage/myhomepage.dart';
import 'package:flutter/material.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
>>>>>>> 46cffc2ef312b1cfe99b3bb19cf08a59bfdf57dd
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _intialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
<<<<<<< HEAD
      home: LoginScreen(),
=======
      home: FutureBuilder(
        future: _intialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Error");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MyHomePage(title: 'Flutter Demo Home Page');
          }
          return CircularProgressIndicator();
        },
      )
>>>>>>> 46cffc2ef312b1cfe99b3bb19cf08a59bfdf57dd
    );
  }
}
