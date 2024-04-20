import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var namecontroller = TextEditingController();
  var namevalue = "no value saved";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getvalue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: TextField(
                controller: namecontroller,
                decoration: InputDecoration(
                    hintText: "Text",
                    filled: true,
                    fillColor: Colors.greenAccent,
                    hoverColor: Colors.yellow,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                keyboardType: TextInputType.text,
                // onChanged: (value) {
                //   setState(() {});
                // },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  // print("calleddddddd");
                  // var name = namecontroller.text.toString();
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setString("name", namecontroller.text.toString());
                  setState(() {});
                },
                child: Text(
                  "submit",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 20,
            ),
            Text(namecontroller.text),
          ],
        ),
      ),
    );
  }
}

Future<void> getvalue() async {
  print("function calleddddddddd");
  var prefs = await SharedPreferences.getInstance();
  var getname = prefs.getString("name");
  print("this is local storage value  $getname");
}
