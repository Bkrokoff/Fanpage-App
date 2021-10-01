import 'package:aotfanpage/Screens/authenticate/registration_screen.dart';
import 'package:aotfanpage/myhomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //email
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          hintText: "Email",
    ));

    //password
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          hintText: "Password",
    ));

    final loginButton = Material(
      color: Colors.blueAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signIn(emailController.text, passwordController.text);
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                      children: <Widget>[
                        SizedBox(
                            height: 200,
                            child: Image.asset(
                              "assets/Fanpage App Logo.png",
                              fit: BoxFit.contain,
                            )),
                        SizedBox(height: 30),
                        emailField,
                        SizedBox(height: 15),
                        passwordField,
                        SizedBox(height: 25),
                        loginButton,
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrationScreen()));
                              },
                              child: Text(
                                "Sign Up",
                              ),
                            )
                          ],
                        )
                      ]),
                ),
              ),
            ),
          ),
        ));
  }
  
  // login function
  void signIn(String email, String password) async {
    if(_formKey.currentState!.validate()) {  
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((uid) => {
          Fluttertoast.showToast(msg: "Login Succesful"),
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyHomePage(title: 'My Home Page',)))
        }).catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
    }
  }
}

