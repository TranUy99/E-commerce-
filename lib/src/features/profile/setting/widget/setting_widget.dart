import 'package:Commerce/src/constant/color/color.dart';
import 'package:flutter/material.dart';

AppBar buildAppBarSetting() {
  return AppBar(
    title: const Text(
      "Settings",
      style: TextStyle(color: kBlackColor, fontWeight: FontWeight.bold, fontSize: 16),
    ),
  );
}
