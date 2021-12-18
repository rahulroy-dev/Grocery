import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery_app/constantVarriables.dart';
import 'package:grocery_app/screen/categories.dart';
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
  int count = 0;
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
              leading: Icon(
                Icons.location_on,
                color: Color(0xFFffa366),
              ),
              title: Center(
                child: Text(
                  add,
                  overflow: TextOverflow.ellipsis,
                ),
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
                  child: Icon(Icons.shopping_cart_outlined),
                  onTap: () {
                    Navigator.pushNamed(context, MyRoutes.cart);
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(backgroundImage: NetworkImage(img1[0]))
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
                            Column(
                              children: List.generate(
                                  price.length,
                                  (index) => Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 5, 5, 0),
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
                                                    width: w * 0.2,
                                                    color: Colors.amber,
                                                    child: Image.network(
                                                        img[index]),
                                                  ),
                                                  Container(
                                                    width: w * 0.6,
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
                                                                  price[index],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(
                                                                  mrp[index],
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
                                                                  color: Colors
                                                                      .red,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              3)),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        4.0),
                                                                child: Center(
                                                                    child: Text(
                                                                  off[index],
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .white),
                                                                )),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Container(
                                                          child: Text(
                                                            title[index],
                                                            style: TextStyle(
                                                                fontSize: 19),
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
                                                                weight[index],
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: bg),
                                                              )),
                                                            ),
                                                            Card(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child: Container(
                                                                height: 30,
                                                                width: 100,
                                                                decoration: BoxDecoration(
                                                                    gradient:
                                                                        bg1,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5)),
                                                                child: Center(
                                                                    child: Text(
                                                                  'ADD   +',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                )),
                                                              ),
                                                            )
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
                                      )),
                            )
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
