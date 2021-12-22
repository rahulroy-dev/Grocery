import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/utils/routes.dart';

import '../constantVarriables.dart';

class PaymentSuccess extends StatefulWidget {
  final String addr;
  final int order_no;
  const PaymentSuccess({Key? key, required this.addr, required this.order_no})
      : super(key: key);

  @override
  _PaymentSuccessState createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  final dbRefPayment = FirebaseDatabase.instance.reference().child('Payment');
  final dbRefAddress = FirebaseDatabase.instance.reference().child('Address');
  final dbRefOrders = FirebaseDatabase.instance.reference().child('Orders');
  final dbRefCart = FirebaseDatabase.instance.reference().child('Carts');
  List paymentKeyList = [];
  List paymentValueList = [];
  List addressValueList = [];
  List cartValueList = [];
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
          stream: dbRefPayment.onValue,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snap) {
            if (snap.hasData &&
                !snap.hasError &&
                snap.data.snapshot.value != null) {
              Map orderValues = snap.data.snapshot.value;
              paymentKeyList.clear();
              paymentValueList.clear();

              orderValues.forEach((key, values) {
                if ((values["user_id"] == preferences!.getString('user_id')) &&
                    values["order_no"] == widget.order_no.toString()) {
                  paymentKeyList.add(key);
                  paymentValueList.add(values);
                  print(paymentValueList);
                }
              });
              return StreamBuilder(
                  stream:
                      dbRefAddress.orderByKey().equalTo(widget.addr).onValue,
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snap) {
                    if (snap.hasData &&
                        !snap.hasError &&
                        snap.data.snapshot.value != null) {
                      Map orderValues = snap.data.snapshot.value;
                      addressValueList.clear();

                      orderValues.forEach((key, values) {
                        // paymentKeyList.add(key);
                        addressValueList.add(values);
                        print(addressValueList);
                      });
                      return StreamBuilder(
                          stream: dbRefCart
                              // .orderByChild("user_id")
                              // .equalTo(preferences!.getString("user_id"))
                              .onValue,
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snap) {
                            if (snap.hasData &&
                                !snap.hasError &&
                                snap.data.snapshot.value != null) {
                              Map orderValues = snap.data.snapshot.value;
                              cartValueList.clear();
                              if (_count == 0) {
                                _count = 1;
                                orderValues.forEach((key, values) {
                                  if (values["user_id"] ==
                                      preferences!.getString("user_id")) {
                                    // paymentKeyList.add(key);
                                    cartValueList.add(values);
                                    print("object");
                                    print(values);
                                    dbRefOrders.push().set({
                                      "menu_rate":
                                          (int.parse(values["quantity"]) *
                                                  int.parse(values["rate"]))
                                              .toString(),
                                      "name": addressValueList[0]["name"],
                                      "order_id": paymentValueList[0]
                                          ["order_no"],
                                      "phone": addressValueList[0]["phone"],
                                      "product_id": values["menu_id"],
                                      "quantity": values["quantity"],
                                      "state": addressValueList[0]["state"],
                                      "street": addressValueList[0]["street"],
                                      "time": DateTime.now().toString(),
                                      "txn_id": paymentKeyList[0],
                                      "user_id":
                                          preferences!.getString("user_id"),
                                      "zip": addressValueList[0]["zip"],
                                      "delevery": "pending"
                                    });
                                    dbRefCart.child(key).remove();
                                  }
                                });
                              }

                              return Container(
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 200,
                                    ),
                                    Container(
                                        alignment: Alignment.center,
                                        height: 300,
                                        width: 300,
                                        child: Image.asset(
                                          "image/payment.gif",
                                          fit: BoxFit.cover,
                                          //scale: 0,
                                        )),
                                    Text(
                                      "Payment Successful!!",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Your payment was sucessfull!, you can\nnow continue using Grocify.",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(height: 100),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, MyRoutes.landingscreen);
                                        },
                                        child: Container(
                                          height: 55,
                                          width: 140,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Go to Home",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              );
                            }
                            return Center(child: CircularProgressIndicator());
                          });
                    }
                    return Center(child: CircularProgressIndicator());
                  });
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
