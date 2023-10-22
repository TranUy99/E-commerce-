import 'package:Commerce/src/constant/color/color.dart';
import 'package:Commerce/src/features/application/widget/application_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/bloc/index_slider/bloc/index_slider_bloc.dart';
import '../../profile/setting/bloc/setting_bloc.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => IndexSliderBloc(),
        ),
        
      ],
      child: Container(
        color: kBlueBlandColor,
        child: SafeArea(
            child: Scaffold(
          body: buildPage(_index),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            onTap: (value) {
              setState(() {
                _index = value;
              });
            },
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: kBlueColor,
            unselectedItemColor: kGreyColor,
            items: const [
              BottomNavigationBarItem(
                  label: "home",
                  icon: Icon(Icons.home),
                  activeIcon: Icon(
                    Icons.home,
                    color: kBlueColor,
                  )),
              BottomNavigationBarItem(
                  label: "search",
                  icon: Icon(Icons.search),
                  activeIcon: Icon(
                    Icons.search,
                    color: kBlueColor,
                  )),
              BottomNavigationBarItem(
                  label: "play",
                  icon: Icon(Icons.play_circle),
                  activeIcon: Icon(
                    Icons.play_circle,
                    color: kBlueColor,
                  )),
              BottomNavigationBarItem(
                  label: "chat",
                  icon: Icon(Icons.chat),
                  activeIcon: Icon(
                    Icons.chat,
                    color: kBlueColor,
                  )),
              BottomNavigationBarItem(
                  label: "Profile",
                  icon: Icon(Icons.person),
                  activeIcon: Icon(
                    Icons.person,
                    color: kBlueColor,
                  )),
            ],
          ),
        )),
      ),
    );
  }
}
