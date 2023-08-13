import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/const.dart';
import '../../router/router.dart';
import '../../styles/colors.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouterName.notifyScreen);
      },
      // child: Image.asset('assets/images/notifiaction.png', width: Const.sizeWidth(context, 25),fit: BoxFit.fitHeight,),
      child: Stack(
        children: [
          SvgPicture.asset('assets/svg/Frame 20.svg',
              width: Const.sizeWidth(context, 30),height: Const.sizeHeight(context, 30), color: Colors.black),
          Positioned(
              left: 0,
              top: 0,
              child: Container(
                height: Const.sizeWidth(context, 15),
                width: Const.sizeWidth(context, 15),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: ColorApp.orangeFFC94D),
              ))
        ],
      ),
    );
  }
}
