// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/view/auth/auth_captain/delivery_data.dart';
import 'package:shadid/view/auth/auth_captain/delivery_number.dart';
import 'package:shadid/view/auth/auth_captain/images.dart';
import 'package:shadid/view/widgets/customButton.dart';

class CaptainRegister extends StatefulWidget {
  // CaptainRegister({super.key, this.currentPage});
  @override
  _CaptainRegisterState createState() {
    return _CaptainRegisterState();
  }
}

class _CaptainRegisterState extends State<CaptainRegister> {
  int _currentPage = 0;
  List<Widget> pages = [
    DeliveryData(),
    DeliveryNumber(),
    Images(),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontFamily: 'Tajawal',
        ),
        title: Text(
            '${AppLocalization.of(context)?.getTranslatedValue('signAsServiceProvider')}'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      maxRadius: 12.0,
                      backgroundColor: primaryColor,
                      child: const Text(
                        '1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '${AppLocalization.of(context)?.getTranslatedValue('deliveryData')}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                ),
                Column(
                  children: [
                    CircleAvatar(
                      maxRadius: 12.0,
                      backgroundColor: _currentPage == 1 || _currentPage == 2
                          ? primaryColor
                          : Colors.grey[200],
                      child: Text(
                        '2',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _currentPage == 1 || _currentPage == 2
                              ? Colors.white
                              : Colors.grey,
                          fontSize: 18.0,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '${AppLocalization.of(context)?.getTranslatedValue('deliveryNumber')}',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: _currentPage == 1 || _currentPage == 2
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                ),
                Column(
                  children: [
                    CircleAvatar(
                      maxRadius: 12.0,
                      backgroundColor:
                          _currentPage == 2 ? primaryColor : Colors.grey[200],
                      child: Text(
                        '3',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _currentPage == 2 ? Colors.white : Colors.grey,
                          fontSize: 18.0,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '${AppLocalization.of(context)?.getTranslatedValue('requiredImages')}',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: _currentPage == 2 ? Colors.black : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //
          // Forms ...
          //
          Expanded(
            child: Builder(
              builder: (context) {
                if (_currentPage == 0) {
                  return DeliveryData();
                }
                if (_currentPage == 1) {
                  return DeliveryNumber();
                }
                return Images();
              },
            ),
          ),
          //
          //
          //
          Padding(
            padding: _currentPage == 2
                ? EdgeInsets.zero
                : EdgeInsets.only(
                    right: 20.0,
                    left: 20.0,
                    bottom: _currentPage == 1 ? 120.0 : 50.0,
                  ),
            child: Builder(
              builder: (context) {
                if (_currentPage == 0) {
                  if (DeliveryData.serviceType != null &&
                      DeliveryData.firstName != null &&
                      DeliveryData.nickName != null) {
                    return CustomButton(
                      onPressed: () {
                        if (_currentPage <= 1 && _currentPage >= 0) {
                          setState(() {
                            _currentPage++;
                          });
                        }
                      },
                      title:
                          '${AppLocalization.of(context)?.getTranslatedValue('next')}',
                      context: context,
                    );
                  } else {
                    return CustomButton(
                      onPressed: () {},
                      color: Colors.grey,
                      title:
                          '${AppLocalization.of(context)?.getTranslatedValue('next')}',
                      context: context,
                    );
                  }
                }
                if (_currentPage == 1) {
                  if (DeliveryNumber.phoneNum != null &&
                      DeliveryNumber.email != null &&
                      DeliveryNumber.bankNum != null) {
                    return CustomButton(
                      onPressed: () {
                        if (_currentPage <= 1 && _currentPage >= 0) {
                          setState(() {
                            _currentPage++;
                          });
                        }
                      },
                      title:
                          '${AppLocalization.of(context)?.getTranslatedValue('next')}',
                      context: context,
                    );
                  } else {
                    return CustomButton(
                      onPressed: () {},
                      color: Colors.grey,
                      title:
                          '${AppLocalization.of(context)?.getTranslatedValue('next')}',
                      context: context,
                    );
                  }
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
