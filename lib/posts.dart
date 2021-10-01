import 'package:aotfanpage/displayPost.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Post {
  
  List<DisplayPostModel> _postListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return DisplayPostModel(
        uid: doc.id, 
        content: doc['content'] ?? '', 
        datetime: doc['datetime'] ?? 0,
        );
    }).toList();
  }
  
  Future savePost(text) async {
    await FirebaseFirestore.instance.collection("post").add({
      'content': text,
      'uid': FirebaseAuth.instance.currentUser!.uid,
      'datetime': Timestamp.now(),
    });
  }

  Stream<List<DisplayPostModel>> getPosts(uid) {
    return FirebaseFirestore.instance.collection("post").where('uid', isEqualTo: uid).snapshots().map(_postListFromSnapshot);
  }
}