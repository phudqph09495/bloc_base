import 'package:flutter/material.dart';

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
      child: const Icon(
        Icons.notifications_none_outlined,
        color: ColorApp.dark252525,
        size: 25,
      ),
      // Stack(
      //   children: [
      //     const Icon(
      //       Icons.notifications_none_outlined,
      //       color: ColorApp.dark252525,
      //       size: 25,
      //     ),
      //     Positioned(
      //         left: 8,
      //         top: 5,
      //         child: Container(
      //           height: MediaQuery.of(context).size.width * 0.03,
      //           width: Const.size(context).width * 0.03,
      //           decoration: const BoxDecoration(
      //               shape: BoxShape.circle, color: ColorApp.orangeFFC94D),
      //         ))
      //   ],
      // ),
    );
  }
}
