// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shadid/localization/localization.dart';

import 'package:shadid/utils/constant.dart';
import 'package:shadid/utils/styles.dart';
import 'package:shadid/view/pages/user_pages/orders.dart';

class OrderItem extends StatefulWidget {
  String id;
  String description;
  String date;
  OrderType orderType;

  OrderItem({
    Key? key,
    required this.id,
    required this.description,
    required this.date,
    required this.orderType,
  }) : super(key: key);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: colorTabBarbackground),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.id,
                style: orderIdText,
              ),
              Text(
                widget.orderType == OrderType.canceled
                    ? '${AppLocalization.of(context)?.getTranslatedValue('canceledOrders')}'
                    : '${AppLocalization.of(context)?.getTranslatedValue('completedOrders')}',
                style: widget.orderType == OrderType.canceled
                    ? satusCanceledText
                    : satusCompletedText,
              )
            ],
          ),
          Text(
            widget.description,
            style: orderIdText,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            widget.date,
            style: orderDateText,
          ),
        ],
      ),
    );
  }
}
