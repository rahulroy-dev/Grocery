import 'package:flutter/material.dart';

class Mycart extends StatefulWidget {
  const Mycart({Key? key}) : super(key: key);

  @override
  _MycartState createState() => _MycartState();
}

class _MycartState extends State<Mycart> {
  Color bgcolor = Color(0xFF08db5c);
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

  @override
  Widget build(BuildContext context) {
    List<int> total = [];
    for (int i = 0; i <= 5; i++) {
      int sum = 20;
      total.add(sum);
    }
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: bgcolor,
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
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text(
                  "2 items",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
        leading: new Icon(Icons.arrow_back_ios),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 40.0,
            ),
            Column(
                children: List.generate(
              img.length,
              (index) => Container(
                height: 140,
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(5.0, 5.0),
                        blurRadius: 10.0,
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      //imgage
                      children: [
                        Image.network(
                          img[index],
                          height: 140.0,
                          width: 110.0,
                        )
                      ],
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              //price;
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 25)),
                                Text(
                                  price[index],
                                  style: TextStyle(
                                      color: bgcolor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.0),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  dprice[index],
                                  style: TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 19.0),
                                ),
                                SizedBox(
                                  width: 30.0,
                                ),
                                Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Center(
                                          child: Text(
                                        "  " +
                                            total[index].toString() +
                                            "% OFF  ",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2.0))))
                              ],
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 90.0),
                                  child: Text(
                                    name[index],
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //weight
                              children: [
                                Card(
                                  child: Container(
                                    height: 20.0,
                                    child: Center(
                                        child: Text(
                                      "  " + weigth[index] + "  ",
                                      style: TextStyle(
                                        color: bgcolor,
                                      ),
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  width: 50.0,
                                ),
                                Card(
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
                                        color: bgcolor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5.0),
                                        )),
                                  ),
                                ),
                                Text("   1   "),
                                Card(
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
                                        color: bgcolor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5.0),
                                        )),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
            Container(
              height: 290,
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Bill Details",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      "Total                                                            490.00",
                      style: TextStyle(fontSize: 17),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                        "Products Discount                                      89.00",
                        style: TextStyle(fontSize: 17)),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                        "Delivery Charges                                           0.00",
                        style: TextStyle(fontSize: 17)),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                        "CGST                                                               0.00",
                        style: TextStyle(fontSize: 17)),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                        "IGST                                                                0.00",
                        style: TextStyle(fontSize: 17)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                      child: Container(
                        height: 2,
                        width: w,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                        "Total Pay                                                     401.00",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600)),
                  ],
                ),
                alignment: Alignment.topLeft,
              ),
              padding: EdgeInsets.only(left: 10, top: 10),
            ),
          ],
        ),
      ),
    );
  }
}
