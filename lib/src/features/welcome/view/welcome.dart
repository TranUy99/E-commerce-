import 'package:commmerce/src/features/welcome/bloc/welcome_bloc.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant/color/color.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: kWhiteColor,
        child: Scaffold(body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: const EdgeInsets.only(top: 40),
              child: Stack(
                children: [
                  PageView(
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                      
                    },
                    children: [
                      _page(1, context, "Next", "Chào mừng bạn đến với chúng tôi", "image"),
                      _page(2, context, "Next", "Kết nối với mọi người", "image")
                    ],
                  ),
                  Positioned(
                      bottom: 120,
                      right: MediaQuery.of(context).size.width * 0.4,
                      child: DotsIndicator(
                        position: state.page,
                        dotsCount: 2,
                        mainAxisAlignment: MainAxisAlignment.center,
                        decorator: DotsDecorator(
                            activeColor: kBlueColor,
                            color: kGreyColor,
                            size: const Size.square(8),
                            activeSize: Size(10, 8),
                            activeShape:
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                      ))
                ],
              ),
            );
          },
        )));
  }

  Widget _page(int index, BuildContext context, String buttonName, String title, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.width * 0.6,
          child: const Text(
            "WElCOME",
            style: TextStyle(color: kRedColor, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: SizedBox(
            width: 345,
            child: Text(title),
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(top: 100, right: 25, left: 25),
          decoration: const BoxDecoration(
              color: kBlueColor,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(color: kGreyColor, spreadRadius: 1, blurRadius: 2, offset: Offset(0, 1))
              ]),
          child: Center(child: Text(buttonName)),
        )
      ],
    );
  }
}
