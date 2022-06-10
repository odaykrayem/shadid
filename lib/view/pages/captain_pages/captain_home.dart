import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/utils/captain_icons_icons.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/utils/custom_icon_icons.dart';
import 'package:shadid/view/pages/captain_pages/captain_mainPage.dart';
import 'package:shadid/view/pages/user_pages/notifications.dart';

enum SearchOptions { open, close }

enum CaptainAccountStatus { active, inactive }

class CaptainHome extends StatefulWidget {
  @override
  _CaptainHomeState createState() {
    return _CaptainHomeState();
  }
}

class _CaptainHomeState extends State<CaptainHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  CaptainAccountStatus accountStatus = CaptainAccountStatus.active;
  SearchOptions option = SearchOptions.close;

  // FirebaseAuth? _auth;

  // Future<void> _signOut() async {
  //   await FirebaseAuth.instance.signOut();
  //   debugPrint(_auth?.currentUser?.phoneNumber);

  // }
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: CustomBottomNavBar(),
      ),
      body: Builder(
        builder: (context) {
          if (_currentIndex == 0) {
            return const CaptainMainPage();
          }
          return Container();
        },
      ),
    );
  }

  Widget CustomBottomNavBar() {
    return SizedBox(
      height: 75.0,
      child: CustomNavigationBar(
        iconSize: 20.0,
        selectedColor: primaryColor,
        strokeColor: primaryColor,
        unSelectedColor: Colors.grey,
        backgroundColor: Colors.grey[100]!,
        bubbleCurve: Curves.easeInQuad,
        items: [
          CustomNavigationBarItem(
            icon: const Icon(CaptainIcons.home),
            title: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "الرئيسية",
                style: TextStyle(
                  fontSize: 12.0,
                  color: _currentIndex == 0 ? primaryColor : Colors.grey[700],
                ),
              ),
            ),
          ),
          CustomNavigationBarItem(
            icon: const Icon(CaptainIcons.order),
            title: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "طلباتي",
                style: TextStyle(
                  fontSize: 12.0,
                  color: _currentIndex == 1 ? primaryColor : Colors.grey[700],
                ),
              ),
            ),
          ),
          CustomNavigationBarItem(
            icon: const Icon(CaptainIcons.massages),
            title: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "الرسائل",
                style: TextStyle(
                  fontSize: 12.0,
                  color: _currentIndex == 2 ? primaryColor : Colors.grey[700],
                ),
              ),
            ),
          ),
          CustomNavigationBarItem(
            icon: const Icon(CaptainIcons.profile),
            title: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "بروفايلي",
                style: TextStyle(
                  fontSize: 12.0,
                  color: _currentIndex == 3 ? primaryColor : Colors.grey[700],
                ),
              ),
            ),
          ),
        ],
        borderRadius: const Radius.circular(50.0),
        elevation: 0.0,
        isFloating: true,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
