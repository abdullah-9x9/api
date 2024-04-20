import 'package:flutter/material.dart';
import 'package:shared_preference/animation/animation.dart';
import 'package:shared_preference/data_signin.dart';
import 'package:shared_preference/list.dart';
import 'package:shared_preference/login.dart';
import 'package:shared_preference/splashscreen.dart';
// import 'package:shared_preference/data.dart';
// import 'package:shared_preference/data_signin.dart';
// import 'package:shared_preference/home_screen.dart';
// import 'package:shared_preference/list.dart';
// import 'package:shared_preference/login.dart';
// import 'package:shared_preference/signin_screen.dart';
// import 'package:shared_preference/signup.dart';
// import 'package:shared_preference/splashscreen.dart';
// import 'package:shared_preference/store_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
