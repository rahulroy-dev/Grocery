import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery_app/constantVarriables.dart';
import 'package:grocery_app/screen/categories.dart';
import 'package:grocery_app/screen/details.dart';
import 'package:grocery_app/utils/colorvar.dart';

import '../utils/routes.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  // Color bg = Color(0xFF08db5c);
  // Color bg = Colors.purple.shade400;
  // LinearGradient bg1 = LinearGradient(
  //   begin: Alignment.bottomLeft,
  //   end: Alignment.bottomRight,
  //   stops: [0.1, 0.5, 0.7, 0.9],
  //   colors: [
  //     Colors.purple.shade700,
  //     Colors.purple.shade600,
  //     Colors.purple.shade500,
  //     Colors.purple.shade400,
  //   ],
  // );
  String add = "Gopalpur,keshiary,paschim medinipur";

  //for 1st row variable start
  List<String> img1 = [
    'https://i.ibb.co/fpqqNS7/400-good-day-britannia-original-imafwh3rxpqqzzfy.jpg',
    'https://i.ibb.co/0sN4vks/75-milano-centre-filled-cookies-parle-original-imafxk72trkembkp.jpg',
    'https://i.ibb.co/Cbhgc9K/fruit-biscuits-karachi-bakery-original-imagyn7dbyj7ab8r.jpg',
    'https://i.ibb.co/fpqqNS7/400-good-day-britannia-original-imafwh3rxpqqzzfy.jpg',
    'https://i.ibb.co/0sN4vks/75-milano-centre-filled-cookies-parle-original-imafxk72trkembkp.jpg',
  ];
  List<String> name1 = [
    'Broccoli hjgjy ',
    'Carrots',
    'Garlic',
    'Potato',
    'Cabbage'
  ];
  //1st variable end

  //2nd carousel slider image start
  List<String> img2 = [
    'https://i.ibb.co/fpqqNS7/400-good-day-britannia-original-imafwh3rxpqqzzfy.jpg',
    'https://i.ibb.co/0sN4vks/75-milano-centre-filled-cookies-parle-original-imafxk72trkembkp.jpg',
    'https://i.ibb.co/Cbhgc9K/fruit-biscuits-karachi-bakery-original-imagyn7dbyj7ab8r.jpg',
  ];
  //end

  //last list of variable
  List<String> img = [
    'https://i.ibb.co/fpqqNS7/400-good-day-britannia-original-imafwh3rxpqqzzfy.jpg',
    'https://i.ibb.co/0sN4vks/75-milano-centre-filled-cookies-parle-original-imafxk72trkembkp.jpg',
    'https://i.ibb.co/Cbhgc9K/fruit-biscuits-karachi-bakery-original-imagyn7dbyj7ab8r.jpg',
    'https://i.ibb.co/5W0Czp5/450-assorted-cookies-unibic-original-imaf4yuek3zqf4ty.jpg',
    'https://i.ibb.co/3d1FDMT/mom-s-magic-cashew-almonds-biscuits-sunfeast-original-imag5erfh8hqdbhy.jpg',
    'https://i.ibb.co/yhHGKSG/200-premium-international-salted-party-mix-pouch-happilo-original-imafwhmvnnbybg7f.jpg',
    'https://i.ibb.co/fdCK4Zr/151-2-o-rice-light-and-tasty-orion-original-imag2zphhzt8wgme.jpg'
  ];
  List<String> price = ['₹ 100.00', '₹ 70.00', '₹ 35.00', '₹ 25.00', '₹ 40.00'];
  List<String> mrp = ['₹120.00', '₹80.00', '₹40.00', '₹30.00', '₹50.00'];
  List<String> title = [
    'BRITANNIA Good Day Chocochip s Cookies',
    'PARLE Milano Centre Filled Cookies',
    'KARACHI BAKERY Fruit Bakery Biscuit',
    'UNIBIC Assorted Cookies',
    "Sunfeast Mom's Magic Cashew and Almonds Cookies",
    'Happilo Premium International Salted Party Mix',
    "ORION O'Rice Light and Tasty Crackers"
  ];
  List<String> off = ['₹ 20 OFF', '₹ 10 OFF', '₹ 5 OFF', '₹ 5 OFF', '₹ 10 OFF'];
  List<String> weight = [
    '1.00 kg',
    '1.00 kg',
    '250.00 gm.',
    '1.00 kg',
    '1.00 kg'
  ];
  //end
  final dbRefProducts = FirebaseDatabase.instance.reference().child('Products');
  final dbRefCart = FirebaseDatabase.instance.reference().child('Carts');
  int count = 0;
  List cidList = [];
  List nameList = [];
  List imgList = [];
  List priceList = [];
  List keyList1 = [];
  List sellList = [];
  List quanList = [];
  List cartMenuList = [];
  List cartQuanList = [];
  List cartKeyList = [];
  int _count = 0;
  int payAmount = 0;
  final dbRefCatagories =
      FirebaseDatabase.instance.reference().child('Categories');
  List catnameList = [];
  List catimgList = [];
  List keyList = [];
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    print(preferences!.getString("user_id"));
    return Container(
      decoration: BoxDecoration(gradient: bg1),
      child: Scaffold(
          //backgroundColor: bg,
          backgroundColor: Color(0x00000000),
          appBar: AppBar(
              //backgroundColor: bg,
              backgroundColor: Color(0x00000000),
              elevation: 0.0,
              titleSpacing: 0,
              //centerTitle: true,
              leading: Container(
                //  color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "image/logo1.gif",
                      height: 45,
                      width: 45,
                      colorBlendMode: BlendMode.multiply,
                    ),
                  ],
                ),
              ),
              leadingWidth: 50,
              title: Text(
                "Grocify",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 27),
              ),
              bottom: PreferredSize(
                  child: Center(
                    child: Container(
                      height: 35.0,
                      width: w * 0.9,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          hintText: "Seach your daily bag",
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          )),
                    ),
                  ),
                  preferredSize: Size.fromHeight(45.0)),
              actions: [
                GestureDetector(
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 30,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, MyRoutes.cart);
                  },
                ),
                SizedBox(
                  width: 20,
                ),
              ]),
          body: StreamBuilder(
              stream: dbRefCatagories.onValue,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snap) {
                if (snap.hasData &&
                    !snap.hasError &&
                    snap.data.snapshot.value != null) {
                  Map orderValues = snap.data.snapshot.value;
                  catnameList.clear();
                  // testList.clear();
                  catimgList.clear();
                  keyList.clear();
                  orderValues.forEach((key, values) {
                    // testList.add(values);
                    catnameList.add(values["categories"]);
                    catimgList.add(values["images"]);
                    keyList.add(key);
                    print(keyList);
                  });
                  // print(catnameList);
                  // print(catimgList);
                  return Container(
                    height: h,
                    width: w,
                    margin: EdgeInsets.only(top: 25.0),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(40)),
                        color: Colors.grey[200]),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Card(
                              elevation: 5.0,
                              child: SizedBox(
                                height: 100,
                                width: w * 0.95,
                                child: ListView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  children: List.generate(
                                      catnameList.length,
                                      (index) => GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Category(
                                                            cat: keyList[index],
                                                            catname:
                                                                catnameList[
                                                                    index],
                                                          )));
                                              //Navigator.push(context, MaterialPageRoute(builder: (context)=>Category()));
                                            },
                                            child: Container(
                                              height: 90,
                                              width: 80,
                                              child: Column(
                                                children: [
                                                  Center(
                                                    child: Container(
                                                        margin: EdgeInsets.only(
                                                            top: 5.0,
                                                            bottom: 5.0,
                                                            left: 5.0,
                                                            right: 5.0),
                                                        decoration:
                                                            BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .purple
                                                                      .shade100,
                                                                  width: 10.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0)),
                                                        child: Image.network(
                                                          catimgList[index],
                                                          width: 50,
                                                          height: 50,
                                                          fit: BoxFit.fill,
                                                        )),
                                                  ),
                                                  Text(
                                                    catnameList[index],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                ),
                              ),
                            ),
                            Stack(children: [
                              Container(
                                width: w * 0.95,
                                height: 170,
                                child: Center(
                                  child: CarouselSlider(
                                    options: CarouselOptions(
                                        height: 150,
                                        aspectRatio: 16 / 10,
                                        initialPage: 0,
                                        enlargeCenterPage: false,
                                        reverse: false,
                                        enableInfiniteScroll: true,
                                        scrollDirection: Axis.horizontal,
                                        viewportFraction: 1.1,
                                        autoPlay: true,
                                        pauseAutoPlayOnTouch: true,
                                        autoPlayInterval: Duration(seconds: 5),
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            count = index;
                                          });
                                        }),
                                    items: List.generate(
                                        img2.length,
                                        (index) => Stack(children: [
                                              Positioned(
                                                child: Image.network(
                                                  img2[index],
                                                  height: 150,
                                                  width: w * 0.95,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ])),
                                  ),
                                ),
                              ),
                              Positioned(
                                  width: w,
                                  bottom: 25.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(
                                            img2.length,
                                            (index1) => Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 8.0,
                                                  ),
                                                  child: Container(
                                                    height: 10,
                                                    width: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: count == index1
                                                          ? Colors.green
                                                          : Colors.white,
                                                    ),
                                                  ),
                                                )),
                                      )
                                    ],
                                  )),
                            ]),
                            StreamBuilder(
                                stream: dbRefProducts.onValue,
                                builder: (BuildContext context,
                                    AsyncSnapshot<dynamic> snap) {
                                  if (snap.hasData &&
                                      !snap.hasError &&
                                      snap.data.snapshot.value != null) {
                                    Map orderValues = snap.data.snapshot.value;
                                    cidList.clear();
                                    nameList.clear();
                                    imgList.clear();
                                    priceList.clear();
                                    keyList1.clear();
                                    sellList.clear();
                                    quanList.clear();
                                    orderValues.forEach((key, values) {
                                      if ((values["popular"] == "true")) {
                                        cidList.add(values["category_id"]);
                                        nameList.add(values["name"]);
                                        priceList.add(values["price"]);
                                        imgList.add(values["image"]);
                                        keyList1.add(key);
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
                                        builder: (BuildContext context,
                                            AsyncSnapshot<dynamic> snap) {
                                          print("object");
                                          if (snap.hasData &&
                                              !snap.hasError &&
                                              snap.data.snapshot.value !=
                                                  null) {
                                            Map orderValues =
                                                snap.data.snapshot.value;
                                            cartMenuList.clear();
                                            cartQuanList.clear();
                                            cartKeyList.clear();
                                            orderValues.forEach((key, values) {
                                              if (values["user_id"] ==
                                                  preferences!
                                                      .getString("user_id")) {
                                                cartMenuList
                                                    .add(values["menu_id"]);
                                                cartQuanList
                                                    .add(values["quantity"]);
                                                cartKeyList.add(key);
                                                print(cartMenuList);
                                                print(cartMenuList);
                                                print(cartKeyList);
                                                print(keyList1.indexWhere(
                                                    (element) =>
                                                        element.contains(
                                                            cartMenuList[0])));
                                              }
                                            });

                                            return Column(
                                              children: List.generate(
                                                  price.length,
                                                  (index) => InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      Pdetails(
                                                                          id: keyList1[
                                                                              index])));
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  5, 5, 5, 0),
                                                          child: Card(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            elevation: 2,
                                                            child: Container(
                                                              height: 150,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .fromLTRB(
                                                                        8,
                                                                        12,
                                                                        8,
                                                                        8),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Hero(
                                                                      tag: keyList1[
                                                                          index],
                                                                      child:
                                                                          Container(
                                                                        width: (w) *
                                                                            .25,
                                                                        //color: Colors.amber,
                                                                        child: Image.network(
                                                                            imgList[index]),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          (w) *
                                                                              .6,
                                                                      //color: Colors.pink[50],
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Row(
                                                                                children: [
                                                                                  Text(
                                                                                    '₹${double.parse(sellList[index]).toStringAsFixed(2)}  ',
                                                                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                                                  ),
                                                                                  Text(
                                                                                    '₹',
                                                                                    style: TextStyle(
                                                                                      fontSize: 18,
                                                                                      color: Colors.black54,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    '${double.parse(priceList[index]).toStringAsFixed(2)}',
                                                                                    style: TextStyle(fontSize: 18, color: Colors.black54, decoration: TextDecoration.lineThrough),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Container(
                                                                                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(3)),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(4.0),
                                                                                  child: Center(
                                                                                      child: Text(
                                                                                    '${((int.parse(priceList[index]) - int.parse(sellList[index])) * 100 / int.parse(priceList[index])).floor()}% OFF',
                                                                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12),
                                                                                  )),
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          Container(
                                                                            child:
                                                                                Text(
                                                                              nameList[index],
                                                                              style: TextStyle(fontSize: 18),
                                                                              maxLines: 2,
                                                                              overflow: TextOverflow.ellipsis,
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Container(
                                                                                height: 30,
                                                                                width: 100,
                                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.white, border: Border.all(color: Colors.grey)),
                                                                                child: Center(
                                                                                    child: Text(
                                                                                  quanList[index],
                                                                                  style: TextStyle(fontSize: 17, color: bg),
                                                                                )),
                                                                              ),
                                                                              (!cartMenuList.any((element) => element.contains(keyList1[index])))
                                                                                  ? Card(
                                                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                                      child: Container(
                                                                                        height: 30,
                                                                                        width: 100,
                                                                                        decoration: BoxDecoration(gradient: bg1, borderRadius: BorderRadius.circular(5)),
                                                                                        child: GestureDetector(
                                                                                          onTap: () {
                                                                                            _count = 0;
                                                                                            int i = -1;
                                                                                            for (var x in cartMenuList) {
                                                                                              i++;
                                                                                              if (x == keyList1[index]) {
                                                                                                _count = 1;
                                                                                                break;
                                                                                              }
                                                                                            }
                                                                                            if (_count == 0) {
                                                                                              dbRefCart.push().set({
                                                                                                "menu_id": keyList1[index],
                                                                                                "quantity": "1",
                                                                                                "rate": sellList[index],
                                                                                                "user_id": preferences!.getString('user_id'),
                                                                                                "discount": (int.parse(priceList[index]) - int.parse(sellList[index])).toString(),
                                                                                                //"veg": false,
                                                                                              });
                                                                                            } else {
                                                                                              int q = int.parse(cartQuanList[i]);
                                                                                              q++;
                                                                                              dbRefCart.child(cartKeyList[i]).update({
                                                                                                "quantity": q.toString()
                                                                                              });
                                                                                            }
                                                                                          },
                                                                                          child: Center(
                                                                                              child: Text(
                                                                                            'ADD   +',
                                                                                            style: TextStyle(
                                                                                              color: Colors.white,
                                                                                              fontSize: 17.5,
                                                                                            ),
                                                                                          )),
                                                                                        ),
                                                                                      ),
                                                                                    )
                                                                                  : Container(
                                                                                      child: Row(
                                                                                        children: [
                                                                                          GestureDetector(
                                                                                            onTap: () {
                                                                                              _count = 0;
                                                                                              int i = -1;
                                                                                              for (var x in cartMenuList) {
                                                                                                i++;
                                                                                                if (x == keyList1[index]) {
                                                                                                  _count = 1;
                                                                                                  break;
                                                                                                }
                                                                                              }
                                                                                              if (_count == 1) {
                                                                                                int q = int.parse(cartQuanList[i]);
                                                                                                q--;
                                                                                                (q > 0) ? dbRefCart.child(cartKeyList[i]).update({"quantity": q.toString()}) : dbRefCart.child(cartKeyList[i]).remove();
                                                                                              }
                                                                                            },
                                                                                            child: Card(
                                                                                              child: Container(
                                                                                                height: 30.0,
                                                                                                width: 30,
                                                                                                child: Center(
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
                                                                                            width: 5,
                                                                                          ),
                                                                                          Text(cartQuanList[cartMenuList.indexWhere((element) => element.contains(keyList1[index]))]),
                                                                                          SizedBox(
                                                                                            width: 5,
                                                                                          ),
                                                                                          GestureDetector(
                                                                                            onTap: () {
                                                                                              _count = 0;
                                                                                              int i = -1;
                                                                                              for (var x in cartMenuList) {
                                                                                                i++;
                                                                                                if (x == keyList1[index]) {
                                                                                                  _count = 1;
                                                                                                  break;
                                                                                                }
                                                                                              }
                                                                                              if (_count == 0) {
                                                                                                dbRefCart.push().set({
                                                                                                  "menu_id": keyList1[index],
                                                                                                  "quantity": "1",
                                                                                                  "rate": sellList[index],
                                                                                                  "user_id": preferences!.getString('user_id'),
                                                                                                  //"veg": false,
                                                                                                });
                                                                                              } else {
                                                                                                int q = int.parse(cartQuanList[i]);
                                                                                                q++;
                                                                                                dbRefCart.child(cartKeyList[i]).update({
                                                                                                  "quantity": q.toString()
                                                                                                });
                                                                                              }
                                                                                            },
                                                                                            child: Card(
                                                                                              child: Container(
                                                                                                height: 30.0,
                                                                                                width: 30,
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
                                          return Center(child: Container());
                                        });
                                  }
                                  return Center(
                                      child: CircularProgressIndicator());
                                })
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return Center(child: CircularProgressIndicator());
              })),
    );
  }
}
