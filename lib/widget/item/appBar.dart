import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../styles/colors.dart';
import '../../styles/styles.dart';

// class AppBarWidget extends StatelessWidget {
//   const AppBarWidget({
//     super.key,
//     this.title,
//     this.isBack = true,
//     this.onTap,
//   });

//   final String? title;
//   final bool isBack;
//   final VoidCallback? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 0,
//       child: Stack(
//         children: [
//           Container(
//             color: ColorApp.darkGreen,
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height * 0.25,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.06,
//                 ),
//                 title == null
//                     ? const SizedBox()
//                     : Text(
//                         title!,
//                         style: StyleApp.textStyle700(
//                             color: Colors.white, fontSize: 20),
//                       ),
//               ],
//             ),
//           ),
//           isBack
//               ? Positioned(
//                   top: MediaQuery.of(context).size.height * 0.05,
//                   left: 10,
//                   child: AppBarBackButton(
//                     onTap: onTap ?? () => Navigator.pop(context),
//                   ))
//               : const SizedBox(),
//         ],
//       ),
//     );
//   }
// }
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.title,
    this.isBack = true,
    this.onTap,
  });

  final String? title;
  final bool isBack;
  final VoidCallback? onTap;
  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: 80,
      centerTitle: true,
      leading: isBack
          ? AppBarBackButton(
              onTap: onTap ?? () => Navigator.pop(context),
            )
          : null,
      title: Text(
        title ?? '',
        style: StyleApp.textStyle700(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      elevation: 0,
      backgroundColor: ColorApp.darkGreen,
    );
  }
}

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 8),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(18)),
        child: const Icon(
          Icons.west,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
