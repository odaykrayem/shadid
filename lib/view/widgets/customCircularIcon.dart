import 'package:flutter/material.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/utils/styles.dart';

Widget customErrorIcon(IconData icon) {
  return Stack(
    children: [
      Align(
        alignment: Alignment.center,
        child: Container(
          height: 95,
          width: 95,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: lightGreen,
          ),
        ),
      ),
      Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Icon(icon, size: 75, color: primaryColor),
          )),
    ],
  );
}
