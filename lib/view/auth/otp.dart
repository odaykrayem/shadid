// ignore_for_file: unused_field, use_build_context_synchronously, deprecated_member_use, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_print

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/model/cacheHelper.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/view/auth/auth_captain/captain_register.dart';
import 'package:shadid/view/auth/register.dart';
import 'package:shadid/view/pages/captain_pages/captain_home.dart';
import 'package:shadid/view/pages/gps.dart';
import 'package:shadid/view/pages/user_pages/user_home.dart';
import 'package:shadid/view/widgets/customButton.dart';
import 'package:shadid/view/widgets/showToast.dart';

class OTP extends StatefulWidget {
  final String number;

  OTP({required this.number});

  @override
  _OTPState createState() {
    return _OTPState();
  }
}

class _OTPState extends State<OTP> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String? verificationID;
  final otpController = TextEditingController();
  bool isLoading = false;
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();

  var formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    verifyPhone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const SizedBox(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
            icon: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset('assets/img/verification_icon.svg'),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              '${AppLocalization.of(context)?.getTranslatedValue('verifyCode')}',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              '${AppLocalization.of(context)?.getTranslatedValue('enterVerifyCode')}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[500],
              ),
            ),
            Text(
              widget.number,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[500],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Form(
                key: formKey,
                child: PinCodeTextField(
                  appContext: context,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  cursorColor: Colors.amber,
                  textStyle: const TextStyle(
                    color: Colors.amber,
                  ),
                  pinTheme: PinTheme(
                    activeColor: Colors.grey[300],
                    inactiveColor: Colors.grey[300],
                    inactiveFillColor: Colors.grey[50],
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.grey[50],
                    selectedFillColor: Colors.grey[50],
                    selectedColor: Colors.amber,
                    errorBorderColor: Colors.red,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  errorAnimationController: errorController,
                  controller: otpController,
                  onChanged: (value) {},
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${AppLocalization.of(context)?.getTranslatedValue('codeNotArrived')}',
                ),
                const SizedBox(width: 5.0),
                TextButton(
                  onPressed: () async {
                    verifyPhone();
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      Colors.amber[700],
                    ),
                    overlayColor: MaterialStateProperty.all(
                        Colors.amber[100]?.withOpacity(0.5)),
                  ),
                  child: Text(
                    '${AppLocalization.of(context)?.getTranslatedValue('resend')}',
                  ),
                ),
              ],
            ),
            const Spacer(),
            isLoading == true
                ? Container(
                    alignment: Alignment.center,
                    height: 55.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: primaryColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30.0,
                          width: 30.0,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        Text(
                          '${AppLocalization.of(context)?.getTranslatedValue('verified')}',
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                : CustomButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await FirebaseAuth.instance
                            .signInWithCredential(
                          PhoneAuthProvider.credential(
                            verificationId: "$verificationID",
                            smsCode: otpController.text,
                          ),
                        )
                            .then((value) async {
                          if (value.user != null) {
                            if (await Permission.locationWhenInUse.isGranted) {
                              if (CacheHelper.getData(key: 'type') ==
                                  "${UserType.user}") {
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (context) {
                                  return UserHome();
                                }), (route) => false);
                              }
                              if (CacheHelper.getData(key: 'type') ==
                                  "${UserType.captain}") {
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (context) {
                                  return CaptainRegister();
                                }), (route) => false);
                              }
                            } else {
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) {
                                return GPS();
                              }), (route) => false);
                            }
                          }
                        });
                      } catch (e) {
                        setState(() {
                          isLoading = false;
                        });
                        print(e.toString());
                        if (e
                            .toString()
                            .contains('firebase_auth/session-expired')) {
                          showToast(
                            text:
                                '${AppLocalization.of(context)?.getTranslatedValue('sessionExpired')}',
                          );
                        }
                        if (e.toString().contains(
                            'firebase_auth/invalid-verification-code')) {
                          showToast(
                            text:
                                '${AppLocalization.of(context)?.getTranslatedValue('invalidCode')}',
                          );
                        }
                        if (e.toString().contains(
                            'firebase_auth/invalid-verification-id')) {
                          showToast(
                            text:
                                '${AppLocalization.of(context)?.getTranslatedValue('invalidId')}',
                          );
                        }
                      }
                    },
                    title:
                        '${AppLocalization.of(context)?.getTranslatedValue('verify')}',
                    context: context,
                  ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> verifyPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: widget.number,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) async {
          if (value.user != null) {
            if (await Permission.locationWhenInUse.isGranted) {
              if (CacheHelper.getData(key: 'type') == "${UserType.user}") {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return UserHome();
                }), (route) => false);
              }
              if (CacheHelper.getData(key: 'type') == "${UserType.captain}") {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return CaptainHome();
                }), (route) => false);
              }
            } else {
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) {
                return GPS();
              }), (route) => false);
            }
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        showToast(
          text:
              '${AppLocalization.of(context)?.getTranslatedValue('invalidId')}',
        );
      },
      codeSent: (String? verificationId, int? resendToken) {
        setState(() {
          verificationID = verificationId;
        });
      },
      timeout: const Duration(seconds: 120),
      codeAutoRetrievalTimeout: (String? verificationId) {
        showToast(
          text:
              '${AppLocalization.of(context)?.getTranslatedValue('sessionExpired')}',
        );
        setState(() {
          verificationID = verificationId;
        });
      },
    );
  }
}
