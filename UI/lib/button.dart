import 'package:flutter/material.dart';
import 'package:nmit_hack_code_invaders/Login.dart';

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  String _dropdownValueDept = "Select";
  String _dropdownValueYear = "Select";
  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValueDept = selectedValue;
      });
    }
  }

  void dropdownCallbackYear(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValueDept = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("STUDENT DETAILS"),
          backgroundColor: Colors.black12,
          elevation: 0.0,
        ),
        backgroundColor: Color.fromARGB(255, 255, 191, 0),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: SizedBox(
                  child: Text("DEPT"),
                  width: 100,
                  height: 50,
                ),
              ),
              DropdownButton(
                items: const [
                  DropdownMenuItem(child: Text("Select"), value: "Select"),
                  DropdownMenuItem(child: Text("CSE"), value: "CSE"),
                  DropdownMenuItem(child: Text("ISE"), value: "ISE"),
                  DropdownMenuItem(child: Text("AI"), value: "AI"),
                ],
                value: _dropdownValueDept,
                onChanged: dropdownCallback,
              ),
              const Center(
                child: SizedBox(
                  child: Text("YEAR"),
                  width: 100,
                  height: 50,
                ),
              ),
              DropdownButton(
                items: const [
                  DropdownMenuItem(child: Text("Select"), value: "Select"),
                  DropdownMenuItem(child: Text("First"), value: "First"),
                  DropdownMenuItem(child: Text("Second"), value: "Second"),
                  DropdownMenuItem(child: Text("Third"), value: "Third"),
                  DropdownMenuItem(child: Text("Four"), value: "Four"),
                ],
                value: _dropdownValueYear,
                onChanged: dropdownCallbackYear,
              ),
              // DropdownButton<String>(
              //   value: dropdownValue,
              //   icon: const Icon(Icons.arrow_downward),
              //   elevation: 16,
              //   style: const TextStyle(color: Colors.deepPurple),
              //   underline: Container(
              //     height: 2,
              //     color: Colors.deepPurpleAccent,
              //   ),
              //   onChanged: (String? newValue) {
              //     setState(() {
              //       dropdownValue = newValue!;
              //     });
              //   },
              //   items: <String>['Select', 'CSE', 'ISE', 'AD']
              //       .map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              // ),
              // const Center(
              //   child: SizedBox(
              //     child: Text("SECTION"),
              //     width: 100,
              //     height: 50,
              //   ),
              // ),
              // DropdownButton<String>(
              //   value: dropdownValue,
              //   icon: const Icon(Icons.arrow_downward),
              //   elevation: 16,
              //   style: const TextStyle(color: Colors.deepPurple),
              //   underline: Container(
              //     height: 2,
              //     color: Colors.deepPurpleAccent,
              //   ),
              //   onChanged: (String? newValue) {
              //     setState(() {
              //       dropdownValue = newValue!;
              //     });
              //   },
              //   items: <String>['Select', 'CSE', 'ISE', 'AI']
              //       .map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              // ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text("NEXT"))
            ],
          ),
        ),
      ),
    );
  }
}
