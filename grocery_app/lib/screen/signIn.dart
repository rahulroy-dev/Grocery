import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery_app/constantVarriables.dart';
import 'package:grocery_app/screen/forgotPass.dart';
//import 'package:grocery_app/home.dart';
import 'package:grocery_app/screen/landingScreen.dart';
import 'package:grocery_app/utils/colorvar.dart';

import '../utils/routes.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool valuefirst = false;
  bool _passwordVisible = false;
  String? mobile, password;
  List userList = [];
  List passList = [];
  List testList = [];
  List keyList = [];
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final dbRefUsers = FirebaseDatabase.instance.reference().child('Users');
  final dbRefCatagories =
      FirebaseDatabase.instance.reference().child('Catagories');
  final dbRefAddress = FirebaseDatabase.instance.reference().child('Address');
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(gradient: bg1),
      child: Scaffold(
          backgroundColor: Color(0x00000),
          body: StreamBuilder(
              stream: dbRefUsers.onValue,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snap) {
                if (snap.hasData &&
                    !snap.hasError &&
                    snap.data.snapshot.value != null) {
                  Map orderValues = snap.data.snapshot.value;
                  userList.clear();
                  keyList.clear();
                  // testList.clear();
                  passList.clear();
                  orderValues.forEach((key, values) {
                    // testList.add(values);
                    userList.add(values["Phone"]);
                    passList.add(values["Password"]);
                    keyList.add(key);
                  });
                  //print(userList);
                  //print(passList);
                  return Container(
                    height: h,
                    margin: EdgeInsets.only(top: 130),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40)),
                    ),
                    padding: EdgeInsets.only(top: 21),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            //width: 390,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Sign in",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "      \n Sign in with your email and password \n                          to continue",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 23),
                            child: Text(
                              "Email/Phone number",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          Form(
                            child: Container(
                                margin: EdgeInsets.only(right: 20, left: 22),
                                padding: EdgeInsets.only(top: 10),
                                child: TextFormField(
                                  controller: phoneController,
                                  textAlignVertical: TextAlignVertical.center,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    hintText: "Enter email or phone number",
                                    focusedBorder: new UnderlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.black),
                                    ),
                                  ),
                                  validator: (value) {
                                    return value!.isEmpty
                                        ? "User Name Can't be Empty"
                                        : null;
                                  },
                                  style: TextStyle(fontSize: 20),
                                )),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 21),
                            child: Text(
                              "Password",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          Form(
                            child: Container(
                                margin: EdgeInsets.only(right: 20, left: 22),
                                padding: EdgeInsets.only(top: 10),
                                child: TextFormField(
                                  controller: passwordController,
                                  obscureText: !_passwordVisible,
                                  textAlignVertical: TextAlignVertical.center,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    hintText: "Enter password",
                                    focusedBorder: new UnderlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.black),
                                    ),
                                    suffixIcon: GestureDetector(
                                      child: IconButton(
                                        icon: Icon(
                                          _passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    return value!.isEmpty
                                        ? "Set A Password"
                                        : null;
                                  },
                                  style: TextStyle(fontSize: 20),
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (contex) => ForgotPass()));
                                  },
                                  child: Text(
                                    "Forgot password?",
                                    style: TextStyle(
                                        color: Colors.redAccent, fontSize: 18),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                )
                              ],
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          Padding(padding: EdgeInsets.only(top: 30)),
                          // Container(
                          //   decoration: BoxDecoration(
                          //       gradient: bg1,
                          //       borderRadius: BorderRadius.circular(10)),
                          //   child: ElevatedButton(
                          //     onPressed: () {
                          //       // Navigator.pushNamed(context, MyRoutes.landingscreen);
                          //       if (phoneController.text.isNotEmpty &&
                          //           passwordController.text.isNotEmpty) {
                          //         // print("Hi");
                          //         for (int i = 0; i < userList.length; i++) {
                          //           if (phoneController.text == userList[i] &&
                          //               passwordController.text ==
                          //                   passList[i]) {
                          //             // print("Hello");
                          //             preferences!.setString("user_id",
                          //                 phoneController.text.toString());
                          //             Navigator.push(
                          //                 context,
                          //                 MaterialPageRoute(
                          //                     builder: (context) =>
                          //                         LandingScreen()));
                          //           } else {
                          //             //break;
                          //           }
                          //         }
                          //       }
                          //     },
                          //     child: Text("Sign In"),
                          //     style: ElevatedButton.styleFrom(
                          //       primary: Color(0x0000),
                          //       elevation: 0,
                          //       fixedSize: Size(350, 40),
                          //       shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(5)),
                          //     ),
                          //   ),
                          // ),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: bg1,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 40,
                              width: 350,
                              child: Center(
                                  child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                            onTap: () {
                              // Navigator.pushNamed(context, MyRoutes.landingscreen);
                              if (phoneController.text.isNotEmpty &&
                                  passwordController.text.isNotEmpty) {
                                // print("Hi");
                                for (int i = 0; i < userList.length; i++) {
                                  if (phoneController.text == userList[i] &&
                                      passwordController.text == passList[i]) {
                                    print(keyList[i]);
                                    preferences!
                                        .setString("user_id", keyList[i]);
                                    Navigator.pushNamed(
                                        context, MyRoutes.landingscreen);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Text(
                                        'Signed in successfully',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ));
                                  } else {
                                    //break;
                                    // ScaffoldMessenger.of(context)
                                    //     .showSnackBar(const SnackBar(
                                    //   backgroundColor: Colors.red,
                                    //   content: Text(
                                    //     'Wrong user id and password',
                                    //     style: TextStyle(fontSize: 18),
                                    //   ),
                                    // ));
                                  }
                                }
                              }
                            },
                          ),
                          Padding(padding: EdgeInsets.only(top: 20)),
                          Container(
                            margin: EdgeInsets.only(left: 50, right: 50),
                            child: Center(
                              child: Row(
                                children: [
                                  Text("Don't have any account?",
                                      style: TextStyle(fontSize: 18)),
                                  Padding(padding: EdgeInsets.only(left: 10)),
                                  GestureDetector(
                                      child: Text(
                                        "  Sign up",
                                        style: TextStyle(
                                            color: bg, fontSize: 19.0),
                                      ),
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, MyRoutes.signup);
                                      })
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),

                          SizedBox(
                            height: 80,
                          )
                        ],
                      ),
                    ),
                  );
                }
                return Center(child: CircularProgressIndicator());
              })),
    );
  }
}
