import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preference/data_signin.dart';
import 'package:shared_preference/login.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    super.initState();
    request();
  }
  List<dynamic> userData = [];

   request() async {

    // var response =
    //     http.Request("GET", Uri.parse("https://api.thecodefixer.com/api/user"));
    final response =
        await http.get(Uri.parse('https://api.thecodefixer.com/api/user'));
 print(response);
 print(response.statusCode);

    userData = jsonDecode(response.body);
    // if (response.statusCode == 200) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) =>  storing (),
    //     ),);
    // }


    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/gwen-weustink-I3C1sSXj1i8-unsplash.jpg"),
        fit: BoxFit.cover,
      )
    ),
      child: Scaffold(

        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title:  Center(child: Text('User Data', style:
          TextStyle(  fontWeight:
          FontWeight.bold, color: Colors.black),),
          ),
        ),

        // body: userData.isEmpty
        //     ? Center(child: CircularProgressIndicator())
        //     :
        body:      GridView.builder(
          itemCount: userData.length,
          padding: EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0
          ),
          itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.only(right: 2, left: 2, top: 1, bottom: 1),
            child: Card(
              elevation: 25,
              shadowColor: Colors.green,
              child: Container(

                decoration: BoxDecoration(
                  border:Border.all(color: Colors.black),
                  color: Colors.red.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Name: ${userData[index]['name']}'),
                      Text('Email: ${userData[index]['email']}'),
                      // Text('Password: ${userData[index]['password']}'),
                      // Text('Phone: ${userData[index]['phone']}'),
                      // Text('age: ${userData[index]['age']}'),
                    ],
                  ),
                ),
                ),
            ),
          );
          },
          ),
        drawer: Container(
          width: 270,
          child: Drawer(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.logout_outlined),
                  title: Text("logout"),
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login())
                    );
                  },
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
