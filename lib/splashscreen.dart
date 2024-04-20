import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preference/list.dart';
import 'package:shared_preference/login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
          () {
        getValues();
      },
    );
  }

  Future<void> getValues() async {
    print("Print function");
    var prefs = await SharedPreferences.getInstance();
    var getname = prefs.getString("name");
    var getemail = prefs.getString("email");
    var getid = prefs.getString("id");
print(getemail);
    if (getid != null && getemail != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => home()), // Navigate to your home screen
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => login()), // Navigate to your login screen
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/skp.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image(
            image: AssetImage("assets/images/logo.png"),
            height: 190,
            width: 190,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
