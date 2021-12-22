import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/constantVarriables.dart';
import 'package:grocery_app/screen/paymentsuccess.dart';
import 'package:grocery_app/utils/colorvar.dart';

enum PaymentMthods { Card, Cod, Paypal, Gpay }

class PaymentPage extends StatefulWidget {
  final double total;
  final String addr;

  const PaymentPage({
    Key? key,
    required this.total,
    required this.addr,
  }) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final dbRefPayment = FirebaseDatabase.instance.reference().child('Payment');
  List keyList = [];
  int order_no = 0;
  List Modes = [
    "Credit/Debit Card",
    "Cash On Delivery",
    "Paypal",
    "Google Pay",
  ];
  PaymentMthods _modes = PaymentMthods.Card;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(gradient: bg1),
      child: Scaffold(
        backgroundColor: Color(0x00000),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0x00000),
          title: Text(
            "Payment",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                size: 30,
              )),
        ),
        body: StreamBuilder(
            stream: dbRefPayment.onValue,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snap) {
              if (snap.hasData &&
                  !snap.hasError &&
                  snap.data.snapshot.value != null) {
                Map orderValues = snap.data.snapshot.value;
                keyList.clear();
                order_no = 0;
                orderValues.forEach((key, values) {
                  if (values["user_id"] == preferences!.getString('user_id')) {
                    keyList.add(key);
                    order_no = (keyList.length);
                    print(order_no);
                  }
                });
                return SingleChildScrollView(
                  child: Container(
                    height: h,
                    width: w,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40.0)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Choose your Payment\n             Method",
                                    style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  )),
                              // Text("Choose your Payment\nMethod")
                            ],
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 60),
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Row(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           children: [
                          //             Text("Credit/Debit Card",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),)
                          //           ],
                          //         ),

                          //  ListView(
                          //    scrollDirection: Axis.vertical,
                          //    children:
                          //     List.generate(Modes.length, (index) =>
                          //      Card(
                          //        child:
                          //        Container(
                          //          child:Padding(padding: EdgeInsets.only(top: 15),
                          //          child:
                          //          Container(
                          //            width: w,
                          //            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
                          //          )
                          //           ,
                          //          ),
                          //        )
                          //         ,
                          //      )
                          //     ),

                          //  ),

                          //     ],
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 7.0),
                                        child: const Text(
                                          'Credit/Debit Card',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Image.network(
                                          "https://i.ibb.co/HGnwh65/card.jpg",
                                          height: 30,
                                          width: 80,
                                        ),
                                      ),
                                    ],
                                  ),
                                  leading: Radio(
                                    value: PaymentMthods.Card,
                                    groupValue: _modes,
                                    onChanged: (PaymentMthods? value) {
                                      setState(() {
                                        _modes = value!;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    height: 2,
                                    width: w,
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 7.0),
                                        child: const Text(
                                          'Cash On Delivery',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: Image.network(
                                          "https://i.ibb.co/kmzwPmD/cod.png",
                                          height: 50,
                                          width: 100,
                                        ),
                                      )
                                    ],
                                  ),
                                  leading: Radio(
                                    value: PaymentMthods.Cod,
                                    groupValue: _modes,
                                    onChanged: (PaymentMthods? value) {
                                      setState(() {
                                        _modes = value!;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    height: 2,
                                    width: w,
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 7.0),
                                        child: const Text(
                                          'PayPal',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 2.0, left: 80),
                                        child: Image.network(
                                          "https://i.ibb.co/H7Zm0V5/paypal.jpg",
                                          height: 50,
                                          width: 120,
                                        ),
                                      )
                                    ],
                                  ),
                                  leading: Radio(
                                    value: PaymentMthods.Paypal,
                                    groupValue: _modes,
                                    onChanged: (PaymentMthods? value) {
                                      setState(() {
                                        _modes = value!;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    height: 2,
                                    width: w,
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 7.0),
                                        child: const Text(
                                          'Gpay Wallet',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 2.0, left: 30),
                                        child: Image.network(
                                          "https://i.ibb.co/tXMVfqK/gpay.jpg",
                                          height: 50,
                                          width: 120,
                                        ),
                                      )
                                    ],
                                  ),
                                  leading: Radio(
                                    value: PaymentMthods.Gpay,
                                    groupValue: _modes,
                                    onChanged: (PaymentMthods? value) {
                                      setState(() {
                                        _modes = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 60),
                          GestureDetector(
                            onTap: () {
                              dbRefPayment.push().set({
                                "user_id": preferences!.getString("user_id"),
                                "txn_id": dbRefPayment.key,
                                "amount": widget.total,
                                "order_no": (keyList.length + 1).toString(),
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentSuccess(
                                            addr: widget.addr,
                                            order_no: order_no,
                                          )));
                            },
                            child: Container(
                              height: 50, width: 320,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: bg1,
                              ),
                              child: Center(
                                  child: Text(
                                "Make Payment",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              )),

                              //col
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );

                // Container(
                //   child: Center(
                //       child: GestureDetector(
                //           onTap: () {
                //             dbRefPayment.push().set({
                //               "user_id": preferences!.getString("user_id"),
                //               "txn_id": dbRefPayment.key,
                //               "amount": widget.total,
                //               "order_no": (keyList.length + 1).toString(),
                //             });
                //             Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) => PaymentSuccess(
                //                           addr: widget.addr,
                //                           order_no: order_no,
                //                         )));
                //           },
                //           child: Text(widget.total.toString() + widget.addr))),
                // );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
