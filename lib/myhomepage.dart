import 'package:flutter/material.dart';

import 'custom/traits.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Trait(
            name: "Eren Yeager",
            color: Color.fromARGB(255, 64, 53, 53),
            url:
                "https://pbs.twimg.com/profile_images/378800000048620046/d3376798c343f3fe582c8649f9cc7773.png"),
        Trait(
            name: "Armin Arlert",
            color: Color.fromARGB(255, 41, 64, 35),
            url:
                "https://pbs.twimg.com/profile_images/378800000074274157/a81dce229a38998645517dec44f9fae0.jpeg"),
        Trait(
            name: "Mikasa Ackerman",
            color: Color.fromARGB(255, 111, 85, 63),
            url:
                "https://pbs.twimg.com/profile_images/378800000064736531/dc2dd12d13015402d2dda5defc71a1cb.png"),
        Trait(
            name: "Levi Ackerman",
            color: Color.fromARGB(255, 210, 196, 174),
            url:
                "https://pbs.twimg.com/profile_images/707651771070619648/w1-fjkaX.jpg"),
        Trait(
            name: "Reiner Braun",
            color: Color.fromARGB(255, 220, 236, 207),
            url:
                "https://pbs.twimg.com/profile_images/378800000743838757/708f33170976fca8f1dfe453e890ba9b.jpeg"),
      ],
    ));
  }
}
