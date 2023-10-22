import 'package:Commerce/src/constant/color/color.dart';
import 'package:Commerce/src/features/home/bloc/index_slider/bloc/index_slider_bloc.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBar buildAppBarHome() {
  return AppBar(
    leading: const SizedBox(
      width: 15,
      height: 12,
      child: Icon(Icons.menu),
    ),
    title: Container(
      color: kAppBarColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/hi.jpg"))),
            ),
          )
        ],
      ),
    ),
  );
}

Widget homePageText(String text, Color? color, double? top) {
  return Container(
      margin: EdgeInsets.only(top: top!),
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.bold),
      ));
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 260,
        height: 40,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: kGreyColor),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              width: 16,
              height: 16,
              child: const Icon(Icons.search),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              width: 220,
              height: 40,
              child: const TextField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "Search",
                  contentPadding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                  disabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                ),
                autocorrect: false,
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: kBlueColor,
              border: Border.all(color: kBlackColor),
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: const Icon(Icons.keyboard_option_key),
        ),
      )
    ],
  );
}

Widget sliderView(BuildContext context, IndexSliderState state) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(top: 20),
        width: 325,
        height: 160,
        child: PageView(
          onPageChanged: (index) {
            context.read<IndexSliderBloc>().add(IndexSliderEvent(index: index));
          },
          children: [
            _sliderContainer("assets/images/blood-pressure-chart1.jpg"),
            _sliderContainer("assets/images/blood-pressure-measurement.webp"),
            _sliderContainer("assets/images/Blood-Pressure-Numbers_Newsroom.jpg"),
            _sliderContainer("assets/images/blood-pressure-chart1.jpg"),
          ],
        ),
      ),
      DotsIndicator(
        dotsCount: 4,
        position: state.index,
        decorator: DotsDecorator(
            color: kGreyColor,
            activeColor: kGreenColor,
            size: const Size.square(5),
            activeSize: const Size(17, 5),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      )
    ],
  );
}

Widget _sliderContainer(String path) {
  return Container(
    width: 325,
    height: 160,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          (Radius.circular(20)),
        ),
        image: DecorationImage(image: AssetImage(path))),
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325,
        margin: const EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            reusableSubtitleText("Choose your course", kBlackColor, 16),
            GestureDetector(child: reusableSubtitleText("See all", kGreyColor, 16)),
          ],
        ),
      ),
      Container(
        child: Row(
          children: [
            reusableMenuText("All", kGreyColor, kBlueColor, kGreyColor, 14),
            const SizedBox(
              width: 10,
            ),
            reusableMenuText("Popular", kGreyColor, kWhiteGrey, kGreyColor, 14),
            const SizedBox(
              width: 10,
            ),
            reusableMenuText("New", kGreyColor, kWhiteGrey, kGreyColor, 14),
          ],
        ),
      )
    ],
  );
}

Widget reusableSubtitleText(String text, Color color, double size) {
  return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold),
      ));
}

Widget reusableMenuText(String text, Color textColor, Color boxColor, Color border, double size) {
  return Container(
    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
    decoration: BoxDecoration(
        color: boxColor, borderRadius: BorderRadius.circular(7), border: Border.all(color: border)),
    child: Container(
        margin: const EdgeInsets.only(top: 5),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: size, fontWeight: FontWeight.bold),
        )),
  );
}

Widget courseGrid() {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        image: const DecorationImage(
            fit: BoxFit.fill, image: AssetImage("assets/images/banner1.jpg"))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Best Course It",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          style: TextStyle(color: kBlackColor, fontWeight: FontWeight.bold, fontSize: 12),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Best Course It",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          style: TextStyle(color: kBlackColor, fontWeight: FontWeight.bold, fontSize: 12),
        )
      ],
    ),
  );
}
