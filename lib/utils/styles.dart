import 'package:flutter/material.dart';
import 'package:shadid/utils/constant.dart';

var titleTextStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
var normalTextStyle =
    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
var disabledTabBarTextStyle =
    TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: colorDivider);
var satusCompletedText = TextStyle(
    fontSize: 14, fontWeight: FontWeight.w500, color: colorStatusCompleted);
var satusCanceledText = TextStyle(
    fontSize: 14, fontWeight: FontWeight.w500, color: colorStautsCanceled);

var orderIdText = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w500, color: colorDarkPurple);
var orderDescText = TextStyle(
    fontSize: 14, fontWeight: FontWeight.w400, color: colorDarkPurple);
var orderDateText = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w400, color: colorDarkPurple);

var paddingLine = const EdgeInsets.only(top: 5.0, bottom: 4.0);
var paddingTitle = const EdgeInsets.only(top: 8.0, bottom: 6.0);
var paddingFooter = const EdgeInsets.only(top: 4.0, bottom: 1.0);
var paddingText = const EdgeInsets.symmetric(horizontal: 8.0);
var paddingDivider = const EdgeInsets.symmetric(vertical: 10.0);
