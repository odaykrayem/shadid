// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

Widget CustomButton({
  required void Function()? onPressed,
  required String title,
  required BuildContext context,
  double height = 55.0,
  Color color = const Color(0xff00D27F),
}) {
  return SizedBox(
    height: height,
    width: MediaQuery.of(context).size.width,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20.0,
        ),
      ),
    ),
  );
}
