// import 'package:flutter/material.dart';
// import 'package:shared_preference/login.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class main_screen extends StatefulWidget {
//   const main_screen({super.key});

//   @override
//   State<main_screen> createState() => _main_screenState();
// }

// class _main_screenState extends State<main_screen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.greenAccent.withOpacity(0.5),
//         title: Container(
//           height: 50,
//           child: TextFormField(
//             decoration: InputDecoration(
//                 hintText: "search",
//                 filled: true,
//                 fillColor: Colors.white70,
//                 suffixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 )),
//           ),
//         ),
//         actions: [
//           IconButton(onPressed: () {}, icon: Icon(Icons.doorbell_outlined)),
//           IconButton(onPressed: () {}, icon: Icon(Icons.location_on))
//         ],
//       ),
//       drawer: Drawer(
//         width: 250,
//         child: ListView(
//           children: [
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text("home "),
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (Context) => main_screen()));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.arrow_back),
//               title: Text("logout "),
//               onTap: () {
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (Context) => login()));
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// Future<void> getvalue() async {
//   print("function calleddddddddd");
//   var prefs = await SharedPreferences.getInstance();
//   var getname = prefs.getString("name");
//   print("this is local storage value  $getname");
// }
