import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddData extends StatelessWidget {
  late String depat, year, section;
  AddData(this.depat, this.year, this.section);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Attendance:   "),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('department')
            .doc(depat.toString())
            .collection('Year')
            .doc(year.toString())
            .collection('Section')
            .doc(section.toString())
            .collection('student')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Column(
                children: [
                  Container(
                    child: Center(
                      child: Text(data['student_name'],
                          style: TextStyle(fontSize: 30.0)),
                    ),
                  ),
                  Container(
                    child: Center(child: Text(data['present'])),
                  )
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
