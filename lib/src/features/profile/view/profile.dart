import 'package:Commerce/src/constant/color/color.dart';

import 'package:flutter/material.dart';


import '../../welcome/view/welcome.dart';
import '../widget/profile_widget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarProfile(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              avatarProfile(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  // buildListView("Profile", Icons.person,context),
                  // buildListView("Payment", Icons.payment,context,),
                  // buildListView("Achievement", Icons.architecture,context,),
                  // buildListView("Love", Icons.heart_broken,context,),
                  // buildListView("Reminder", Icons.remember_me,context,),
                   GestureDetector(
                  onTap: () {
                   Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Welcome()));
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kRedColor,
                    ),
                    child: const Icon(Icons.logout_outlined),
                  ),
                )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
