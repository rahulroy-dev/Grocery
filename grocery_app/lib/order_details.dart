import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  Color bgColor = const Color(0xff3ED857);

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Order Details",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () {},
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
        color: bgColor,
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
                child: Container(
                  margin: const EdgeInsets.only(top: 15.0, right: 5, left: 5),
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
                            padding: EdgeInsets.only(top: 5.0, left: 5.0),
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
                                          orderitemName.length,
                                          (index) => Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      orderitemName[index],
                                                      style: const TextStyle(
                                                          fontSize: 17),
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
                                                            horizontal: 8.0,
                                                            vertical: 5.0),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Container(
                                                                height: 30,
                                                                width: 30,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              100),
                                                                ),
                                                                child: Center(
                                                                    child: Text(
                                                                  orderitemNumber[
                                                                          index]
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          20.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                )),
                                                              ),
                                                            ),
                                                            const Text(
                                                              "X ",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      18.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            const Text(
                                                              " ₹ ",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      17.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            Text(
                                                              orderitemMRP[
                                                                      index]
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  fontSize:
                                                                      20.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 8.0,
                                                            vertical: 5.0),
                                                        child: Row(
                                                          children: [
                                                            const Text(
                                                              "₹ ",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      15.0,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 2.0,
                                                                      right:
                                                                          8.0),
                                                              child: Text(
                                                                orderitemMRP[
                                                                        index]
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        20.0,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .lineThrough),
                                                              ),
                                                            ),
                                                            const Text(
                                                              "  ₹ ",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      17.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 2,
                                                                      right:
                                                                          8.0),
                                                              child: Text(
                                                                orderitemPrice[
                                                                        index]
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        21.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const Divider(
                                                    color: Colors.black45,
                                                    height: 5,
                                                    thickness: 1,
                                                    indent: 5,
                                                    endIndent: 5,
                                                  ),
                                                ],
                                              ))),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Text(
                                              "Item Total",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Text(
                                              "SGST",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Text(
                                              "IGST",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Text(
                                              "Delivery Charge",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              "₹ " + item_total.toString(),
                                              style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              "₹ " + SGST.toString(),
                                              style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              "₹ " + IGST.toString(),
                                              style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              "₹ " + DeliveryCharge.toString(),
                                              style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
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
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Grand Total",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "₹ " + GrandTotal.toString(),
                                          style: const TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w700),
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
                                        color: bgColor,
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Your total savings",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "₹ " + totalSavimgs.toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.0,
                                            ),
                                          ),
                                        )
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
                                  fontSize: 25.0, fontWeight: FontWeight.w700),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Order Number",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                      child: Text(
                                        "#1",
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Text(
                                      "Payment",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Text("Online Payment",
                                          style: TextStyle(
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Date",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                      child: Text("13 Oct,2021 1:09 PM",
                                          style: TextStyle(
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                    Text(
                                      "Mobile Number",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Text("8927545556",
                                          style: TextStyle(
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Deliver to",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 8.0, bottom: 15.0),
                                  child: Text(
                                      "Hosenpur,721429,West Bengal,India",
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
