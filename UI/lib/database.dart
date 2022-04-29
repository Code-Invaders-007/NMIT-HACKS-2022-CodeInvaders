import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddDate extends StatefulWidget {
  AddDate({Key? key}) : super(key: key);

  @override
  State<AddDate> createState() => _AddDateState();
}

class _AddDateState extends State<AddDate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Demo:   "),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("department")
            .doc("ai")
            .collection("year")
            .doc("1")
            .collection("Section")
            .doc("A")
            .collection("student")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Container(
                child: Center(child: Text(document['name'])),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
