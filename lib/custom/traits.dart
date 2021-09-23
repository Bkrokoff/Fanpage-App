import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Trait extends StatelessWidget {
  Trait({Key? key, required this.name, this.url = "", required this.color})
      : super(key: key);
  final String name;
  final String url;
  final Color color;
  final double imageHeight = 200.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: color,
      child: Column(children: [
        Padding(
            padding: EdgeInsets.all(20),
            child: url != ""
                ? Image.network(url, height: imageHeight)
                : Placeholder(
                    fallbackHeight: imageHeight,
                  )),
        Container(
          color: Colors.white.withAlpha(200),
          child: Text(name, style: TextStyle(color: color, fontSize: 36, fontWeight: FontWeight.w700)))
      ]),
    );
  }
}
