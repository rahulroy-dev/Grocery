import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'utils/routes.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Color bgcolor = Color(0xFF08db5c);
  bool valuefirst = false;
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 130),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          ),
          padding: EdgeInsets.only(top: 21),
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
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "      \n Sign in with your email and password \n                          to continue",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                alignment: Alignment.topLeft,
              ),
              Form(
                child: Container(
                    margin: EdgeInsets.only(right: 20, left: 22),
                    padding: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "Enter email or phone number",
                        focusedBorder: new UnderlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black),
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
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                alignment: Alignment.topLeft,
              ),
              Form(
                child: Container(
                    margin: EdgeInsets.only(right: 20, left: 22),
                    padding: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      obscureText: !_passwordVisible,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        focusedBorder: new UnderlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black),
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
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                      validator: (value) {
                        return value!.isEmpty ? "Set A Password" : null;
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
                  children: [
                    Checkbox(
                      value: this.valuefirst,
                      onChanged: (bool? value) {
                        setState(() {
                          this.valuefirst = value!;
                        });
                      },
                    ),
                    // Padding(padding: EdgeInsets.only(left: 5)),
                    Text(
                      "Remember me",
                      style: TextStyle(fontSize: 18),
                    ),
                    Padding(padding: EdgeInsets.only(left: 40)),
                    Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.redAccent, fontSize: 18),
                    )
                  ],
                ),
                alignment: Alignment.topLeft,
              ),
              Padding(padding: EdgeInsets.only(top: 50)),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.landingscreen);
                },
                child: Text("Sign In"),
                style: ElevatedButton.styleFrom(
                  primary: bgcolor,
                  fixedSize: Size(350, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
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
                            style: TextStyle(color: bgcolor, fontSize: 19.0),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, MyRoutes.signup);
                          })
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 95,
                  ),
                  Card(
                    elevation: 5,
                    child: Container(
                      height: 50,
                      child: Image.network(
                          'https://i.ibb.co/MMpBmPK/Whats-App-Image-2021-11-23-at-9-09-15-PM.jpg'),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          // BoxShadow(
                          //   color: Colors.black54,
                          //   offset: const Offset(3.0, 3.0),
                          //   blurRadius: 5.0,
                          // )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Card(
                    elevation: 5.0,
                    child: Container(
                      height: 50,
                      child: Image.network(
                          'https://i.ibb.co/y6j9GJR/Whats-App-Image-2021-11-23-at-9-09-14-PM-1.jpg'),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black54,
                        //     offset: const Offset(3.0, 3.0),
                        //     blurRadius: 4.0,
                        //   )
                        // ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Card(
                    elevation: 5,
                    child: Container(
                      height: 50,
                      child: Image.network(
                          'https://i.ibb.co/z2051pT/Whats-App-Image-2021-11-23-at-9-09-40-PM.jpg'),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black54,
                        //     offset: const Offset(3.0, 3.0),
                        //     blurRadius: 5.0,
                        //   )
                        // ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}
