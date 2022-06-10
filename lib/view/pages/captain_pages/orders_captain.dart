import 'package:flutter/material.dart';
import 'package:shadid/utils/constant.dart';

enum OrdersTypes { coming, canceled, completed }

class OrdersCaptain extends StatefulWidget {
  const OrdersCaptain({Key? key}) : super(key: key);

  @override
  State<OrdersCaptain> createState() => _OrdersCaptainState();
}

class _OrdersCaptainState extends State<OrdersCaptain> {
  OrdersTypes orderType = OrdersTypes.coming;

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
                            orderType = OrdersTypes.coming;
                          });
                        },
                        child: Container(
                          height: 60.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: orderType == OrdersTypes.coming
                                ? primaryColor
                                : Colors.grey[100],
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Text(
                            'العروض المتاحة',
                            style: TextStyle(
                              color: orderType == OrdersTypes.coming
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
                            orderType = OrdersTypes.canceled;
                          });
                        },
                        child: Container(
                          height: 60.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: orderType == OrdersTypes.canceled
                                ? primaryColor
                                : Colors.grey[100],
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Text(
                            'العروض السابقة',
                            style: TextStyle(
                              color: orderType == OrdersTypes.canceled
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
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                itemCount: 1,
                separatorBuilder: (context, i) => const SizedBox(height: 20.0),
                itemBuilder: (context, i) {
                  return itemBuilder();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemBuilder() {
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
}
