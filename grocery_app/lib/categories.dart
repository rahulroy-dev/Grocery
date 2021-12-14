import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  final String cat;
  final String catname;
  const Category({Key? key, required this.cat, required this.catname})
      : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final dbRefUsers = FirebaseDatabase.instance.reference().child('Products');
  List cidList = [];
  List nameList = [];
  List imgList = [];
  List priceList = [];
  Color bgColor = Color(0xFF08db5c);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(widget.catname),
        backgroundColor: bgColor,
      ),
      body: StreamBuilder(
        stream: dbRefUsers.onValue,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snap) {
          if (snap.hasData &&
              !snap.hasError &&
              snap.data.snapshot.value != null) {
            Map orderValues = snap.data.snapshot.value;
            cidList.clear();
            // testList.clear();
            nameList.clear();
            imgList.clear();
            priceList.clear();
            orderValues.forEach((key, values) {
              // testList.add(values);
              if ((values["category_id"] == widget.cat)) {
                cidList.add(values["category_id"]);
                nameList.add(values["name"]);
                priceList.add(values["price"]);
                imgList.add(values["image"]);
                print(values);
              }
              // cidList.add(values["category_id"]);
              // nameList.add(values["name"]);
              // priceList.add(values["price"]);
              // imgList.add(values["image"]);
              // print(values);
            });
            //print(userList);
            //print(passList);
            return ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: List.generate(
                  priceList.length,
                  (index) => Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          elevation: 2,
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: (width) * .25,
                                    //color: Colors.amber,
                                    child: Image.network(imgList[index]),
                                  ),
                                  Container(
                                    width: (width) * .6,
                                    //color: Colors.pink[50],
                                    child: Column(
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
                                                  '₹${priceList[index]}  ',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '₹',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                                Text(
                                                  '${priceList[index]}',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black54,
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Center(
                                                    child: Text(
                                                  '₹ ${priceList[index]} OFF',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                )),
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                          child: Text(
                                            nameList[index],
                                            style: TextStyle(fontSize: 20),
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
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                              child: Center(
                                                  child: Text(
                                                "100 kg",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: bgColor),
                                              )),
                                            ),
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Container(
                                                height: 30,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: bgColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Center(
                                                    child: Text(
                                                  'ADD   +',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
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
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
