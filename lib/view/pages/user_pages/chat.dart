// ignore_for_file: use_key_in_widget_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/view/pages/user_pages/others.dart';
import 'package:shadid/view/pages/user_pages/quick_trans.dart';
import 'package:shadid/view/pages/user_pages/trucks.dart';

enum GetOrderFrom { quickTrans, trucks, others }

class Chat extends StatefulWidget {
  static GetOrderFrom? getOrderFrom;
  final double price;
  final Color color;
  const Chat({
    required this.price,
    required this.color,
  });

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    double valueAddedTax = (widget.price * 15) / 100;
    double appCommission = (widget.price * 2) / 100;
    double finalPrice = valueAddedTax + appCommission + widget.price;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        title: Text(
          Chat.getOrderFrom == GetOrderFrom.quickTrans
              ? 'نقل سريع'
              : Chat.getOrderFrom == GetOrderFrom.trucks
                  ? 'شاحنات و دينات'
                  : 'أخرى',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[100],
              child: Image.asset('assets/img/clients_help_icon.png'),
            ),
          ),
        ],
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.maybePop(context);
          },
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          // alignment: Alignment.bottomCenter,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (notification) {
                    notification.disallowIndicator();
                    return true;
                  },
                  child: ListView(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          '#2334',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 80.0,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              width: MediaQuery.of(context).size.width / 2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                ),
                              ),
                              child: Text(
                                Chat.getOrderFrom == GetOrderFrom.quickTrans
                                    ? "${QuickTrans.order}"
                                    : Chat.getOrderFrom == GetOrderFrom.trucks
                                        ? "${Trucks.order}"
                                        : "${Others.order}",
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.done_all,
                                  size: 18.0,
                                  color: primaryColor,
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                const Text(
                                  '08:57 PM',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10.0),
                              width: MediaQuery.of(context).size.width / 2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${AppLocalization.of(context)?.getTranslatedValue('billet')}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                      '${AppLocalization.of(context)?.getTranslatedValue('costDelivery')} : ${widget.price} ر.س'),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                      '${AppLocalization.of(context)?.getTranslatedValue('valueAddedTax')} : 15%'),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                      '${AppLocalization.of(context)?.getTranslatedValue('appCommission')} : 2%'),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                      '${AppLocalization.of(context)?.getTranslatedValue('finalPrice')} : $finalPrice ر.س'),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                      '${AppLocalization.of(context)?.getTranslatedValue('taxNumber')} : 123456789'),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.done_all,
                                  size: 18.0,
                                  color: primaryColor,
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                const Text(
                                  '08:57 PM',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 80.0,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              width: MediaQuery.of(context).size.width / 2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                ),
                              ),
                              child: const Text(
                                'أهلا! معك الكابتن من سديد يسعدني خدمتك',
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CircleAvatar(
                                  backgroundColor: widget.color,
                                  maxRadius: 12.0,
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Icon(
                                  Icons.done_all,
                                  size: 18.0,
                                  color: primaryColor,
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                const Text(
                                  '08:57 PM',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 45.0,
                      child: TextFormField(
                        cursorColor: primaryColor,
                        cursorWidth: 1.0,
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {},
                            color: primaryColor,
                            icon: const Icon(Icons.send),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide(
                                color: primaryColor,
                              )),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    color: Colors.grey[600],
                    iconSize: 32.0,
                    icon: const Icon(Icons.camera_alt_rounded),
                  ),
                  IconButton(
                    onPressed: () {},
                    color: Colors.grey[600],
                    iconSize: 34.0,
                    icon: const Icon(Icons.mic_none_rounded),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
