import 'package:flutter/material.dart';

import '../../../constant/color/color.dart';
import '../setting/view/setting.dart';

AppBar buildAppBarProfile() {
  return AppBar(
    leading: const SizedBox(
      width: 15,
      height: 12,
      child: Icon(Icons.menu),
    ),
    title: Container(
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Profile",
            style: TextStyle(color: kBlackColor, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 15,
            height: 12,
            child: Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
    ),
  );
}

Widget avatarProfile() {
  return Container(
    alignment: Alignment.bottomRight,
    width: 80,
    height: 80,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
            fit: BoxFit.fill, image: AssetImage("assets/images/banner3.webp"))),
    child: const Icon(
      Icons.edit,
      color: kBlueColor,
    ),
  );
}

Widget buildListView(String text, IconData iconData, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Setting()));
          },
          child: Row(children: [
            Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kBlueBlandColor,
              ),
              child: Icon(iconData), // Sử dụng Icon(iconData) thay vì Icon(icon)
            ),
            const SizedBox(
              width: 10,
            ),
            Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ]),
        )
      ],
    ),
  );
}
