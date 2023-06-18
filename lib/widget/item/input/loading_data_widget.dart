import 'package:flutter/material.dart';
import '../../../styles/colors.dart';
import '../appbar.dart';

class LoadingDataWidget extends StatelessWidget {
  const LoadingDataWidget({
    super.key,
    required this.titleAppbar,
  });
  final String titleAppbar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.darkGreen,
      appBar: AppBarWidget(isBack: true, title: titleAppbar),
      body: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            color: ColorApp.whiteF0),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
