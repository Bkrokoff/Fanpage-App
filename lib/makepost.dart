import 'package:aotfanpage/Screens/authenticate/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:aotfanpage/posts.dart';


class MakePost extends StatefulWidget {
  const MakePost({ Key? key }) : super(key: key);

  @override
  _MakePostState createState() => _MakePostState();
}

class _MakePostState extends State<MakePost> {
  final Post _post = Post();
  String text = '';
  /*verifyPopUp(BuildContext context) {
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
  } */
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Make a Post"),
          actions: <Widget> [
            TextButton(
              onPressed: () async {
                _post.savePost(text);
                Navigator.pop(context);
              }, 
              child: Text("Post")),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace, color: Colors.blue),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: new Form(child: TextFormField(
            onChanged: (val) {
              setState(() {
                text = val;
              });
            },
          )),
        ),
    );
  }
}