import 'package:Commerce/src/constant/color/color.dart';
import 'package:Commerce/src/features/profile/setting/bloc/setting_bloc.dart';
import 'package:Commerce/src/features/profile/setting/bloc/setting_state.dart';
import 'package:Commerce/src/features/welcome/view/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../widget/setting_widget.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        return Scaffold(
            appBar: buildAppBarSetting(),
            body: SingleChildScrollView(
                child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Confirm logout"),
                            content: const Text("Confirm logout"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => const Welcome()),
                                    (route) =>
                                        false, // This function removes all routes from the stack.
                                  );
                                },
                                child: const Text("Confirm"),
                              ),
                              TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text("Cancel"))
                            ],
                          );
                        });
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
                ),
              ],
            )));
      },
    );
  }
}
