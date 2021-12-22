import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery_app/screen/cart.dart';
import 'package:grocery_app/utils/colorvar.dart';

import '../constantVarriables.dart';

class Pdetails extends StatefulWidget {
  final String id;

  Pdetails({required this.id});

  @override
  _PdetailsState createState() => _PdetailsState();
}

class _PdetailsState extends State<Pdetails> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    //List imgList = [];
    List detailList = [];
    List keyList1 = [];

    List priceList = [];
    List sellList = [];
    List cartMenuList = [];
    List cartQuanList = [];
    List cartKeyList = [];
    int _count = 0;
    int q = 1;
    final dbrefProducts =
        FirebaseDatabase.instance.reference().child("Products");
    final dbRefCart = FirebaseDatabase.instance.reference().child("Carts");
    //timeDilation = 5.0;
    return StreamBuilder(
        stream: dbrefProducts.orderByKey().equalTo(widget.id).onValue,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snap) {
          if (snap.hasData &&
              !snap.hasError &&
              snap.data.snapshot.value != null) {
            Map orderValues = snap.data.snapshot.value;
            keyList1.clear();
            detailList.clear();
            priceList.clear();
            sellList.clear();
            orderValues.forEach((key, value) {
              keyList1.add(key);
              detailList.add(value);
              priceList.add(value["price"]);
              sellList.add(value["sell_rate"]);

              if (widget.id == keyList1[0]) {}
            });
            return StreamBuilder<Object>(
                stream: dbRefCart
                    // .orderByChild("user_id")
                    // .equalTo(preferences!.getString("user_id"))
                    .onValue,
                builder: (BuildContext context, AsyncSnapshot<dynamic> snap) {
                  print("object");
                  if (snap.hasData &&
                      !snap.hasError &&
                      snap.data.snapshot.value != null) {
                    Map orderValues = snap.data.snapshot.value;
                    cartMenuList.clear();
                    cartQuanList.clear();
                    cartKeyList.clear();
                    orderValues.forEach((key, values) {
                      if (values["user_id"] ==
                              preferences!.getString("user_id") &&
                          values["menu_id"] == widget.id) {
                        cartMenuList.add(values["menu_id"]);
                        cartQuanList.add(values["quantity"]);
                        cartKeyList.add(key);
                        print(cartMenuList);
                        print("p");
                        print(cartQuanList);
                        print(cartKeyList);
                      }
                    });
                    return Scaffold(
                        floatingActionButton: Card(
                          elevation: 20,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  new BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 10,
                                      offset: Offset.fromDirection(5, -5),
                                      spreadRadius: 1)
                                ],
                                gradient: bg1,
                                borderRadius: BorderRadius.circular(50)),
                            child: FloatingActionButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Mycart()));
                              },
                              elevation: 0,
                              focusColor: Colors.amber,
                              backgroundColor: Color(0x00000),
                              tooltip: "Cart",
                              child: Center(
                                  child: Icon(
                                Icons.shopping_cart_outlined,
                                size: 30,
                              )),
                            ),
                          ),
                        ),
                        backgroundColor: Colors.white,
                        body: SingleChildScrollView(
                          child: Container(
                            height: h,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Container(
                                      width: w,
                                      height: 320,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              detailList[0]["image"]),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 120,
                                    ),
                                    Container(
                                      //height: h - 340,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 0),
                                        child: Container(
                                          color: Colors.white,
                                          child:
                                              // SizedBox(width: 20,),
                                              Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Column(
                                              children: [
                                                (cartMenuList.any((element) =>
                                                        element.contains(
                                                            keyList1[0])))
                                                    ? Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            child: Row(
                                                              children: [
                                                                SizedBox(
                                                                  width: 26,
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    _count = 0;
                                                                    int i = -1;
                                                                    for (var x
                                                                        in cartMenuList) {
                                                                      i++;
                                                                      if (x ==
                                                                          keyList1[
                                                                              0]) {
                                                                        _count =
                                                                            1;
                                                                        break;
                                                                      }
                                                                    }
                                                                    if (_count ==
                                                                        1) {
                                                                      q = int.parse(
                                                                          cartQuanList[
                                                                              i]);
                                                                      q--;
                                                                      (q > 0)
                                                                          ? dbRefCart
                                                                              .child(cartKeyList[
                                                                                  i])
                                                                              .update({
                                                                              "quantity": q.toString()
                                                                            })
                                                                          : dbRefCart
                                                                              .child(cartKeyList[i])
                                                                              .remove();
                                                                    }
                                                                  },
                                                                  child: Card(
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          50.0,
                                                                      width: 50,
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .remove,
                                                                          color:
                                                                              Colors.white,
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
                                                                  width: 20,
                                                                ),
                                                                Text(
                                                                  cartQuanList[cartMenuList
                                                                      .indexWhere(
                                                                          (element) =>
                                                                              element.contains(keyList1[0]))],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20),
                                                                ),
                                                                SizedBox(
                                                                  width: 20,
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    _count = 0;
                                                                    int i = -1;
                                                                    for (var x
                                                                        in cartMenuList) {
                                                                      i++;
                                                                      if (x ==
                                                                          keyList1[
                                                                              0]) {
                                                                        _count =
                                                                            1;
                                                                        break;
                                                                      }
                                                                    }
                                                                    if (_count ==
                                                                        0) {
                                                                      dbRefCart
                                                                          .push()
                                                                          .set({
                                                                        "menu_id":
                                                                            keyList1[0],
                                                                        "quantity":
                                                                            "1",
                                                                        "rate":
                                                                            sellList[0],
                                                                        "user_id":
                                                                            preferences!.getString('user_id'),
                                                                        //"veg": false,
                                                                      });
                                                                    } else {
                                                                      q = 0;
                                                                      q = int.parse(
                                                                          cartQuanList[
                                                                              i]);
                                                                      q++;
                                                                      dbRefCart
                                                                          .child(cartKeyList[
                                                                              i])
                                                                          .update({
                                                                        "quantity":
                                                                            q.toString()
                                                                      });
                                                                    }
                                                                  },
                                                                  child: Card(
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          50.0,
                                                                      width: 50,
                                                                      child: Center(
                                                                          child: Icon(
                                                                        Icons
                                                                            .add,
                                                                        color: Colors
                                                                            .white,
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
                                                                ),

                                                                ///
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right:
                                                                        15.0),
                                                            child: Text(
                                                              "₹${(double.parse(detailList[0]["sell_rate"]) * double.parse(cartQuanList[0])).toStringAsFixed(2)}",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 20),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    : Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Card(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: Container(
                                                              height: 50,
                                                              width: w - 100,
                                                              decoration: BoxDecoration(
                                                                  gradient: bg1,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  _count = 0;
                                                                  int i = -1;
                                                                  for (var x
                                                                      in cartMenuList) {
                                                                    i++;
                                                                    if (x ==
                                                                        keyList1[
                                                                            0]) {
                                                                      _count =
                                                                          1;
                                                                      break;
                                                                    }
                                                                  }
                                                                  q = 1;
                                                                  if (_count ==
                                                                      0) {
                                                                    dbRefCart
                                                                        .push()
                                                                        .set({
                                                                      "menu_id":
                                                                          keyList1[
                                                                              0],
                                                                      "quantity":
                                                                          "1",
                                                                      "rate":
                                                                          sellList[
                                                                              0],
                                                                      "user_id":
                                                                          preferences!
                                                                              .getString('user_id'),
                                                                      "discount":
                                                                          (int.parse(priceList[0]) - int.parse(sellList[0]))
                                                                              .toString(),
                                                                      //"veg": false,
                                                                    });
                                                                  } else {
                                                                    int q = int.parse(
                                                                        cartQuanList[
                                                                            i]);
                                                                    q++;
                                                                    dbRefCart
                                                                        .child(cartKeyList[
                                                                            i])
                                                                        .update({
                                                                      "quantity":
                                                                          q.toString()
                                                                    });
                                                                  }
                                                                },
                                                                child: Center(
                                                                    child: Text(
                                                                  'ADD TO CART  +',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
                                                                  ),
                                                                )),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                SizedBox(
                                                  height: 25,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      detailList[0]["name"]
                                                          .toString()
                                                          .toUpperCase(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                    top: 40,
                                    left: 20,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.black
                                                  .withOpacity(0.5)),
                                          child: Center(
                                            child: Icon(
                                              Icons.arrow_back,
                                              color: Colors.white,
                                            ),
                                          )),
                                    )),
                                Positioned(
                                  top: 280,
                                  left: 40,
                                  right: 40,
                                  //bottom: 1,

                                  child: Container(
                                    height: 120,
                                    // color: Colors.white,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.white,
                                      boxShadow: [
                                        new BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            blurRadius: 7,
                                            spreadRadius: 5)
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //  ListView(
                                            //    children:
                                            //    List.generate(valueList.length,(index)=>

                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15, left: 20),
                                              child: Container(
                                                width: w - 130,
                                                child: Text(
                                                  detailList[0]["name"]
                                                      .toString()
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                      fontSize: 23,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),
                                            ),

                                            //Image.network("https://i.ibb.co/BcrkWws/star.jpg",height: 10,width: 10,)
                                            //  ),),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 24),
                                          child: Row(
                                            children: [
                                              Text(
                                                  "₹" +
                                                      double.parse(detailList[0]
                                                              ["price"])
                                                          .toStringAsFixed(2),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black45,
                                                      decoration: TextDecoration
                                                          .lineThrough)),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                  "₹" +
                                                      double.parse(detailList[0]
                                                              ["sell_rate"])
                                                          .toStringAsFixed(2),
                                                  style: TextStyle(
                                                      fontSize: 23,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black)),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                offRate(
                                                            double.parse(
                                                                detailList[0]
                                                                    ["price"]),
                                                            double.parse(
                                                                detailList[0][
                                                                    "sell_rate"]))
                                                        .toString() +
                                                    "%" +
                                                    " " +
                                                    "off",
                                                style: TextStyle(
                                                    color: bg,
                                                    fontSize: 19,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 24, top: 10),
                                          child: Text(
                                            detailList[0]["quantity"],
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),

                                    // onPressed: () {},
                                  ),
                                ),

                                // Container(
                                //   height: 10,width: 10,
                                //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0),gradient: LinearGradient(colors:
                                //    [Colors.purpleAccent,Colors.purple.shade900],begin: Alignment(0.7, 0.7),end: Alignment(0.2, 0.2),)),
                                // ),
                              ],
                            ),
                          ),
                        )
                        //             }
                        //             return Container();
                        //           });
                        //     }
                        //     return Center(child: CircularProgressIndicator());
                        //   },
                        // ),
                        );
                  }
                  return Container();
                });
          }
          return Container();
        });
  }
}

int offRate(double x, double y) {
  double r1 = (x - y);
  int fResult = ((r1 / x) * 100).floor();
  return fResult;
}
