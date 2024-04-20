import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preference/data_signin.dart';
import 'package:shared_preference/hm.dart';
class second extends StatefulWidget {
  const second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  TextEditingController emailcontroller = TextEditingController();
  getpost() async {
    try{
      var header = {'content-type': 'application/application/json'};
      var request = http.Request( "POST", Uri.parse(""));
      request.body= jsonEncode({
        "email": emailcontroller.text
      });
   request.headers.addAll(header) ;
    http.StreamedResponse streamedResponse = await request.send();
     http.Response responce = await  http.Response.fromStream(streamedResponse);
     if(responce.statusCode==2002){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>signup()));

     }

    }
    catch(e){ }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
