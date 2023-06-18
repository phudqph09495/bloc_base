import 'package:bloc_base/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/const.dart';
import '../../../../styles/styles.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    this.isPrefixIcon = true,
    required this.text,
    required this.imageUrl,
    this.onTap,
  });

  final String text;
  final String imageUrl;
  final bool isPrefixIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: ColorApp.background,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.only(
              top: Const.size(context).width * 0.04615384615,
              bottom: Const.size(context).width * 0.04615384615,
              right: Const.size(context).width * 0.07948717948,
              left: Const.size(context).width * 0.04615384615),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: isPrefixIcon
                ? [
                    SvgPicture.asset(imageUrl),
                    Expanded(
                      child: Center(
                        child: Text(
                          text,
                          style: StyleApp.textStyle700(),
                        ),
                      ),
                    )
                  ]
                : [
                    Expanded(
                      child: Center(
                        child: Text(
                          text,
                          style: StyleApp.textStyle700(),
                        ),
                      ),
                    ),
                    SvgPicture.asset(imageUrl)
                  ],
          ),
        ),
      ),
    );
  }
}
