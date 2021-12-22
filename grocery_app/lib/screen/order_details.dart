import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/utils/colorvar.dart';

import '../constantVarriables.dart';

class OrderDetails extends StatefulWidget {
  final String orderNo;
  const OrderDetails({Key? key, required this.orderNo}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  List<String> orderitemName = ["Orange", "BB Bakery Biscuit", "Apple"];
  List<int> orderitemNumber = [1, 1, 1];
  List<String> orderitemMRP = [
    "40.00",
    "40.00",
    "40.00",
  ];
  List<String> orderitemPrice = [
    "30.00",
    "30.00",
    "30.00",
  ];
  var item_total = "00.00";
  var DeliveryCharge = "70.00";
  var SGST = "00.00";
  var IGST = "00.00";
  var GrandTotal = "00.00";
  var totalSavimgs = "00.00";
  var oderNumber = "#1";
  // var paytyp = "Online Payment";
  // var oderDate = "";
  // var conNumber = "";
  // var address = "";
  final dbRefOrder = FirebaseDatabase.instance.reference().child('Orders');
  List orderValueList = [];
  double total = 0;
  final dbRefProducts = FirebaseDatabase.instance.reference().child('Products');
  List productsValueList = [];
  double discount = 0;
  List disList = [];
  List quanList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: bg1),
      child: Scaffold(
        backgroundColor: Color(0x00000),
        appBar: AppBar(
          backgroundColor: Color(0x00000),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Order Details",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left,
              size: 30,
            ),
          ),
          bottom: const PreferredSize(
              child: SizedBox(
                height: 0,
              ),
              preferredSize: Size.fromHeight(5)),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 13,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: StreamBuilder<Object>(
                      stream: dbRefOrder.onValue,
                      builder:
                          (BuildContext context, AsyncSnapshot<dynamic> snap) {
                        if (snap.hasData &&
                            !snap.hasError &&
                            snap.data.snapshot.value != null) {
                          Map orderValues = snap.data.snapshot.value;
                          print(orderValueList.length);
                          orderValueList.clear();
                          total = 0;
                          orderValues.forEach((key, values) {
                            if (values["user_id"] ==
                                    preferences!.getString('user_id') &&
                                values["order_id"] == widget.orderNo) {
                              //addressList.add(values);
                              //keyList.add(key);
                              print(widget.orderNo);
                              orderValueList.add(values);
                              print("hii");
                              print(orderValueList);
                              total += double.parse(values["menu_rate"]);
                            }
                          });
                          return Container(
                            margin: const EdgeInsets.only(
                                top: 15.0, right: 5, left: 5),
                            child: ListView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        top: 2.0,
                                        left: 7.0,
                                      ),
                                      child: Text(
                                        "This order is not delivered",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    const Divider(
                                      color: Colors.black45,
                                      height: 5,
                                      thickness: 1,
                                      indent: 5,
                                      endIndent: 5,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 5.0, left: 5.0),
                                      child: Text(
                                        "Your Order",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Card(
                                        elevation: 8.0,
                                        color: Colors.grey.shade200,
                                        child: Column(
                                          children: [
                                            Column(
                                                children: List.generate(
                                                    orderValueList.length,
                                                    (index) => StreamBuilder(
                                                        stream: dbRefProducts
                                                            .orderByKey()
                                                            .equalTo(
                                                                orderValueList[
                                                                        index][
                                                                    "product_id"])
                                                            .onValue,
                                                        builder: (BuildContext
                                                                context,
                                                            AsyncSnapshot<
                                                                    dynamic>
                                                                snap) {
                                                          if (snap.hasData &&
                                                              !snap.hasError &&
                                                              snap.data.snapshot
                                                                      .value !=
                                                                  null) {
                                                            Map orderValues =
                                                                snap
                                                                    .data
                                                                    .snapshot
                                                                    .value;
                                                            print(orderValueList
                                                                .length);
                                                            productsValueList
                                                                .clear();

                                                            orderValues.forEach(
                                                                (key, values) {
                                                              productsValueList
                                                                  .add(values);
                                                              discount += double
                                                                      .parse(values[
                                                                          "price"]) *
                                                                  double.parse(
                                                                      orderValueList[
                                                                              index]
                                                                          [
                                                                          "quantity"]);
                                                            });
                                                            return Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Text(
                                                                    productsValueList[
                                                                            0][
                                                                        "name"],
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            17),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      margin: const EdgeInsets
                                                                              .symmetric(
                                                                          horizontal:
                                                                              8.0,
                                                                          vertical:
                                                                              5.0),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Container(
                                                                              height: 30,
                                                                              width: 30,
                                                                              decoration: BoxDecoration(
                                                                                color: Colors.white,
                                                                                borderRadius: BorderRadius.circular(100),
                                                                              ),
                                                                              child: Center(
                                                                                  child: Text(
                                                                                orderValueList[index]["quantity"],
                                                                                style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                                                                              )),
                                                                            ),
                                                                          ),
                                                                          const Text(
                                                                            "X ",
                                                                            style:
                                                                                TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                                                                          ),
                                                                          const Text(
                                                                            " ₹ ",
                                                                            style:
                                                                                TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
                                                                          ),
                                                                          Text(
                                                                            double.parse(productsValueList[0]["sell_rate"]).toStringAsFixed(2),
                                                                            style:
                                                                                const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                5,
                                                                          ),
                                                                          Text(
                                                                            "₹ ",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 15.0,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            double.parse(productsValueList[0]["price"]).toStringAsFixed(2),
                                                                            style:
                                                                                const TextStyle(fontSize: 20.0, decoration: TextDecoration.lineThrough),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: const EdgeInsets
                                                                              .symmetric(
                                                                          horizontal:
                                                                              8.0,
                                                                          vertical:
                                                                              5.0),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          const Text(
                                                                            "  ₹ ",
                                                                            style:
                                                                                TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(left: 2, right: 8.0),
                                                                            child:
                                                                                Text(
                                                                              double.parse(orderValueList[index]["menu_rate"]).toStringAsFixed(2),
                                                                              style: const TextStyle(fontSize: 21.0, fontWeight: FontWeight.w800),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                const Divider(
                                                                  color: Colors
                                                                      .black45,
                                                                  height: 5,
                                                                  thickness: 1,
                                                                  indent: 5,
                                                                  endIndent: 5,
                                                                ),
                                                              ],
                                                            );
                                                          }
                                                          return Center(
                                                              child:
                                                                  Container());
                                                        }))),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Item Total",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                      Text(
                                                        "₹ " +
                                                            total
                                                                .toStringAsFixed(
                                                                    2),
                                                        style: const TextStyle(
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "CGST",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                      Text(
                                                        "00.00",
                                                        style: const TextStyle(
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "IGST",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                      Text(
                                                        "00.00",
                                                        style: const TextStyle(
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Delivery Charge",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                      Text(
                                                        "00.00",
                                                        style: const TextStyle(
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Divider(
                                              color: Colors.black45,
                                              height: 5,
                                              thickness: 1,
                                              indent: 5,
                                              endIndent: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Grand Total",
                                                    style: TextStyle(
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "₹ " +
                                                        total
                                                            .toStringAsFixed(2),
                                                    style: const TextStyle(
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 10.0,
                                                  right: 8.0,
                                                  left: 8.0,
                                                  top: 5.0),
                                              decoration: BoxDecoration(
                                                  gradient: bg1,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  // const Padding(
                                                  //   padding:
                                                  //       EdgeInsets.all(8.0),
                                                  //   child: Text(
                                                  //     "Your total savings",
                                                  //     style: TextStyle(
                                                  //       color: Colors.white,
                                                  //       fontSize: 17.0,
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  // Padding(
                                                  //   padding:
                                                  //       const EdgeInsets.all(
                                                  //           8.0),
                                                  //   child: Text(
                                                  //     "₹ " +
                                                  //         discount.toString(),
                                                  //     style: const TextStyle(
                                                  //       color: Colors.white,
                                                  //       fontSize: 17.0,
                                                  //     ),
                                                  //   ),
                                                  // )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Order Details",
                                        style: TextStyle(
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    const Divider(
                                      color: Colors.black45,
                                      height: 5,
                                      thickness: 1,
                                      indent: 5,
                                      endIndent: 5,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Order Number",
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8.0),
                                                child: Text(
                                                  "#" +
                                                      widget.orderNo.toString(),
                                                  style: TextStyle(
                                                      fontSize: 17.0,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                              Text(
                                                "Payment",
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 8.0),
                                                child: Text("Online Payment",
                                                    style: TextStyle(
                                                        fontSize: 17.0,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Date",
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8.0),
                                                child: Text(
                                                    orderValueList[0]["time"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 17.0,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ),
                                              Text(
                                                "Mobile Number",
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 8.0),
                                                child: Text(
                                                    orderValueList[0]["phone"],
                                                    style: TextStyle(
                                                        fontSize: 17.0,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Deliver to",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 8.0, bottom: 15.0),
                                            child: Text(
                                                orderValueList[0]["street"] +
                                                    "," +
                                                    orderValueList[0]["zip"] +
                                                    "," +
                                                    orderValueList[0]["state"],
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
