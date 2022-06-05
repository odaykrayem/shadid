import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shadid/view/pages/splash.dart';

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

  FirebaseAuth? _auth;

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    debugPrint(_auth?.currentUser?.phoneNumber);
     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _signOut().then((value) {
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) {
                return const Splash();
              }), (route) => false);
            });
          },
          child: const Text('SignOut'),
        ),
      ),
    );
  }
}
