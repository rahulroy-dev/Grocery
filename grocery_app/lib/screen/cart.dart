import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/screen/selectAddress.dart';
import 'package:grocery_app/utils/colorvar.dart';

import '../constantVarriables.dart';

class Mycart extends StatefulWidget {
  const Mycart({Key? key}) : super(key: key);

  @override
  _MycartState createState() => _MycartState();
}

class _MycartState extends State<Mycart> {
  List<String> img = [
    'https://i.ibb.co/WvpxCSy/61p-Bq-Rts-NGS-SX679.jpg',
    'https://i.ibb.co/WvpxCSy/61p-Bq-Rts-NGS-SX679.jpg',
    'https://i.ibb.co/WvpxCSy/61p-Bq-Rts-NGS-SX679.jpg',
  ];
  List<String> price = ['₹180.00', '₹160.00', '₹100.00'];
  List<String> name = ['Sticky Rice', 'Sticky Rice', 'Sticky Rice'];
  //List<String> off = [' 20% OFF', ' 20% OFF', ' 20% OFF'];
  List<String> dprice = ['₹200', '₹200', '₹120'];
  List<String> weigth = ['1.00 kg', '2.00kg', '2.00kg'];
  final dbRefCart = FirebaseDatabase.instance.reference().child('Carts');
  final dbRefProduct = FirebaseDatabase.instance.reference().child('Products');
  List cartKeyList = [];
  List cartMenuIdList = [];
  List cartValuesList = [];
  List cartRateList = [];
  List productList = [];
  List productQuanList = [];
  double total = 0.0;
  double discount = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(gradient: bg1),
      child: Scaffold(
        backgroundColor: Color(0x0000),
        appBar: AppBar(
          backgroundColor: Color(0x000000),
          elevation: 0.0,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 50),
            )
          ],
          title: Center(
            child: Column(
              children: [
                Text(" My Cart"),
                // Padding(
                //   padding: const EdgeInsets.only(right: 15),
                //   child: Text(
                //     "$item items",
                //     style: TextStyle(fontSize: 15),
                //   ),
                // ),
              ],
            ),
          ),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: new Icon(Icons.arrow_back_ios)),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          height: height,
          child: StreamBuilder(
              stream: dbRefCart.onValue,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snap) {
                if (snap.hasData &&
                    !snap.hasError &&
                    snap.data.snapshot.value != null) {
                  Map orderValues = snap.data.snapshot.value;
                  cartKeyList.clear();
                  cartMenuIdList.clear();
                  cartValuesList.clear();
                  cartRateList.clear();
                  total = 0;
                  discount = 0;

                  orderValues.forEach((key, values) {
                    if (values["user_id"] ==
                        preferences!.getString('user_id')) {
                      //addressList.add(values);
                      //keyList.add(key);
                      cartValuesList.add(values);
                      cartKeyList.add(key);
                      print(cartValuesList);
                      total += int.parse(values["rate"]) *
                          int.parse(values["quantity"]);
                      discount += int.parse(values["discount"]) *
                          int.parse(values["quantity"]);
                    }
                  });

                  return (cartKeyList.length > 0)
                      ? SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40.0,
                              ),
                              Column(
                                  children: List.generate(
                                cartValuesList.length,
                                (index) => StreamBuilder<Object>(
                                    stream: dbRefProduct
                                        .orderByKey()
                                        .equalTo(
                                            cartValuesList[index]["menu_id"])
                                        .onValue,
                                    builder: (BuildContext context,
                                        AsyncSnapshot<dynamic> snap) {
                                      if (snap.hasData &&
                                          !snap.hasError &&
                                          snap.data.snapshot.value != null) {
                                        Map orderValues =
                                            snap.data.snapshot.value;
                                        productList.clear();
                                        orderValues.forEach((key, values) {
                                          productList.add(values);
                                          print(productList);
                                        });
                                        return Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 0, 5, 5),
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            elevation: 2,
                                            child: Container(
                                              height: 150,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 12, 8, 8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: (width) * .25,
                                                      //color: Colors.amber,
                                                      child: Image.network(
                                                          productList[0]
                                                              ["image"]),
                                                    ),
                                                    Container(
                                                      width: (width) * .6,
                                                      //color: Colors.pink[50],
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    "₹" +
                                                                        productList[0]
                                                                            [
                                                                            "sell_rate"],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    '₹',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      color: Colors
                                                                          .black54,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    productList[
                                                                            0][
                                                                        "price"],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .black54,
                                                                        decoration:
                                                                            TextDecoration.lineThrough),
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .red,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            3)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          4.0),
                                                                  child: Center(
                                                                      child:
                                                                          Text(
                                                                    '${((int.parse(productList[0]["price"]) - int.parse(productList[0]["sell_rate"])) * 100 / int.parse(productList[0]["price"])).floor()}% OFF',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            12),
                                                                  )),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              productList[0]
                                                                  ["name"],
                                                              style: TextStyle(
                                                                  fontSize: 18),
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                height: 30,
                                                                width: 100,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4),
                                                                    color: Colors
                                                                        .white,
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey)),
                                                                child: Center(
                                                                    child: Text(
                                                                  productList[0]
                                                                      [
                                                                      "quantity"],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          17,
                                                                      color:
                                                                          bg),
                                                                )),
                                                              ),
                                                              Container(
                                                                child: Row(
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        int q = int.parse(cartValuesList[index]
                                                                            [
                                                                            "quantity"]);
                                                                        q--;
                                                                        (q > 0)
                                                                            ? dbRefCart.child(cartKeyList[index]).update({
                                                                                "quantity": q.toString()
                                                                              })
                                                                            : dbRefCart.child(cartKeyList[index]).remove();
                                                                      },
                                                                      child:
                                                                          Card(
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              30.0,
                                                                          width:
                                                                              30,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Icon(
                                                                              Icons.remove,
                                                                              color: Colors.white,
                                                                            ),
                                                                            // style: TextStyle(
                                                                            //     color: Colors.white, fontSize: 25),
                                                                          ),
                                                                          decoration: BoxDecoration(
                                                                              gradient: bg1,
                                                                              borderRadius: BorderRadius.all(
                                                                                Radius.circular(5.0),
                                                                              )),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Text(cartValuesList[
                                                                            index]
                                                                        [
                                                                        "quantity"]),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        int q = int.parse(cartValuesList[index]
                                                                            [
                                                                            "quantity"]);
                                                                        q++;
                                                                        dbRefCart
                                                                            .child(cartKeyList[
                                                                                index])
                                                                            .update({
                                                                          "quantity":
                                                                              q.toString()
                                                                        });
                                                                      },
                                                                      child:
                                                                          Card(
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              30.0,
                                                                          width:
                                                                              30,
                                                                          child: Center(
                                                                              child: Icon(
                                                                            Icons.add,
                                                                            color:
                                                                                Colors.white,
                                                                          )
                                                                              // style: TextStyle(
                                                                              //     color: Colors.white, fontSize: 25),
                                                                              ),
                                                                          decoration: BoxDecoration(
                                                                              gradient: bg1,
                                                                              borderRadius: BorderRadius.all(
                                                                                Radius.circular(5.0),
                                                                              )),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              )
                                                              // Text(cartMenuList
                                                              //     .indexWhere((element) =>
                                                              //         element.contains(
                                                              //             keyList[
                                                              //                 index]))
                                                              //     .toString()),
                                                            ],
                                                          )
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

                                      return Center(child: Container());
                                    }),
                              )),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  //height: 250,
                                  //margin: EdgeInsets.only(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Bill Details",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Total",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                            Text(
                                              "${(total + discount).toStringAsFixed(2)}",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Products Discount",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                            Text(
                                              "-${discount.toStringAsFixed(2)}",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Delivery Charges",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                            Text(
                                              "00.00",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "CGST",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                            Text(
                                              "00.00",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "IGST",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                            Text(
                                              "00.00",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 10),
                                          child: Container(
                                            height: 2,
                                            width: width,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Total Pay",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "${total.toStringAsFixed(2)}",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Center(
                          child: Text("No Data"),
                        );
                  //

                }

                return Center(child: CircularProgressIndicator());
              }),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            if (total != 0) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SelectAddressPage(
                            total: total,
                          )));
            }
          },
          child: Container(
              height: 50,
              //width: 100,
              decoration: BoxDecoration(
                  gradient: bg1, borderRadius: BorderRadius.circular(50)),
              child: Center(
                  child: Text(
                "Place Order",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ))),
        ),
      ),
    );
  }
}
