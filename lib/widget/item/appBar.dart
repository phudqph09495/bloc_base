import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../styles/init_style.dart';


class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  BuildContext context;
  GlobalKey<ScaffoldState> scaffoldKey;
  Widget tittle;

  Function()? leadingTap;
  AppBarCustom({required this.context, required this.scaffoldKey,required this.tittle,this.leadingTap});

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      Size(double.maxFinite, MediaQuery.of(context).size.height * 0.07);
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.45),
        child: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          flexibleSpace: Stack(alignment: Alignment.bottomCenter,children: [
            SvgPicture.asset('assets/svg/bgApp.svg'),
            Positioned(
              bottom: -3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(onTap:widget.leadingTap,
                    child: Container(
                      decoration: BoxDecoration( shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.list,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: widget.tittle),
                  Row(
                    children: [

                      InkWell(
                        onTap: (){

                        },
                        child: Container(

                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.notifications_none_outlined,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                              Positioned(bottom: -3,right: 0,child: Container(
                                decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.orange),

                              ))
                            ],
                          ),
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          ],),
        ));
  }
}
