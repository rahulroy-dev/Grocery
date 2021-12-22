import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:grocery_app/utils/colorvar.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  TextEditingController phoneControler = TextEditingController();
  TextEditingController nameControler = TextEditingController();
  //final formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: bg1),
      child: Scaffold(
        backgroundColor: Color(0x00000),
        appBar: AppBar(
          title: Text("Forgot Password"),
          backgroundColor: Color(0x00000),
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autofocus: true,
                    controller: nameControler,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Provide the necessary details.";
                      } else
                        return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        floatingLabelStyle: TextStyle(color: Colors.grey[500]),
                        labelText: "Full Name(Required)*"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autofocus: true,
                    controller: phoneControler,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.length == 10) {
                        return null;
                      } else
                        return "Please Provide the necessary details.";
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        floatingLabelStyle: TextStyle(color: Colors.grey[500]),
                        labelText: "Phone Number(Required)*"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!formkey.currentState!.validate()) {
                        return;
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          gradient: bg1,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
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
