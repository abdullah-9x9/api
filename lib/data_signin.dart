import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preference/list.dart';


class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  getpost() async {
    setState(() {
        loading = true;
    });
    try {
      var headers = {'Content-Type': 'application/application/json'};

      var request = http.Request(
          "POST", Uri.parse("https://api.thecodefixer.com/api/user"));
      // for get api we cant use body
      request.body = jsonEncode({
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "phone": phoneController.text,

      }
      );
      request.headers.addAll(headers);
      http.StreamedResponse streamedResponse = await request.send();
      http.Response response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 201) {
        setState(() {
          loading= false;
        });
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=>home()));


      }
    } catch (e) {}
  }

  // request.headers.addAll (Headers);
  // http.StreamedResponce streamResponce = await request.send();
  // http.Response response = await http.Response.fromStream( StreamedResponce);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Flexible(
          child: Form(
              key: _formKey,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/images/log.png"),
                    fit: BoxFit.cover,
                  )
                ),
                child: Center(
                  child: Container(
                    height: 650,
                    width: 350,
                        color: Colors.blueAccent.withOpacity(0.5),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("sign up", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 40),),
                            SizedBox(height: 30,),
                            TextFormField(
                            validator: (value) {
                  if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                  }
                  return null;
                  },
                              controller: emailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                hintText: "Enter your email",
                                filled: true,
                                fillColor: Colors.lightBlueAccent,
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },

                              controller: nameController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  hintText: "Enter your name",
                                  filled: true,
                                  fillColor: Colors.lightBlueAccent),
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(height: 20),

                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },

                              controller: phoneController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  hintText: "Enter your phone",
                                  filled: true,
                                  fillColor: Colors.lightBlueAccent),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),

                            SizedBox(height: 20),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },

                              controller: passwordController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  hintText: "Enter your password",
                                  filled: true,
                                  fillColor: Colors.lightBlueAccent),
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(height: 20),
                            Flexible(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  loading?Center(child: CircularProgressIndicator()):
                                  ElevatedButton(
                                    onPressed: () {

                                          if (_formKey.currentState!.validate()){
                                          getpost();
                                          }
                                          else{
                                            print('not validateeeeeeeeeeeeeeeeeeeeeeeeee');
                                          }
                                          // getpost();
                                    },
                                    child: Text("Submit"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                ),
              ),
            ),
        ),
    );
  }
}
