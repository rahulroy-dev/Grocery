import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:grocery_app/utils/colorvar.dart';

import '../constantVarriables.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final dbRefAddress = FirebaseDatabase.instance.reference().child('Address');
  TextEditingController nameControler = TextEditingController();
  TextEditingController phoneControler = TextEditingController();
  TextEditingController pinControler = TextEditingController();
  //TextEditingController stateControler = TextEditingController();
  TextEditingController cityControler = TextEditingController();
  TextEditingController addl1Controler = TextEditingController();
  TextEditingController addl2Controler = TextEditingController();
  TextEditingController landmarkControler = TextEditingController();
  //final formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String add1 = "";
  String add2 = "";
  List<String> items = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttarakhand",
    "Uttar Pradesh",
    "West Bengal",
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
    "Lakshadweep",
    "Puducherry"
  ];
  String? ddv;

  String latitude = "";
  String longitude = "";

  void getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    setState(() {
      latitude = position.latitude.toString();
      longitude = position.longitude.toString();

      ddv = placemarks[0].administrativeArea.toString();
      pinControler.text = placemarks[0].postalCode.toString();
      cityControler.text = placemarks[0].locality.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(gradient: bg1),
      child: Scaffold(
        backgroundColor: Color(0x000000),
        appBar: AppBar(
          backgroundColor: Color(0x000000),
          elevation: 0,
          title: Text("Add delivery address"),
        ),
        body: StreamBuilder(
            stream: dbRefAddress.onValue,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snap) {
              return Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Container(
                  height: height,
                  padding: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              autofocus: true,
                              controller: nameControler,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Provide the necessary details.";
                                } else
                                  return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  floatingLabelStyle:
                                      TextStyle(color: Colors.grey[500]),
                                  labelText: "Full Name(Required)*"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              autofocus: true,
                              controller: phoneControler,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value!.length == 10) {
                                  return null;
                                } else
                                  return "Please Provide the necessary details.";
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  floatingLabelStyle:
                                      TextStyle(color: Colors.grey[500]),
                                  labelText: "Phone Number(Required)*"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: width / 2 - 20,
                                  child: TextFormField(
                                    autofocus: true,
                                    controller: pinControler,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter pincode.";
                                      } else
                                        return null;
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        floatingLabelStyle:
                                            TextStyle(color: Colors.grey[500]),
                                        labelText: "Pincode (Required)*"),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    getLocation();
                                  },
                                  child: Container(
                                    width: width / 2 - 20,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        gradient: bg1),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.my_location,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Center(
                                            child: Text(
                                          "Use my location",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: width / 2 - 20,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 11.0),
                                      child: DropdownButton(
                                        icon: SizedBox(),
                                        value: ddv,
                                        hint: Text("State (Required)*"),
                                        isExpanded: true,
                                        underline: SizedBox(),
                                        items: items.map((String items) {
                                          return DropdownMenuItem(
                                              value: items, child: Text(items));
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            ddv = newValue!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: width / 2 - 20,
                                  child: TextFormField(
                                    autofocus: true,
                                    controller: cityControler,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter city.";
                                      } else
                                        return null;
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        floatingLabelStyle:
                                            TextStyle(color: Colors.grey[500]),
                                        labelText: "City (Required)*"),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              autofocus: true,
                              controller: addl1Controler,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Provide the necessary details.";
                                } else
                                  return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  floatingLabelStyle:
                                      TextStyle(color: Colors.grey[500]),
                                  labelText:
                                      "House No., Building Name (Required)*"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              autofocus: true,
                              controller: addl2Controler,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Provide the necessary details.";
                                } else
                                  return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  floatingLabelStyle:
                                      TextStyle(color: Colors.grey[500]),
                                  labelText:
                                      "Road name, Area, Colony (Required)*"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              autofocus: true,
                              controller: landmarkControler,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  floatingLabelStyle:
                                      TextStyle(color: Colors.grey[500]),
                                  labelText:
                                      "Nearby Famous Shop/Mall/Landmark"),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                                onTap: () {
                                  if (!formkey.currentState!.validate()) {
                                    return;
                                  }
                                  dbRefAddress.push().set({
                                    "city": nameControler.text,
                                    "house_no": addl1Controler.text,
                                    "landmark": landmarkControler.text,
                                    "name": nameControler.text,
                                    "phone": phoneControler.text,
                                    "state": ddv,
                                    "street": addl2Controler.text,
                                    "user_id":
                                        preferences!.getString("user_id"),
                                    "zip": pinControler.text
                                  });
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 35,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      gradient: bg1,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
              // return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
