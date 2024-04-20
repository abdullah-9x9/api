import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Signin extends StatefulWidget {
  final String role;
  const Signin({required this.role, super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool langu = false;
  bool _isChecked = false;
  bool obscureText = true;
  bool value = false;
  bool isenglish = true;
  bool isurdu = false;
  @override
  void initState() {
    super.initState();
    loadUserEmailPassword();

    // getlogin();
  }

  void handleRemeberme(bool value) {
   
  }

  void loadUserEmailPassword() async {
   
    print("Load Email");
    try {
     
  

   {
        setState(() {
          print('helloo how are you ?');
          _isChecked = true;
        });
      
      }
    } catch (e) {
      print(e);
    }
  }

  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    
       
      setState(() {});
    } else {
      setState(() {
        isSwitched = false;

        print(isSwitched);
      });
    
      setState(() {});
    }
  }

//   getlogin() async{
//  if(DataBoxes.ins.getData('userlogin')!=null) {
//       var decode=await json.decode( DataBoxes.ins.getData('userlogin'));
//        loginData = LoginModal.fromJson(decode);          ;
//       if (loginData!.roleName == 'Parent') {
//           MyNavigation().push(context, BottomNavBar());
//         } else {
//           MyNavigation().push(context, TeacherHome());
//         }

//     }
//   }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 10),
        
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/icons/signin.png'),
                  fit: BoxFit.fill)),
          child: Stack(
            children: [
              Container(
              
                // width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                        ""
                        ),
                        fit: BoxFit.contain),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              ),
              // Container(
              //   margin: const EdgeInsets.only(left: 100, top: 70),
              //   height: Utility.screenHeight(context) * 0.1,
              //   width: Utility.screenWidth(context) * 0.5,
              //   decoration: const BoxDecoration(
              //       // color: Colors.red,
              //       image: DecorationImage(
              //           image: AssetImage('assets/icons/school_final_logo.png'))),
              // ),

              Container(
                margin: const EdgeInsets.fromLTRB(25, 200, 25, 0),
               
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                     
                      SizedBox(
                        height: 15,
                      ),

                      CupertinoTeFormField(
                        height: 45,
                       
                     
                        hintcolor: Colors.grey,
                        keyboardtype: TextInputType.name,
                        border: Border.all(width: 0.7, color: Colors.black54),
                        borderradius: BorderRadius.circular(10),
                        prefixicon: Icons.person, controller: null, sufixFunction: () {  }, 
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFieldWidget(
                        height: 45,
                        secure: obscureText,
                        
                        hintcolor: Colors.grey,
                        suffixicon: obscureText
                            ? Icons.visibility
                            : Icons.visibility_off,
                        sufixFunction: () {
                          setState(() {
                            if (!obscureText) {
                              obscureText = true;
                            } else {
                              obscureText = false;
                            }
                          });
                        },
                        keyboardtype: TextInputType.name,
                        border: Border.all(width: 0.7, color: Colors.black54),
                        borderradius: BorderRadius.circular(10),
                        prefixicon: Icons.lock_outline, controller: null,
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Row(
                        children: [
                          Checkbox(
                            value: _isChecked,
                            side: const BorderSide(
                                width: 1.5, color: Color(0xff4C7BBA)),
                            onChanged: (value) {
                              setState(() {
                                this.value = value!;

                                handleRemeberme(value);
                              });
                            },
                          ), ],
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      ButtonWidget(
                        height: 40,
                        width: 240,
                        onTab: () {
                        
                        },
                        bgcolor: const Color(0xff4C7BBA),
                        
                        size: 22,
                        fontWeight: FontWeight.bold,
                        textcolor: Colors.white,
                        borderradius: BorderRadius.circular(30),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                langu = true;
                              });
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.language,
                                    color: Color(0xff4C7BBA),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                 
                                  SizedBox(
                                    width: 3,
                                  ),
                                
                                ],
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Switch(
                              onChanged: toggleSwitch,
                              value: isSwitched,
                              activeColor: Color(0xff4C7BBA),
                              activeTrackColor: Colors.blue.shade100,
                              inactiveThumbColor: Colors.grey,
                              inactiveTrackColor: Colors.grey[300],
                            ),
                          ),

                          // langu
                          //     ? Card(
                          //         elevation: 5,
                          //         child: Container(
                          //           padding: EdgeInsets.all(10),
                          //           child: Column(
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             children: [
                          //               GestureDetector(
                          //                 onTap: () {
                          //                   Provider.of<LocalizationProvider>(
                          //                           context,
                          //                           listen: false)
                          //                       .setLanguage(Locale('en'));
                          //                   setState(() {
                          //                     langu = false;
                          //                   });
                          //                 },
                          //                 child: Text(
                          //                   getTranslated(
                          //                       LangKeys.english, context),
                          //                   style: TextStyle(
                          //                       letterSpacing: 1,
                          //                       color: getTranslated(
                          //                                   LangKeys.lang,
                          //                                   context) ==
                          //                               "English"
                          //                           ? Color(0xff4C7BBA)
                          //                           : Colors.black,
                          //                       fontWeight: FontWeight.bold),
                          //                 ),
                          //               ),
                          //               SizedBox(
                          //                 height: 10,
                          //               ),
                          //               GestureDetector(
                          //                 onTap: () {
                          //                   Provider.of<LocalizationProvider>(
                          //                           context,
                          //                           listen: false)
                          //                       .setLanguage(Locale('ur'));
                          //                   setState(() {
                          //                     langu = false;
                          //                   });
                          //                 },
                          //                 child: Text(
                          //                   getTranslated(
                          //                       LangKeys.urdu, context),
                          //                   style: TextStyle(
                          //                       letterSpacing: 1,
                          //                       color: getTranslated(
                          //                                   LangKeys.lang,
                          //                                   context) ==
                          //                               "English"
                          //                           ? Colors.black
                          //                           : const Color(0xff4C7BBA),
                          //                       fontWeight: FontWeight.bold),
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       )
                          //     : Container()
                        ],
                      ),

                      // Container(
                      //   height: 50,
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(15)),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       GestureDetector(
                      //         onTap: () {
                      //           setState(() {
                      //             isenglish = true;
                      //             isurdu = false;
                      //           });
                      //           Provider.of<LocalizationProvider>(context,
                      //                   listen: false)
                      //               .setLanguage(Locale('en'));
                      //         },
                      //         child: Container(
                      //           height: 35,
                      //           width: 80,
                      //           decoration: BoxDecoration(
                      //               border: Border.all(
                      //                 color: getTranslated(
                      //                             LangKeys.lang, context) ==
                      //                         "English"
                      //                     ? const Color(0xff4C7BBA)
                      //                     : Colors.white,
                      //               ),
                      //               borderRadius: BorderRadius.circular(10)),
                      //           child: Center(
                      //               child: Text(
                      //             getTranslated(LangKeys.english, context),
                      //             style: TextStyle(
                      //                 letterSpacing: 1,
                      //                 color: getTranslated(
                      //                             LangKeys.lang, context) ==
                      //                         "English"
                      //                     ? Color(0xff4C7BBA)
                      //                     : Colors.black,
                      //                 fontWeight: FontWeight.bold),
                      //           )),
                      //         ),
                      //       ),
                      //       GestureDetector(
                      //         onTap: () {
                      //           Provider.of<LocalizationProvider>(context,
                      //                   listen: false)
                      //               .setLanguage(Locale('ur'));
                      //           setState(() {
                      //             isenglish = false;
                      //             isurdu = true;
                      //           });
                      //         },
                      //         child: Container(
                      //           height: 35,
                      //           width: 80,
                      //           decoration: BoxDecoration(
                      //               border: Border.all(
                      //                 color: getTranslated(
                      //                             LangKeys.lang, context) ==
                      //                         "English"
                      //                     ? Colors.white
                      //                     : const Color(0xff4C7BBA),
                      //               ),
                      //               borderRadius: BorderRadius.circular(10)),
                      //           child: Center(
                      //             child: Text(
                      //               getTranslated(LangKeys.urdu, context),
                      //               style: TextStyle(
                      //                   letterSpacing: 1,
                      //                   color: getTranslated(
                      //                               LangKeys.lang, context) ==
                      //                           "English"
                      //                       ? Colors.black
                      //                       : const Color(0xff4C7BBA),
                      //                   fontWeight: FontWeight.bold),
                      //             ),
                      //           ),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // )
                      // ButtonWidget(
                      //   onTab: () {},
                      //   text: 'Trouble Signing in?',
                      //   textcolor: const Color(0xff4C7BBA),
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ButtonWidget({required int height, required int width, required Null Function() onTab, required Color bgcolor, required int size, required FontWeight fontWeight, required Color textcolor, required BorderRadius borderradius}) {}

  TextFieldWidget({required int height, required bool secure, required controller, required MaterialColor hintcolor, required IconData suffixicon, required Null Function() sufixFunction, required TextInputType keyboardtype, required Border border, required BorderRadius borderradius, required IconData prefixicon}) {}

  CupertinoTeFormField({required int height, required MaterialColor hintcolor, required TextInputType keyboardtype, required Border border, required BorderRadius borderradius, required IconData prefixicon, required controller, required Null Function() sufixFunction}) {}
}