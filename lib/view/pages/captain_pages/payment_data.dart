// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shadid/utils/captain_profile_icons_icons.dart';

enum PaymentType {
  Electronic(
    isDefaulte: true,
    hasOptions: true,
  ),
  Cash(
    isDefaulte: false,
    hasOptions: false,
  );

  final bool isDefaulte;
  final bool hasOptions;
  const PaymentType({
    required this.isDefaulte,
    required this.hasOptions,
  });
}

class PaymentData extends StatefulWidget {
  const PaymentData({Key? key}) : super(key: key);

  @override
  State<PaymentData> createState() => _PaymentDataState();
}

class _PaymentDataState extends State<PaymentData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 75.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.maybePop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        titleTextStyle: const TextStyle(
          fontSize: 20.0,
          fontFamily: 'Tajawal',
          color: Colors.black,
        ),
        title: const Text('بيانات الدفع'),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: paymentDataList.length,
            separatorBuilder: (context, i) => const SizedBox(height: 20.0),
            itemBuilder: (context, i) {
              return paymentData(
                paymentType: paymentDataList[i]['type'],
                index: i,
                title: paymentDataList[i]['title'],
                icon: paymentDataList[i]['icon'],
                details: paymentDataList[i]['details'],
              );
            },
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> paymentDataList = [
    {
      'title': 'كاش',
      'icon': CaptainProfileIcons.payment,
      'details': '',
      'type': PaymentType.Cash,
    },
    {
      'title': '5670********',
      'icon': 'assets/img/captain_icons/bank_icon.png',
      'details': 'افتراضي',
      'type': PaymentType.Electronic,
    },
    {
      'title': '7980********',
      'icon': 'assets/img/captain_icons/visa_icon.png',
      'details': '',
      'type': PaymentType.Electronic,
    },
    {
      'title': 'كاش',
      'icon': CaptainProfileIcons.payment,
      'details': '',
      'type': PaymentType.Cash,
    },
    {
      'title': '5670********',
      'icon': 'assets/img/captain_icons/bank_icon.png',
      'details': 'افتراضي',
      'type': PaymentType.Electronic,
    },
    {
      'title': '7980********',
      'icon': 'assets/img/captain_icons/visa_icon.png',
      'details': '',
      'type': PaymentType.Electronic,
    },
    {
      'title': 'كاش',
      'icon': CaptainProfileIcons.payment,
      'details': '',
      'type': PaymentType.Cash,
    },
    {
      'title': '5670********',
      'icon': 'assets/img/captain_icons/bank_icon.png',
      'details': 'افتراضي',
      'type': PaymentType.Electronic,
    },
    {
      'title': '7980********',
      'icon': 'assets/img/captain_icons/visa_icon.png',
      'details': '',
      'type': PaymentType.Electronic,
    },
    {
      'title': 'كاش',
      'icon': CaptainProfileIcons.payment,
      'details': '',
      'type': PaymentType.Cash,
    },
    {
      'title': '5670********',
      'icon': 'assets/img/captain_icons/bank_icon.png',
      'details': 'افتراضي',
      'type': PaymentType.Electronic,
    },
    {
      'title': '7980********',
      'icon': 'assets/img/captain_icons/visa_icon.png',
      'details': '',
      'type': PaymentType.Electronic,
    },
    {
      'title': 'كاش',
      'icon': CaptainProfileIcons.payment,
      'details': '',
      'type': PaymentType.Cash,
    },
    {
      'title': '5670********',
      'icon': 'assets/img/captain_icons/bank_icon.png',
      'details': 'افتراضي',
      'type': PaymentType.Electronic,
    },
    {
      'title': '7980********',
      'icon': 'assets/img/captain_icons/visa_icon.png',
      'details': '',
      'type': PaymentType.Electronic,
    },
    {
      'title': 'كاش',
      'icon': CaptainProfileIcons.payment,
      'details': '',
      'type': PaymentType.Cash,
    },
    {
      'title': '5670********',
      'icon': 'assets/img/captain_icons/bank_icon.png',
      'details': 'افتراضي',
      'type': PaymentType.Electronic,
    },
    {
      'title': '7980********',
      'icon': 'assets/img/captain_icons/visa_icon.png',
      'details': '',
      'type': PaymentType.Electronic,
    },
    {
      'title': 'كاش',
      'icon': CaptainProfileIcons.payment,
      'details': '',
      'type': PaymentType.Cash,
    },
    {
      'title': '5670********',
      'icon': 'assets/img/captain_icons/bank_icon.png',
      'details': 'افتراضي',
      'type': PaymentType.Electronic,
    },
    {
      'title': '7980********',
      'icon': 'assets/img/captain_icons/visa_icon.png',
      'details': '',
      'type': PaymentType.Electronic,
    },
    {
      'title': 'كاش',
      'icon': CaptainProfileIcons.payment,
      'details': '',
      'type': PaymentType.Cash,
    },
    {
      'title': '5670********',
      'icon': 'assets/img/captain_icons/bank_icon.png',
      'details': 'افتراضي',
      'type': PaymentType.Electronic,
    },
    {
      'title': '7980********',
      'icon': 'assets/img/captain_icons/visa_icon.png',
      'details': '',
      'type': PaymentType.Electronic,
    },
    {
      'title': 'كاش',
      'icon': CaptainProfileIcons.payment,
      'details': '',
      'type': PaymentType.Cash,
    },
    {
      'title': '5670********',
      'icon': 'assets/img/captain_icons/bank_icon.png',
      'details': 'افتراضي',
      'type': PaymentType.Electronic,
    },
    {
      'title': '7980********',
      'icon': 'assets/img/captain_icons/visa_icon.png',
      'details': '',
      'type': PaymentType.Electronic,
    },
    {
      'title': 'كاش',
      'icon': CaptainProfileIcons.payment,
      'details': '',
      'type': PaymentType.Cash,
    },
    {
      'title': '5670********',
      'icon': 'assets/img/captain_icons/bank_icon.png',
      'details': 'افتراضي',
      'type': PaymentType.Electronic,
    },
    {
      'title': '7980********',
      'icon': 'assets/img/captain_icons/visa_icon.png',
      'details': '',
      'type': PaymentType.Electronic,
    },
  ];

  Widget paymentData({
    required String title,
    required var icon,
    required String details,
    required int index,
    required PaymentType paymentType,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (paymentType == PaymentType.Cash)
              CircleAvatar(
                child: Icon(icon),
              ),
            if (paymentType == PaymentType.Electronic)
              CircleAvatar(
                child: Image.asset("$icon"),
              ),
            const SizedBox(
              width: 10.0,
            ),
            Text(title),
          ],
        ),
        Row(
          children: [
            Text(details),
            if (paymentType.hasOptions == true)
              PopupMenuButton(
                itemBuilder: (context) {
                  return <PopupMenuEntry>[];
                },
              ),
          ],
        ),
      ],
    );
  }
}
