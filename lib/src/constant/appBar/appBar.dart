import 'package:flutter/material.dart';

import '../color/color.dart';

PreferredSizeWidget? appBar(BuildContext context, String title) {
  return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: AppBar(
        title: Text(title),
        backgroundColor: kSecondaryColor,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [kWhiteColor, kLightGreyColor, kZambeziColor],
            ),
          ),
        ),
      ));
}
