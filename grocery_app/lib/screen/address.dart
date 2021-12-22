import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/constantVarriables.dart';
import 'package:grocery_app/screen/addAddress.dart';
import 'package:grocery_app/screen/editAddress.dart';
import 'package:grocery_app/utils/colorvar.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  bool tappedYes = false;
  bool valuefirst = false;
  final dbRefAddress = FirebaseDatabase.instance.reference().child('Address');
  List addressList = [];
  List keyList = [];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(gradient: bg1),
      child: Scaffold(
          bottomSheet: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                child: Container(
                  height: 40,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    gradient: bg1,
                  ),
                  //color: Colors.amber),
                  alignment: Alignment.center,
                  child: Text(
                    "Add Address +",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddAddress()));
                },
              ),
            ),
          ),
          backgroundColor: Color(0x00000),
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
            elevation: 0,
            backgroundColor: Color(0x00000),
            title: Text(
              'My Addresses',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            centerTitle: true,
          ),
          body: Container(
            height: height,
            padding: const EdgeInsets.only(top: 15.0),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
            child: StreamBuilder(
                stream: dbRefAddress
                    // .orderByChild("user_id")
                    // .equalTo(preferences!.getString('user_id'))
                    .onValue,
                builder: (BuildContext context, AsyncSnapshot<dynamic> snap) {
                  if (snap.hasData &&
                      !snap.hasError &&
                      snap.data.snapshot.value != null) {
                    Map orderValues = snap.data.snapshot.value;
                    addressList.clear();
                    keyList.clear();

                    orderValues.forEach((key, values) {
                      if (values["user_id"] ==
                          preferences!.getString('user_id')) {
                        addressList.add(values);
                        keyList.add(key);
                        print(keyList);
                      }
                    });
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\t\t\t${addressList.length} SAVED ADDRESSES",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 12),
                          ),
                          Container(
                            //color: Colors.amber,
                            height: height - 40,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                children: List.generate(
                                  addressList.length,
                                  (index) => Card(
                                    child: Container(
                                      //height: 150,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Container(
                                            width: width,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              //color: Colors.grey[100],
                                            ),
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          //width: width * 0.90,
                                                          child: Text(
                                                            addressList[index]
                                                                ["name"],
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Container(
                                                          //width: (width * 0.10) - 10,
                                                          child:
                                                              PopupMenuButton(
                                                            color: Colors
                                                                .blueGrey[200],
                                                            child: Icon(
                                                              Icons.more_vert,
                                                              size: 25,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            onSelected:
                                                                (value) {
                                                              setState(() {
                                                                if (value ==
                                                                    1) {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              EditAddress(addid: keyList[index])));
                                                                } else if (value ==
                                                                    2) {
                                                                  dbRefAddress
                                                                      .child(keyList[
                                                                          index])
                                                                      .remove();
                                                                }
                                                              });
                                                            },
                                                            itemBuilder:
                                                                (context) => [
                                                              PopupMenuItem(
                                                                child: Text(
                                                                  "Edit",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          15),
                                                                ),
                                                                value: 1,
                                                              ),
                                                              PopupMenuItem(
                                                                child: Text(
                                                                    "Delete",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            15)),
                                                                value: 2,
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      addressList[index]
                                                              ["house_no"] +
                                                          "," +
                                                          addressList[index]
                                                              ["street"] +
                                                          "," +
                                                          addressList[index]
                                                              ["landmark"] +
                                                          "," +
                                                          addressList[index]
                                                              ["city"] +
                                                          "," +
                                                          addressList[index]
                                                              ["state"] +
                                                          "-" +
                                                          addressList[index]
                                                              ["zip"],
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      addressList[index]
                                                          ["phone"],
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                ))),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          )),
    );
  }
}
