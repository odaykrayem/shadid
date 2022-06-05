// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:shadid/utils/constant.dart';

Widget CustomTextFormField({
  String? hintText,
  TextInputType? keyboardType,
  TextInputAction? textInputAction,
  TextEditingController? controller,
  void Function(String)? onChanged,
}) {
  return SizedBox(
    height: 50.0,
    child: TextFormField(
      cursorColor: primaryColor,
      cursorWidth: 1.0,
      style: const TextStyle(
        fontSize: 15.0,
      ),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[100],
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: primaryColor,
            )),
      ),
    ),
  );
}
