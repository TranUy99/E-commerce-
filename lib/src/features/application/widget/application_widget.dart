import 'package:flutter/cupertino.dart';

import '../../home/view/home.dart';
import '../../profile/view/profile.dart';

Widget buildPage(int index) {
  List<Widget> widget = [
    const Home(),
    const Center(
      child: Text("Search"),
    ),
    const Center(
      child: Text("Course"),
    ),
    const Center(
      child: Text("Chat"),
    ),
    const Profile()
  ];

  return widget[index];
}
