
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preference/animation/animation.dart';
import 'package:shared_preference/data.dart';
import 'package:shared_preference/list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'package:shared_preference/data_signin.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool loading=false;
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  getpost(BuildContext context) async {
    setState(() {
      loading=true;
    });
    try {
      var headers = {'Content-Type': 'application/application/json'};

      var request = http.Request(
          "POST", Uri.parse("https://api.thecodefixer.com/api/login"));
      // for get api we cant use body
      request.body = jsonEncode({
        "email": emailcontroller.text,
        "password": passwordcontroller.text,

      });
      request.headers.addAll(headers);
      http.StreamedResponse streamedResponse = await request.send();
      http.Response response =
      await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
       final data = jsonDecode(response.body);
       print(data);
       // var prefs = await SharedPreferences.getInstance();
       //  prefs.setString("id", data.id);
       //  prefs.setString("name", data.name);
       //  prefs.setString("email", data.email);
       //  prefs.setString("password",data.name);
       setState(() {
         loading=false;
       });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => home()),
        );
      }
    } catch (e) {}
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getvalue();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/signin.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body:
        Center(
          child: Container(
            color: Colors.lightBlueAccent.shade400.withOpacity(0.6),
            height: 680,
            width: 360,
            child: Form(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Image(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.cover,
                      height: 140,
                      width: 140,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Text(
                      "Login Page",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontFamily: AutofillHints.streetAddressLevel1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        filled: true,
                        fillColor: Colors.lightBlueAccent,
                        prefixIcon: Icon(Icons.email),
                        prefixIconColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        hintText: "Enter your Password",
                        filled: true,
                        fillColor: Colors.lightBlueAccent,
                        prefixIcon: Icon(Icons.lock),
                        prefixIconColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      obscureText: true,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  loading?Center(child: CircularProgressIndicator(

                  )):
                  ElevatedButton(
                    onPressed: () async {
                      getpost(context);



                      setState(() {

                      });

                    },
                    child: Text(
                      "submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => signup(),
                            ),
                          );
                        },
                        child: Text(
                          " Sign Up",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
