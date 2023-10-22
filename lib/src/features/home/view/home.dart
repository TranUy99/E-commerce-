import 'dart:developer';

import 'package:Commerce/src/constant/color/color.dart';
import 'package:Commerce/src/features/home/bloc/index_slider/bloc/index_slider_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../main.dart';
import '../../../constant/utils/getUser.dart';
import '../widget/home_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: buildAppBarHome(),
      body: BlocBuilder<IndexSliderBloc, IndexSliderState>(
        builder: (context, state) {
         
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: homePageText("Hello", kGreyColor, 20),
                ),
                 SliverToBoxAdapter(
                  child: Text("${getUser.idUser}"),
                ),
                SliverToBoxAdapter(
                  child: homePageText("Uy", kBlackColor, 5),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 10),
                ),
                SliverToBoxAdapter(
                  child: sliderView(context, state),
                ),
                SliverToBoxAdapter(
                  child: menuView(),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 0),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        crossAxisCount: 2,
                        childAspectRatio: 1.5),
                    delegate: SliverChildBuilderDelegate(childCount: 4, (context, index) {
                      return GestureDetector(onTap: () {}, child: courseGrid());
                    }),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
