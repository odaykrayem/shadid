// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable, null_check_always_fails, list_remove_unrelated_type

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/utils/custom_icon_icons.dart';
import 'package:shadid/utils/navBarPainter.dart';
import 'package:shadid/view/pages/splash.dart';
import 'package:shadid/view/pages/user_pages/massages.dart';
import 'package:shadid/view/pages/user_pages/my_account.dart';
import 'package:shadid/view/pages/user_pages/orders.dart';
import 'package:shadid/view/pages/user_pages/user_mainPage.dart';

enum SearchOptions { open, close }

class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() {
    return _UserHomeState();
  }
}

class _UserHomeState extends State<UserHome> {
  FirebaseAuth? _auth;

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    debugPrint(_auth?.currentUser?.phoneNumber);
  }

  int indexPage = 0;
  @override
  Widget build(BuildContext context) {
    double widthNavBar = MediaQuery.of(context).size.width;
    double heightNavBar = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Builder(
                builder: (context) {
                  if (indexPage == 0) {
                    return UserMainPage();
                  }
                  if (indexPage == 1) {
                    return Orders(
                      selectedOrderType: OrderType.existing,
                    );
                  }
                  if (indexPage == 2) {
                    return const Massages();
                  }
                  return const MyAccount();
                },
              ),
            ),
            SizedBox(
              height: 110.0,
              child: CustomPaint(
                size: Size(widthNavBar,
                    (widthNavBar * 0.27466666666666667).toDouble()),
                painter: NavBarPainter(),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 20.0,
                    left: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              indexPage = 0;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CustomIcon.home,
                                  color: indexPage == 0
                                      ? primaryColor
                                      : Colors.grey[700],
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  '${AppLocalization.of(context)?.getTranslatedValue('home')}',
                                  style: TextStyle(
                                    color: indexPage == 0
                                        ? primaryColor
                                        : Colors.grey[700],
                                  ),
                                  textAlign: TextAlign
                                      .center, //this to look better in english version 5 inches screen
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              indexPage = 1;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CustomIcon.list,
                                  color: indexPage == 1
                                      ? primaryColor
                                      : Colors.grey[700],
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  '${AppLocalization.of(context)?.getTranslatedValue('orders')}',
                                  style: TextStyle(
                                    color: indexPage == 1
                                        ? primaryColor
                                        : Colors.grey[700],
                                  ),
                                  textAlign: TextAlign
                                      .center, //this to look better in english version 5 inches screen
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: GestureDetector(
                            onTap: () {
                              _signOut().then((value) {
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const Splash();
                                }), (route) => false);
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: primaryColor,
                              maxRadius: 30.0,
                              child: Image.asset('assets/img/ex_logo.png'),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              indexPage = 2;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CustomIcon.chat,
                                  color: indexPage == 2
                                      ? primaryColor
                                      : Colors.grey[700],
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  '${AppLocalization.of(context)?.getTranslatedValue('messages')}',
                                  style: TextStyle(
                                    color: indexPage == 2
                                        ? primaryColor
                                        : Colors.grey[700],
                                  ),
                                  textAlign: TextAlign
                                      .center, //this to look better in english version 5 inches screen
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              indexPage = 3;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CustomIcon.person,
                                  color: indexPage == 3
                                      ? primaryColor
                                      : Colors.grey[700],
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  '${AppLocalization.of(context)?.getTranslatedValue('myAccount')}',
                                  style: TextStyle(
                                    color: indexPage == 3
                                        ? primaryColor
                                        : Colors.grey[700],
                                  ),
                                  textAlign: TextAlign
                                      .center, //this to look better in english version 5 inches screen
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
