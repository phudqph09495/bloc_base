import 'package:bloc_base/bloc/language/bloc_lang.dart';
import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/screen/auth/account_screen/account_screen.dart';
import 'package:bloc_base/screen/home/home_screen/home_screen.dart';
import 'package:bloc_base/screen/search/search_tab_screen/view/search_tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../styles/init_style.dart';
import 'screen/cart/cart_screen/cart_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key?key , this.selectedIndex = 0 }):super(key:key);
  int selectedIndex ;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    context.read<BlocLanguage>().add(GetLanguage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: IndexedStack(
        index: widget.selectedIndex,
        children: const [
          HomeScreen(),
          SizedBox(),
          SearchTabScreen(),
          GioHangScreen(),
          AccountScreen(),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
      margin:
      const EdgeInsets.only(left: 16, right: 16, bottom: 5, top: 5),
        decoration: BoxDecoration(
            color: ColorApp.bottomBarABCA74,
            boxShadow: const [
              BoxShadow(
                color: ColorApp.bottomBarABCA74,
                blurRadius: 5,
                spreadRadius: 1, //New
              )
            ],
            borderRadius: BorderRadius.circular(25)),
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 8 / 844,
            horizontal: MediaQuery.of(context).size.width * 20 / 390),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomBarButton(
              widget: widget,
              index: 0,
              linkImage: 'assets/svg/IconHome.svg',
              onTap: () => setState(() {}),
            ),
            BottomBarButton(
              widget: widget,
              index: 1,
              linkImage: 'assets/svg/IconMap.svg',
              onTap: () => setState(() {}),
            ),
            BottomBarButton(
              widget: widget,
              index: 2,
              linkImage: 'assets/svg/IconSe.svg',
              onTap: () => setState(() {}),
            ),
            BottomBarButton(
              widget: widget,
              index: 3,
              linkImage: 'assets/svg/IconCart.svg',
              onTap: () => setState(() {}),
            ),
            BottomBarButton(
              widget: widget,
              index: 4,
              linkImage: 'assets/svg/IconAcc.svg',
              onTap: () => setState(() {}),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBarButton extends StatelessWidget {
  const BottomBarButton({
    super.key,
    required this.widget,
    required this.index,
    required this.linkImage,
    required this.onTap,
  });

  final MyHomePage widget;
  final int index;
  final String linkImage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.selectedIndex = index;
        onTap.call();
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:
            widget.selectedIndex == index ? ColorApp.darkGreen : Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
            child: SvgPicture.asset(linkImage),
          )),
    );
  }
}