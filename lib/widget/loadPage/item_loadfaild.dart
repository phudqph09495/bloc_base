import 'package:flutter/material.dart';

import '../../styles/init_style.dart';

class ItemLoadFaild extends StatelessWidget {
  final String error;
  final String titleButton;
  final double width;
  final Function()? onTap;

  const ItemLoadFaild(
      {super.key,
      required this.error,
      this.onTap,
      this.titleButton = "Tải lại",
      this.width = 100});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            error,
            style: StyleApp.textStyle400(),
          ),
          const SizedBox(
            height: 10,
          ),
          OutlinedButton(
            onPressed: onTap,
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(color: ColorApp.main, width: 1))),
            child: Text(
              titleButton,
              style: StyleApp.textStyle400(),
            ),
          ),
        ],
      ),
    );
  }
}
