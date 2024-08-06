import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TodoController {
  TextEditingController titleTEC = TextEditingController();
  CollectionReference user = FirebaseFirestore.instance.collection('user');
  final Stream<QuerySnapshot> userStream =
      FirebaseFirestore.instance.collection('user').snapshots();

  void addUser() {
    user.add({'name': titleTEC.text});
    titleTEC.clear();
  }
}
