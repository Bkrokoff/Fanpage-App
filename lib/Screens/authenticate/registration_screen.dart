import 'package:aotfanpage/model/user_model.dart';
import 'package:aotfanpage/myhomepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({ Key? key }) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  
  final _auth = FirebaseAuth.instance;

  // our form key
  final _formKey = GlobalKey<FormState>();

  // editing Controller
  final firstNameEditingController = new TextEditingController();
  final lastNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {

    //first name field
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          hintText: "First Name",
      ),
    );

    //last name field
    final lastNameField = TextFormField(
      autofocus: false,
      controller: lastNameEditingController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        lastNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          hintText: "Last Name",
      ),
    );

    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          hintText: "Email",
      ),
    );

    // password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          hintText: "Password",
    ),
    );

    // confirm password field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      validator: (value) {
        if(confirmPasswordEditingController.text != passwordEditingController.text) {
          return "Password does not match";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          hintText: "Confirm Password",
      ),
    );

    //Sign Up Button
    final signUpButton = Material(
      color: Colors.blueAccent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailEditingController.text, passwordEditingController.text);
        },
        child: Text(
          "Sign Up",
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace, color: Colors.blue),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 30),
                        firstNameField,
                        SizedBox(height: 15),
                        lastNameField,
                        SizedBox(height: 15),
                        emailField,
                        SizedBox(height: 15),
                        passwordField,
                        SizedBox(height: 15),
                        confirmPasswordField,
                        SizedBox(height: 15),
                        signUpButton,
                        SizedBox(height: 25),
                      ]),
                ),
              ),
            ),
          ),
        ));
  }

  void signUp(String email, String password) async {
    if(_formKey.currentState!.validate()) {
      await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {postDetailsToFirestore()})
        .catchError((e) {
        Fluttertoast.showToast(msg: e!.mesagge);
      });
    }
  }

  postDetailsToFirestore() async {

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = _auth.currentUser;

  UserModel userModel = UserModel();

  //writing all the values
  userModel.email = user!.email;
  userModel.uid = user.uid;
  userModel.firstName = firstNameEditingController.text;
  userModel.lastName = lastNameEditingController.text;

  await firebaseFirestore
      .collection("users")
      .doc(user.uid)
      .set(userModel.toMap());
  Fluttertoast.showToast(msg: "Account created succesfully");

  Navigator.pushAndRemoveUntil((context), MaterialPageRoute(builder: (context) => MyHomePage(title: "My Home Page")), (route) => false);
  }
}
