import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/init_style.dart';

class LoadImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Alignment alignment;
  final bool ans;
  final bool bangtin;
  final Function()? ontap;

  const LoadImage({
    super.key,
    this.ans = true,
    required this.url,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.bangtin = false,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Image.network(
        url,
        fit: fit,
        width: width,
        height: height,
        alignment: alignment,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return SizedBox(
            width: width,
            height: height,
            child: Center(
              child: Platform.isAndroid
                  ? const CircularProgressIndicator(
                      color: ColorApp.main,
                      strokeWidth: 2,
                    )
                  : const CupertinoActivityIndicator(),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: width,
            height: height,
            color: Colors.white,
            child: Center(
              child: Image.network(
                'https://www.chanchao.com.tw/images/default.jpg',
                width: width,
                height: height,
                fit: fit,
              ),
            ),
          );
        },
      ),
    );
  }
}
