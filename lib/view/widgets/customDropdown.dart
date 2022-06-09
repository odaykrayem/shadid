// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison

import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';

Widget CustomDropdownButton({
  String? hint,
  required List<DropdownMenuItem<dynamic>> items,
  Object? value,
  required void Function(dynamic) onChanged,
  dynamic Function(bool)? onBoxStateChanged,
  required BuildContext context,
}) {
  return Container(
    height: 50.0,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: DropdownBelow<dynamic>(
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      boxPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemWidth: MediaQuery.of(context).size.width / 2,
      boxHeight: 50.0,
      itemTextstyle: const TextStyle(
        color: Colors.black,
        fontFamily: 'Tajawal',
      ),
      boxTextstyle: const TextStyle(
        color: Colors.black,
        fontFamily: 'Tajawal',
      ),
      onBoxStateChanged: onBoxStateChanged,
      value: value,
      onChanged: onChanged,
      items: items,
      hint: Text(
        hint!,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey[600],
          fontFamily: 'Tajawal',
        ),
      ),
    ),
  );
}
