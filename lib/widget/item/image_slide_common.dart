import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../config/const.dart';
import '../../styles/colors.dart';

class ImageSliderStyle extends StatefulWidget {
  const ImageSliderStyle({super.key});

  @override
  State<ImageSliderStyle> createState() => _ImageSliderStyleState();
}

class _ImageSliderStyleState extends State<ImageSliderStyle> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageSlideshow(
          height: MediaQuery.of(context).size.height * 0.25,
          width: double.infinity,
          indicatorColor: ColorApp.dark252525,
          isLoop: true,
          // autoPlayInterval: 2000,
          children: List.generate(
              3,
                  (index) => Image.asset(
                'assets/images/exSpa.png',
                fit: BoxFit.cover,
              )),
        ),
        Positioned(
          top: Const.sizeHeight(context, 45),
          // Const.size(context).width * 0.08064516129,
          left: 10,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20)),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 15, vertical: 8),
                child: FaIcon(
                  FontAwesomeIcons.arrowLeftLong,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: Const.sizeHeight(context, 45),
          right: 10,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.3),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8, vertical: 8),
                  child: Icon(
                    Icons.favorite,
                    color: ColorApp.background,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.3),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8, vertical: 8),
                  child: Icon(
                    Icons.share_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
