import 'package:flutter/material.dart';
import 'package:shadid/utils/constant.dart';

enum OrdersTypes { availableOffers, previousOffers }

class OrdersCaptain extends StatefulWidget {
  const OrdersCaptain({Key? key}) : super(key: key);

  @override
  State<OrdersCaptain> createState() => _OrdersCaptainState();
}

class _OrdersCaptainState extends State<OrdersCaptain> {
  OrdersTypes orderType = OrdersTypes.availableOffers;
  List<Map<String, dynamic>> previousOffersList = [
    {
      'orderStatus': 'ملغي',
      'orderNumber': '#158756',
      'orderDate': '22/11/2022',
      'order': 'توصيل أثاث و أغراض',
    },
    {
      'orderStatus': 'مكتمل',
      'orderNumber': '#153773',
      'orderDate': '15/8/2022',
      'order': 'توصيل أدوات كهربائية',
    },
    {
      'orderStatus': 'مكتمل',
      'orderNumber': '#174293',
      'orderDate': '13/10/2022',
      'order': 'توصيل مركبة',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60.0,
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            orderType = OrdersTypes.availableOffers;
                          });
                        },
                        child: Container(
                          height: 60.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: orderType == OrdersTypes.availableOffers
                                ? primaryColor
                                : Colors.grey[100],
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Text(
                            'العروض المتاحة',
                            style: TextStyle(
                              color: orderType == OrdersTypes.availableOffers
                                  ? Colors.white
                                  : Colors.grey,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    VerticalDivider(
                      indent: 5.0,
                      endIndent: 5.0,
                      color: Colors.grey[500],
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            orderType = OrdersTypes.previousOffers;
                          });
                        },
                        child: Container(
                          height: 60.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: orderType == OrdersTypes.previousOffers
                                ? primaryColor
                                : Colors.grey[100],
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Text(
                            'العروض السابقة',
                            style: TextStyle(
                              color: orderType == OrdersTypes.previousOffers
                                  ? Colors.white
                                  : Colors.grey,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (orderType == OrdersTypes.availableOffers)
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await Future.delayed(
                      const Duration(seconds: 2),
                      () {},
                    );
                  },
                  color: primaryColor,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    itemCount: 1,
                    separatorBuilder: (context, i) =>
                        const SizedBox(height: 10.0),
                    itemBuilder: (context, i) {
                      return availableOffers();
                    },
                  ),
                ),
              )
            else
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await Future.delayed(
                      const Duration(seconds: 2),
                      () {},
                    );
                  },
                  color: primaryColor,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    itemCount: 3,
                    separatorBuilder: (context, i) =>
                        const SizedBox(height: 10.0),
                    itemBuilder: (context, i) {
                      return previousOffers(
                        orderStatus: previousOffersList[i]['orderStatus'],
                        orderNumber: previousOffersList[i]['orderNumber'],
                        orderDate: previousOffersList[i]['orderDate'],
                        order: previousOffersList[i]['order'],
                        statusColor:
                            previousOffersList[i]['orderStatus'] == 'ملغي'
                                ? Colors.red
                                : primaryColor,
                      );
                    },
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget availableOffers() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100.0,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '#158756',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('توصيل أثاث و أغراض'),
              Text('22/11/2022'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'منذ 5د',
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 75.0,
                  padding: const EdgeInsets.all(6.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const Text(
                    'قدم',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //
  //

  Widget previousOffers({
    required String orderStatus,
    required String orderNumber,
    required String orderDate,
    required String order,
    required Color statusColor,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100.0,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                orderNumber,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(order),
              Text(orderDate),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              orderStatus,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: statusColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
