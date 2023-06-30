import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/styles.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    this.type = ButtonType.primary,
    required this.onTap,
  });

  final String text;
  final ButtonType type;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: type == ButtonType.primary
                ? ColorApp.bottomBarABCA74
                : type == ButtonType.secondary
                    ? ColorApp.orangeFFC94D
                    : ColorApp.dark500,
            borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Center(
            child: Text(
              text,
              style: StyleApp.styleGilroy700(
                  color: type == ButtonType.primary
                      ? ColorApp.whiteF0
                      : type == ButtonType.secondary
                          ? ColorApp.dark252525
                          : ColorApp.background),
            ),
          ),
        ),
      ),
    );
  }
}

enum ButtonType { secondary, primary, grey }
