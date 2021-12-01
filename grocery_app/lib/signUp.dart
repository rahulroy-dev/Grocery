import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/utils/routes.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

Color bg = Color(0xFF08db5c);
bool _passwordVisible = false;

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final dbRefUsers = FirebaseDatabase.instance.reference().child('Users');
  final dbRefCatagories =
      FirebaseDatabase.instance.reference().child('Catagories');
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Container(
            height: h,
            width: w,
            margin: EdgeInsets.only(top: 25.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 25.0,
                ),
                Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Text(
                    "Sign up with your email and passworde",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
                Center(
                  child: Text(
                    "to continue",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: w * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(fontSize: 20.0, color: Colors.grey),
                      ),
                      TextFormField(
                          controller: nameController,
                          cursorColor: Colors.black,
                          style: TextStyle(fontSize: 20.0),
                          decoration: InputDecoration(
                            hintText: "Enter your name",
                            focusedBorder: new UnderlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.black)),
                          ),
                          validator: (value) {
                            return value!.isEmpty ? "name can't empty" : null;
                          }),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        "Email/Phone number",
                        style: TextStyle(fontSize: 20.0, color: Colors.grey),
                      ),
                      TextFormField(
                          controller: phoneController,
                          cursorColor: Colors.black,
                          style: TextStyle(fontSize: 20.0),
                          decoration: InputDecoration(
                              hintText: "Enter email or phone number",
                              focusedBorder: new UnderlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.black))),
                          validator: (value) {
                            return value!.isEmpty
                                ? "email or phone can't empty"
                                : null;
                          }),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(fontSize: 20.0, color: Colors.grey),
                      ),
                      TextFormField(
                          controller: passwordController,
                          cursorColor: Colors.black,
                          obscureText: !_passwordVisible,
                          style: TextStyle(fontSize: 20.0),
                          decoration: InputDecoration(
                            hintText: "Enter password",
                            focusedBorder: new UnderlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.black)),
                            suffixIcon: IconButton(
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
                          validator: (value) {
                            return value!.isEmpty
                                ? "password can't empty"
                                : null;
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      dbRefCatagories.push().set({
                        "catagories": "Vegitables",
                        "details": "banana,brocoly",
                        "images":
                            "https://i.ibb.co/fpqqNS7/400-good-day-britannia-original-imafwh3rxpqqzzfy.jpg",
                        "status": "Active",
                        "veg": true,
                      });
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: bg,
                        fixedSize: Size(w * 0.8, 35),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)))),
                SizedBox(
                  height: 7.0,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",
                          style: TextStyle(fontSize: 18.0)),
                      GestureDetector(
                          child: Text(
                            "  Sign in",
                            style: TextStyle(color: bg, fontSize: 19.0),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, MyRoutes.signin);
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
