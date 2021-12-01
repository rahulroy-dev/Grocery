import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class Offer extends StatefulWidget {
  const Offer({Key? key}) : super(key: key);

  @override
  _OfferState createState() => _OfferState();
}

class _OfferState extends State<Offer> {
  Color bgColor = Color(0xFF08db5c);

  @override
  Widget build(BuildContext context) {
    List<double> price = [60, 60, 70, 80, 100, 90, 100];
    List<double> mrp = [80, 100, 100, 100, 120, 130, 110];
    List<int> off = [];
    for (var i = 0; i < price.length; i++) {
      double s = mrp[i] - price[i];
      off.add(s.toInt());
    }

    // for (var i = 0; i < price.length; i++) {
    //   double percent = (mrp[i] - price[i]) / mrp[i] * 100;
    //   off.add(percent.toInt());
    // }
    List<String> img = [
      'https://i.ibb.co/fpqqNS7/400-good-day-britannia-original-imafwh3rxpqqzzfy.jpg',
      'https://i.ibb.co/0sN4vks/75-milano-centre-filled-cookies-parle-original-imafxk72trkembkp.jpg',
      'https://i.ibb.co/Cbhgc9K/fruit-biscuits-karachi-bakery-original-imagyn7dbyj7ab8r.jpg',
      'https://i.ibb.co/5W0Czp5/450-assorted-cookies-unibic-original-imaf4yuek3zqf4ty.jpg',
      'https://i.ibb.co/3d1FDMT/mom-s-magic-cashew-almonds-biscuits-sunfeast-original-imag5erfh8hqdbhy.jpg',
      'https://i.ibb.co/yhHGKSG/200-premium-international-salted-party-mix-pouch-happilo-original-imafwhmvnnbybg7f.jpg',
      'https://i.ibb.co/fdCK4Zr/151-2-o-rice-light-and-tasty-orion-original-imag2zphhzt8wgme.jpg'
    ];
    List<String> title = [
      'BRITANNIA Good Day Chocochip s Cookies',
      'PARLE Milano Centre Filled Cookies',
      'KARACHI BAKERY Fruit Bakery Biscuit',
      'UNIBIC Assorted Cookies',
      "Sunfeast Mom's Magic Cashew and Almonds Cookies",
      'Happilo Premium International Salted Party Mix',
      "ORION O'Rice Light and Tasty Crackers"
    ];
    List<String> weight = [
      '100.00 gm.',
      '80.00 gm.',
      '120.00 gm.',
      '200.00 gm.',
      '100.00 gm.',
      '80.00 gm.',
      '180.00 gm.'
    ];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: bgColor,
        title: Text(
          'Offer',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      backgroundColor: bgColor,
      body: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          color: Colors.grey[200],
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: List.generate(
              price.length,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: (width) * .25,
                                //color: Colors.amber,
                                child: Image.network(img[index]),
                              ),
                              Container(
                                width: (width) * .6,
                                //color: Colors.pink[50],
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              '₹${price[index].toStringAsFixed(2)}  ',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '₹',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black54,
                                              ),
                                            ),
                                            Text(
                                              '${mrp[index].toStringAsFixed(2)}',
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
                                            padding: const EdgeInsets.all(4.0),
                                            child: Center(
                                                child: Text(
                                              '₹ ${off[index]} OFF',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      child: Text(
                                        title[index],
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
                                            weight[index],
                                            style: TextStyle(
                                                fontSize: 18, color: bgColor),
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
                                                    BorderRadius.circular(5)),
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
        ),
      ),
    );
  }
}
