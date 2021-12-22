import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery_app/screen/details.dart';
import 'package:grocery_app/utils/colorvar.dart';

import '../constantVarriables.dart';

class Offer extends StatefulWidget {
  const Offer({Key? key}) : super(key: key);

  @override
  _OfferState createState() => _OfferState();
}

class _OfferState extends State<Offer> {
  // @override
  // Widget build(BuildContext context) {
  //   List<double> price = [60, 60, 70, 80, 100, 90, 100];
  //   List<double> mrp = [80, 100, 100, 100, 120, 130, 110];
  //   List<int> off = [];
  //   for (var i = 0; i < price.length; i++) {
  //     double s = mrp[i] - price[i];
  //     off.add(s.toInt());
  //   }

  //   // for (var i = 0; i < price.length; i++) {
  //   //   double percent = (mrp[i] - price[i]) / mrp[i] * 100;
  //   //   off.add(percent.toInt());
  //   // }
  //   List<String> img = [
  //     'https://i.ibb.co/fpqqNS7/400-good-day-britannia-original-imafwh3rxpqqzzfy.jpg',
  //     'https://i.ibb.co/0sN4vks/75-milano-centre-filled-cookies-parle-original-imafxk72trkembkp.jpg',
  //     'https://i.ibb.co/Cbhgc9K/fruit-biscuits-karachi-bakery-original-imagyn7dbyj7ab8r.jpg',
  //     'https://i.ibb.co/5W0Czp5/450-assorted-cookies-unibic-original-imaf4yuek3zqf4ty.jpg',
  //     'https://i.ibb.co/3d1FDMT/mom-s-magic-cashew-almonds-biscuits-sunfeast-original-imag5erfh8hqdbhy.jpg',
  //     'https://i.ibb.co/yhHGKSG/200-premium-international-salted-party-mix-pouch-happilo-original-imafwhmvnnbybg7f.jpg',
  //     'https://i.ibb.co/fdCK4Zr/151-2-o-rice-light-and-tasty-orion-original-imag2zphhzt8wgme.jpg'
  //   ];
  //   List<String> title = [
  //     'BRITANNIA Good Day Chocochip s Cookies',
  //     'PARLE Milano Centre Filled Cookies',
  //     'KARACHI BAKERY Fruit Bakery Biscuit',
  //     'UNIBIC Assorted Cookies',
  //     "Sunfeast Mom's Magic Cashew and Almonds Cookies",
  //     'Happilo Premium International Salted Party Mix',
  //     "ORION O'Rice Light and Tasty Crackers"
  //   ];
  //   List<String> weight = [
  //     '100.00 gm.',
  //     '80.00 gm.',
  //     '120.00 gm.',
  //     '200.00 gm.',
  //     '100.00 gm.',
  //     '80.00 gm.',
  //     '180.00 gm.'
  //   ];
  //   double height = MediaQuery.of(context).size.height;
  //   double width = MediaQuery.of(context).size.width;
  //   return Container(
  //     decoration: BoxDecoration(gradient: bg1),
  //     child: Scaffold(
  //       backgroundColor: Color(0x00000),
  //       appBar: AppBar(
  //         elevation: 0,
  //         toolbarHeight: 70,
  //         backgroundColor: Color(0x00000),
  //         title: Text(
  //           'Offer',
  //           style: TextStyle(fontSize: 25),
  //         ),
  //         centerTitle: true,
  //       ),
  //       body: Container(
  //         height: height,
  //         width: width,
  //         padding: const EdgeInsets.only(top: 15),
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
  //           color: Colors.grey[200],
  //         ),
  //         child: ListView(
  //           physics: BouncingScrollPhysics(),
  //           scrollDirection: Axis.vertical,
  //           children: List.generate(
  //               price.length,
  //               (index) => StreamBuilder<Object>(
  //                 stream: null,
  //                 builder: (context, snapshot) {
  //                   return Padding(
  //                         padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
  //                         child: Card(
  //                           shape: RoundedRectangleBorder(
  //                               borderRadius: BorderRadius.circular(5)),
  //                           elevation: 2,
  //                           child: Container(
  //                             height: 150,
  //                             decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(5)),
  //                             child: Padding(
  //                               padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
  //                               child: Row(
  //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                                 children: [
  //                                   Container(
  //                                     width: (width) * .25,
  //                                     //color: Colors.amber,
  //                                     child: Image.network(img[index]),
  //                                   ),
  //                                   Container(
  //                                     width: (width) * .6,
  //                                     //color: Colors.pink[50],
  //                                     child: Column(
  //                                       crossAxisAlignment:
  //                                           CrossAxisAlignment.start,
  //                                       mainAxisAlignment:
  //                                           MainAxisAlignment.spaceBetween,
  //                                       children: [
  //                                         Row(
  //                                           mainAxisAlignment:
  //                                               MainAxisAlignment.spaceBetween,
  //                                           children: [
  //                                             Row(
  //                                               children: [
  //                                                 Text(
  //                                                   '₹${price[index].toStringAsFixed(2)}  ',
  //                                                   style: TextStyle(
  //                                                       fontSize: 18,
  //                                                       fontWeight:
  //                                                           FontWeight.bold),
  //                                                 ),
  //                                                 Text(
  //                                                   '₹',
  //                                                   style: TextStyle(
  //                                                     fontSize: 18,
  //                                                     color: Colors.black54,
  //                                                   ),
  //                                                 ),
  //                                                 Text(
  //                                                   '${mrp[index].toStringAsFixed(2)}',
  //                                                   style: TextStyle(
  //                                                       fontSize: 18,
  //                                                       color: Colors.black54,
  //                                                       decoration: TextDecoration
  //                                                           .lineThrough),
  //                                                 ),
  //                                               ],
  //                                             ),
  //                                             Container(
  //                                               decoration: BoxDecoration(
  //                                                   color: Colors.red,
  //                                                   borderRadius:
  //                                                       BorderRadius.circular(3)),
  //                                               child: Padding(
  //                                                 padding:
  //                                                     const EdgeInsets.all(4.0),
  //                                                 child: Center(
  //                                                     child: Text(
  //                                                   '₹ ${off[index]} OFF',
  //                                                   style: TextStyle(
  //                                                       fontWeight: FontWeight.bold,
  //                                                       color: Colors.white,
  //                                                       fontSize: 12),
  //                                                 )),
  //                                               ),
  //                                             )
  //                                           ],
  //                                         ),
  //                                         Container(
  //                                           child: Text(
  //                                             title[index],
  //                                             style: TextStyle(fontSize: 18),
  //                                             maxLines: 2,
  //                                             overflow: TextOverflow.ellipsis,
  //                                           ),
  //                                         ),
  //                                         Row(
  //                                           mainAxisAlignment:
  //                                               MainAxisAlignment.spaceBetween,
  //                                           children: [
  //                                             Container(
  //                                               height: 30,
  //                                               width: 100,
  //                                               decoration: BoxDecoration(
  //                                                   borderRadius:
  //                                                       BorderRadius.circular(4),
  //                                                   color: Colors.white,
  //                                                   border: Border.all(
  //                                                       color: Colors.grey)),
  //                                               child: Center(
  //                                                   child: Text(
  //                                                 weight[index],
  //                                                 style: TextStyle(
  //                                                     fontSize: 17, color: bg),
  //                                               )),
  //                                             ),
  //                                             Card(
  //                                               shape: RoundedRectangleBorder(
  //                                                   borderRadius:
  //                                                       BorderRadius.circular(5)),
  //                                               child: Container(
  //                                                 height: 30,
  //                                                 width: 100,
  //                                                 decoration: BoxDecoration(
  //                                                     gradient: bg1,
  //                                                     borderRadius:
  //                                                         BorderRadius.circular(5)),
  //                                                 child: Center(
  //                                                     child: Text(
  //                                                   'ADD   +',
  //                                                   style: TextStyle(
  //                                                     color: Colors.white,
  //                                                     fontSize: 18,
  //                                                   ),
  //                                                 )),
  //                                               ),
  //                                             )
  //                                           ],
  //                                         )
  //                                       ],
  //                                     ),
  //                                   )
  //                                 ],
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       );
  //                 }
  //               )),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  final dbRefProducts = FirebaseDatabase.instance.reference().child('Products');
  final dbRefCart = FirebaseDatabase.instance.reference().child('Carts');
  List cidList = [];
  List nameList = [];
  List imgList = [];
  List priceList = [];
  List keyList = [];
  List sellList = [];
  List quanList = [];
  List cartMenuList = [];
  List cartQuanList = [];
  List cartKeyList = [];
  int _count = 0;
  int payAmount = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(gradient: bg1),
      child: Scaffold(
        backgroundColor: Color(0x000000),
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 70,
          backgroundColor: Color(0x00000),
          title: Text(
            'Offer',
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            color: Colors.grey[200],
          ),
          child: StreamBuilder(
            stream: dbRefProducts.onValue,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snap) {
              if (snap.hasData &&
                  !snap.hasError &&
                  snap.data.snapshot.value != null) {
                Map orderValues = snap.data.snapshot.value;
                cidList.clear();
                nameList.clear();
                imgList.clear();
                priceList.clear();
                keyList.clear();
                sellList.clear();
                quanList.clear();
                orderValues.forEach((key, values) {
                  if ((values["popular"] == "true")) {
                    cidList.add(values["category_id"]);
                    nameList.add(values["name"]);
                    priceList.add(values["price"]);
                    imgList.add(values["image"]);
                    keyList.add(key);
                    sellList.add(values["sell_rate"]);
                    quanList.add(values["quantity"]);

                    print(key);
                  }
                });

                return StreamBuilder(
                    stream: dbRefCart
                        // .orderByChild("user_id")
                        // .equalTo(preferences!.getString("user_id"))
                        .onValue,
                    builder:
                        (BuildContext context, AsyncSnapshot<dynamic> snap) {
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
                              preferences!.getString("user_id")) {
                            cartMenuList.add(values["menu_id"]);
                            cartQuanList.add(values["quantity"]);
                            cartKeyList.add(key);
                            print(cartMenuList);
                            print(cartMenuList);
                            print(cartKeyList);
                            print(keyList.indexWhere((element) =>
                                element.contains(cartMenuList[0])));
                          }
                        });

                        return ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          children: List.generate(
                              priceList.length,
                              (index) => InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Pdetails(
                                                  id: keyList[index])));
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 0),
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
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 12, 8, 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Hero(
                                                  tag: keyList[index],
                                                  child: Container(
                                                    width: (width) * .25,
                                                    //color: Colors.amber,
                                                    child: Image.network(
                                                        imgList[index]),
                                                  ),
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
                                                                '₹${double.parse(sellList[index]).toStringAsFixed(2)}  ',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                '₹',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .black54,
                                                                ),
                                                              ),
                                                              Text(
                                                                '${double.parse(priceList[index]).toStringAsFixed(2)}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .black54,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .lineThrough),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    Colors.red,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            3)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4.0),
                                                              child: Center(
                                                                  child: Text(
                                                                '${((int.parse(priceList[index]) - int.parse(sellList[index])) * 100 / int.parse(priceList[index])).floor()}% OFF',
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
                                                          nameList[index],
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
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
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                color: Colors
                                                                    .white,
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .grey)),
                                                            child: Center(
                                                                child: Text(
                                                              quanList[index],
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: bg),
                                                            )),
                                                          ),
                                                          (!cartMenuList.any((element) =>
                                                                  element.contains(
                                                                      keyList[
                                                                          index])))
                                                              ? Card(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child:
                                                                      Container(
                                                                    height: 30,
                                                                    width: 100,
                                                                    decoration: BoxDecoration(
                                                                        gradient:
                                                                            bg1,
                                                                        borderRadius:
                                                                            BorderRadius.circular(5)),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        _count =
                                                                            0;
                                                                        int i =
                                                                            -1;
                                                                        for (var x
                                                                            in cartMenuList) {
                                                                          i++;
                                                                          if (x ==
                                                                              keyList[index]) {
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
                                                                                keyList[index],
                                                                            "quantity":
                                                                                "1",
                                                                            "rate":
                                                                                sellList[index],
                                                                            "user_id":
                                                                                preferences!.getString('user_id'),
                                                                            "discount":
                                                                                (int.parse(priceList[index]) - int.parse(sellList[index])).toString(),
                                                                            //"veg": false,
                                                                          });
                                                                        } else {
                                                                          int q =
                                                                              int.parse(cartQuanList[i]);
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
                                                                        'ADD   +',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              17.5,
                                                                        ),
                                                                      )),
                                                                    ),
                                                                  ),
                                                                )
                                                              : Container(
                                                                  child: Row(
                                                                    children: [
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          _count =
                                                                              0;
                                                                          int i =
                                                                              -1;
                                                                          for (var x
                                                                              in cartMenuList) {
                                                                            i++;
                                                                            if (x ==
                                                                                keyList[index]) {
                                                                              _count = 1;
                                                                              break;
                                                                            }
                                                                          }
                                                                          if (_count ==
                                                                              1) {
                                                                            int q =
                                                                                int.parse(cartQuanList[i]);
                                                                            q--;
                                                                            (q > 0)
                                                                                ? dbRefCart.child(cartKeyList[i]).update({
                                                                                    "quantity": q.toString()
                                                                                  })
                                                                                : dbRefCart.child(cartKeyList[i]).remove();
                                                                          }
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
                                                                              child: Icon(
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
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Text(cartQuanList[cartMenuList.indexWhere(
                                                                          (element) =>
                                                                              element.contains(keyList[index]))]),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          _count =
                                                                              0;
                                                                          int i =
                                                                              -1;
                                                                          for (var x
                                                                              in cartMenuList) {
                                                                            i++;
                                                                            if (x ==
                                                                                keyList[index]) {
                                                                              _count = 1;
                                                                              break;
                                                                            }
                                                                          }
                                                                          if (_count ==
                                                                              0) {
                                                                            dbRefCart.push().set({
                                                                              "menu_id": keyList[index],
                                                                              "quantity": "1",
                                                                              "rate": sellList[index],
                                                                              "user_id": preferences!.getString('user_id'),
                                                                              //"veg": false,
                                                                            });
                                                                          } else {
                                                                            int q =
                                                                                int.parse(cartQuanList[i]);
                                                                            q++;
                                                                            dbRefCart.child(cartKeyList[i]).update({
                                                                              "quantity": q.toString()
                                                                            });
                                                                          }
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
                                                                              color: Colors.white,
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
                                    ),
                                  )),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    });
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
