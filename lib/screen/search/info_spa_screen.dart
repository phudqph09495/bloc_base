import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../config/const.dart';
import '../../styles/init_style.dart';

class InfoSpaScreen extends StatefulWidget {
  const InfoSpaScreen({Key? key}) : super(key: key);

  @override
  State<InfoSpaScreen> createState() => _InfoSpaScreenState();
}

class _InfoSpaScreenState extends State<InfoSpaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ImageSlideshow(
                children: List.generate(3,
                        (index) => Image.asset('assets/images/exSpa.png',fit: BoxFit.cover,)),
                //
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                indicatorColor: ColorApp.dark,
                isLoop: true,
                autoPlayInterval: 2000,
              ),
              Positioned(
                top: Const.size(context).width*0.08064516129,
                left: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                    child: FaIcon(FontAwesomeIcons.arrowLeftLong,color: Colors.white,),
                  ),
                ),
              ),
              Positioned(
                top:Const.size(context).width*0.08064516129,
                right: 10,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.3),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                        child: FaIcon(FontAwesomeIcons.heart,color: Colors.white,),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.3),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                        child: Icon(Icons.share_outlined,color: Colors.white,),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}
