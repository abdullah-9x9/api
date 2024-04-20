import 'package:flutter/material.dart';
import 'package:shared_preference/home_screen.dart';
import 'package:shared_preference/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class screen extends StatefulWidget {
  const screen({super.key});

  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {
  var emailcontroller = TextEditingController();
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "enter your text ",
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setString("email", emailcontroller.text.toString());

                  setState(() {});
                },
                child: Text("submit")),
            SizedBox(
              height: 20,
            ),
            Text(emailcontroller.text),
          ],
        ),
      ),
    );
  }
}

Future<void> getvalue() async {
  var prefs = await SharedPreferences.getInstance();
  var getname = prefs.getString("email");
}
