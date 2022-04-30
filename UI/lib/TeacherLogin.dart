import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nmit_hack_code_invaders/readdata%20.dart';
// import 'package:dropdownfield/dropdownfield.dart';
import 'readdata .dart';

class Example extends StatefulWidget {
  Example({Key? key}) : super(key: key);
  // final accountNames = ['CSE', 'ISE', 'AI'];

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  TextEditingController _Dept = TextEditingController();
  TextEditingController _Year = TextEditingController();
  TextEditingController _Sec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Details"),
      ),
      backgroundColor: Colors.amber,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 8,
          ),
          Text(
            "DEPT",
            style: TextStyle(fontSize: 16),
          ),
          TextField(
            controller: _Dept,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.text_fields_outlined),
              border: OutlineInputBorder(),
              hintText: 'Dept',
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'YEAR : ',
            style: TextStyle(fontSize: 16),
          ),
          TextField(
            controller: _Year,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.numbers),
              border: OutlineInputBorder(),
              hintText: 'Year',
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'SEC: ',
            style: TextStyle(fontSize: 16),
          ),
          TextField(
            controller: _Sec,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.tab_outlined),
              border: OutlineInputBorder(),
              hintText: 'Section',
            ),
          ),
          SizedBox(height: 1),
          Text("Signed in as"),
          Text(
            user.email!,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              String? _deptValue = _Dept.text;
              String? _yearValue = _Year.text;
              String? _SecValue = _Sec.text;
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      AddData(_deptValue, _yearValue, _SecValue)));
            },
            child: Text("Check List!"),
          ),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(
                Icons.arrow_back,
                size: 32,
              ),
              label: Text(
                'Sign Out!',
              ))
        ],
      ),
    );
  }
}
