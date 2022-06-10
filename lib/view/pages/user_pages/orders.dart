import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/model/order.dart';
import 'package:shadid/utils/size_config.dart';
import 'package:shadid/utils/styles.dart';
import 'package:shadid/view/widgets/order_item.dart';
import 'package:shadid/view/widgets/order_item_fixed.dart';
import '../../../utils/constant.dart';

enum OrderType { existing, completed, canceled }

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  var orderType = OrderType.existing;
  late Map<OrderType, String> buttonTitles;
  List<Order> orders = [
    Order(
        id: '#158756',
        description: 'تفاصيل متعلقة بالطلب ونوعه',
        date: '22/11/2022',
        orderType: OrderType.canceled),
    Order(
        id: '#158756',
        description: 'تفاصيل متعلقة بالطلب ونوعه',
        date: '22/11/2022',
        orderType: OrderType.completed),
    Order(
        id: '#158756',
        description: 'تفاصيل متعلقة بالطلب ونوعه',
        date: '22/11/2022',
        orderType: OrderType.canceled)
  ];

  @override
  Widget build(BuildContext context) {
    buttonTitles = {
      OrderType.existing:
          '${AppLocalization.of(context)?.getTranslatedValue('existigOrders')}',
      OrderType.canceled:
          '${AppLocalization.of(context)?.getTranslatedValue('canceledOrders')}',
      OrderType.completed:
          '${AppLocalization.of(context)?.getTranslatedValue('completedOrders')}',
    };

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            '${AppLocalization.of(context)?.getTranslatedValue('orders')}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
          centerTitle: true,
          actions: const [],
        ),
        body: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: Colors.grey[200],
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (notification) {
                notification.disallowIndicator();
                return true;
              },
              child: ListView(clipBehavior: Clip.none, children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    height: SizeConfig.blockV,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: colorTabBarbackground,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            tabBarItem(context, OrderType.existing),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: VerticalDivider(
                                color: colorDivider.withOpacity(0.5),
                              ),
                            ),
                            tabBarItem(context, OrderType.canceled),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: VerticalDivider(
                                color: colorDivider.withOpacity(0.5),
                              ),
                            ),
                            tabBarItem(context, OrderType.completed)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        '${AppLocalization.of(context)?.getTranslatedValue('latestOrders')}',
                        style: titleTextStyle,
                      ),
                    ),
                  ),
                  OrderItemFixed(
                      title: 'نقل عفش',
                      date: 'لأحد 3 أبريل 2022',
                      location: 'النويعمة, وادي الدواسر, الرياض',
                      type: orderType),
                  orderType == OrderType.existing
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              '${AppLocalization.of(context)?.getTranslatedValue('previousOrders')}',
                              style: titleTextStyle,
                            ),
                          ),
                        ),
                  orderType == OrderType.existing
                      ? const SizedBox.shrink()
                      : ListView.separated(
                          shrinkWrap: true,
                          itemCount: orders.length,
                          clipBehavior: Clip.none,
                          physics: NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, i) => const SizedBox(
                            height: 5.0,
                          ),
                          itemBuilder: (context, i) {
                            return OrderItem(
                                id: orders[i].id,
                                description: orders[i].description,
                                date: orders[i].date,
                                orderType: orderType);
                          },
                        )
                ]),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Expanded tabBarItem(BuildContext context, OrderType type) {
    return Expanded(
      flex: 4,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            orderType = type;
          });
        },
        style: (orderType == type)
            ? ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(primaryColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              )
            : ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor:
                    MaterialStateProperty.all(colorTabBarbackground),
              ),
        child: Text(
          buttonTitles[type]!,
          style:
              (orderType == type) ? normalTextStyle : disabledTabBarTextStyle,
        ),
      ),
    );
  }
}
