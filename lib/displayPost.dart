import 'package:cloud_firestore/cloud_firestore.dart';

class DisplayPostModel {
  final String uid;
  final String content;
  final String datetime;
  DisplayPostModel({required this.uid, required this.content, required this.datetime});
}