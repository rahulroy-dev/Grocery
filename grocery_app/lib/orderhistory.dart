import 'package:flutter/material.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  Color bgColor = const Color(0xff3ED857);
  // Color bngColor = const Color(0xff00FF80);
  Color cardColor = const Color(0xFFCBF9E2);
  Color osColor = const Color(0xFFF80000);
  // List<String> orderlist = [
  //   "Order No",
  //   "Order No",
  //   "Order No",
  //   "Order No",
  //   "Order No",
  //   "Order No",
  //   "Order No",
  //   "Order No",
  //   "Order No",
  //   "Order No",
  //   "Order No",
  //   "Order No",
  // ];
  // List<String> orderNo = [
  //   "#1",
  //   "#2",
  //   "#3",
  //   "#4",
  //   "#5",
  //   "#6",
  //   "#7",
  //   "#8",
  //   "#9",
  //   "#10",
  //   "#11",
  //   "#12",
  // ];
  List<String> orderPrice = [
    "₹90",
    "₹190",
    "₹330",
    "₹50",
    "₹250",
    "₹380",
    "₹500",
    "₹765",
    "₹310",
    "₹152",
    "₹70",
    "₹425",
  ];
  // List<String> orderDate = [
  //   "Date",
  //   "Date",
  //   "Date",
  //   "Date",
  //   "Date",
  //   "Date",
  //   "Date",
  //   "Date",
  //   "Date",
  //   "Date",
  //   "Date",
  //   "Date",
  // ];
  List<String> orderDatetime = [
    "28 Oct,2021 1:09 PM",
    "28 Oct,2021 1:09 PM",
    "28 Oct,2021 1:09 PM",
    "28 Oct,2021 1:09 PM",
    "28 Oct,2021 1:09 PM",
    "28 Oct,2021 1:09 PM",
    "28 Oct,2021 1:09 PM",
    "28 Oct,2021 1:09 PM",
    "28 Oct,2021 1:09 PM",
    "28 Oct,2021 1:09 PM",
    "28 Oct,2021 1:09 PM",
    "28 Oct,2021 1:09 PM",
  ];
  List<String> orderStetas = [
    "Pending",
    "Pending",
    "Pending",
    "Pending",
    "Pending",
    "Pending",
    "Pending",
    "Pending",
    "Pending",
    "Pending",
    "Pending",
    "Pending",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        toolbarHeight: 70,
        centerTitle: true,
        title: const Text(
          "Order History",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        bottom: const PreferredSize(
            child: SizedBox(
              height: 0,
            ),
            preferredSize: Size.fromHeight(5)),
      ),
      body: Container(
        color: bgColor,
        child: Column(
          children: [
            Expanded(
              flex: 13,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 15.0, right: 5, left: 5),
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: orderPrice.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: cardColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Order No",
                                      // orderlist[index],
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 6,
                                      ),
                                      child: Text(
                                        // orderNo[index],
                                        "#${index + 1}",
                                        style: const TextStyle(fontSize: 20.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Text(
                                        orderPrice[index],
                                        style: const TextStyle(fontSize: 20.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Date",
                                      // orderDate[index],
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 3, bottom: 3),
                                      child: Text(orderDatetime[index],
                                          style:
                                              const TextStyle(fontSize: 20.0)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Container(
                                        height: 27,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: osColor,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(
                                            orderStetas[index],
                                            style: const TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
