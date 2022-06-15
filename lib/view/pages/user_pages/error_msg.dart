import 'package:flutter/material.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/utils/styles.dart';

class ErrorMsg extends StatefulWidget {
  const ErrorMsg({Key? key}) : super(key: key);

  @override
  State<ErrorMsg> createState() => _ErrorMsgState();
}

class _ErrorMsgState extends State<ErrorMsg> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: SizedBox(
                  width: 96,
                  height: 96,
                  child: CircleAvatar(
                    backgroundColor: lightGreen,
                    maxRadius: 30.0,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Icon(
                        Icons.warning_amber_rounded,
                        color: primaryColor,
                        size: 70,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Text(
                  '${AppLocalization.of(context)?.getTranslatedValue('paymentFailed')}',
                  style: blackText18,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Text(
                  '${AppLocalization.of(context)?.getTranslatedValue('paymentFailedMsg')}',
                  style: blackText16_500,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30.0, bottom: 30.0),
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    child: Text(
                      '${AppLocalization.of(context)?.getTranslatedValue('tryAgain')}',
                      style: whiteText18,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SizedBox(
                  height: 30,
                  child: Text(
                    '${AppLocalization.of(context)?.getTranslatedValue('cancel')}',
                    style: greenText16,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
