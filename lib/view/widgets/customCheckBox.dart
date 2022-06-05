// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shadid/utils/constant.dart';

Widget CustomCheckBoxListTile({
  required void Function(bool?)? onChanged,
  required bool? value,
  required String title,
  Key? key,
}) {
  return Row(
    children: [
      Checkbox(
        key: key,
        activeColor: Colors.white,
        hoverColor: primaryColor,
        focusColor: primaryColor,
        overlayColor: MaterialStateProperty.all(primaryColor.withOpacity(0.2)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
        side: const BorderSide(
          color: Colors.black,
        ),
        fillColor: MaterialStateProperty.all(primaryColor),
        value: value,
        onChanged: onChanged,
        checkColor: Colors.white,
      ),
      Text(title),
    ],
  );
}
