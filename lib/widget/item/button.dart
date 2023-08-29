import 'package:bloc_base/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../config/const.dart';
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
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
            color: type == ButtonType.primary
                ? ColorApp.bottomBarABCA74
                : type == ButtonType.secondary
                    ? ColorApp.yellow
                    : ColorApp.dark500,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.textDark18().copyWith(color: type == ButtonType.primary
                ? ColorApp.background
                : type == ButtonType.secondary
                ? ColorApp.dark252525
                : ColorApp.background)
          ),
        ),
      ),
    );
  }
}

enum ButtonType { secondary, primary, grey }
