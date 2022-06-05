import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shadid/model/cacheHelper.dart';
import 'package:shadid/view/auth/auth_captain/captain_register.dart';
import 'package:shadid/view/auth/register.dart';
import 'package:shadid/view/pages/captain_pages/captain_home.dart';
import 'package:shadid/view/pages/gps.dart';
import 'package:shadid/view/pages/select_lang.dart';
import 'package:shadid/view/pages/user_pages/user_home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  FirebaseAuth? _auth;

  User? _user;
  late Widget _widget;

  Future<void> widgetMoving() async {
    if (_user == null) {
      if (CacheHelper.getData(key: 'languageCode') == null) {
        _widget = SelectLang();
      } else {
        _widget = Register();
      }
    } else {
      if (await Permission.locationWhenInUse.isGranted) {
        if (CacheHelper.getData(key: 'type') == "${UserType.user}") {
          _widget = UserHome();
        }
        if (CacheHelper.getData(key: 'type') == "${UserType.captain}") {
          if (await CacheHelper.getData(key: 'isCaptainRegistered') == true) {
            _widget = CaptainHome();
          } else {
            _widget = CaptainRegister();
          }
        }
      } else {
        _widget = GPS();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth?.currentUser;
    widgetMoving().then((value) {
      Future.delayed(
        const Duration(seconds: 3),
        () async {
          await Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) {
            return _widget;
          }), (route) => false);
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/img/logo.png'),
      ),
    );
  }
}
