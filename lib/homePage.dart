import 'package:bloc_base/bloc/language/bloc_lang.dart';
import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/screen/auth/account_screen/account_screen.dart';
import 'package:bloc_base/screen/home/home_screen/home_screen.dart';
import 'package:bloc_base/screen/search/search_tab_screen/view/search_tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:url_launcher/url_launcher.dart';

import '../styles/init_style.dart';
import 'screen/cart/cart_screen/cart_screen.dart';

class MyHomePage extends StatefulWidget {
  int index;
  MyHomePage({this.index = 0});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  _launchURL(url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Đã có lỗi , vui lòng quay lại sau';
    }
  }

  @override
  void initState() {
    super.initState();
    // context.read<BlocCheckLogin>().add(GetData());
    context.read<BlocLanguage>().add(GetLanguage());
    // context.read<BlocFireBaseMS>().add(firebase());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: IndexedStack(
        index: widget.index,
        children: const [
          HomeScreen(),
          // Scene(),
          SizedBox(),
          SearchTabScreen(),
          GioHangScreen(),
          // LoveScreen(),
          AccountScreen(),
          // AccountScreen()
        ],
      ),
      // body: BlocBuilder<BlocCheckLogin, StateBloc>(
      //   builder: (context, StateBloc state) {
      //     final check = state is LoadSuccess ? state.data as bool : false;
      //     return IndexedStack(
      //       index: widget.index,
      //       children: [
      //         HomeScreen(),
      //         // Scene(),
      //         Container(),
      //         SearchTabScreen(),
      //         GioHangScreen(),
      //         // LoveScreen(),
      //         AccountScreen(),
      //         // AccountScreen()
      //       ],
      //     );
      //   },
      // ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            // BoxShadow(
            //   color: ColorApp.bottomBarABCA74,
            //   blurRadius: 50.0,
            //   spreadRadius: 1, //New
            // )
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 5, top: 5),
          child: Container(
            decoration: BoxDecoration(
                color: ColorApp.bottomBarABCA74,
                boxShadow: const [
                  BoxShadow(
                    color: ColorApp.bottomBarABCA74,
                    blurRadius: 70.0,
                    spreadRadius: 2, //New
                  )
                ],
                borderRadius: BorderRadius.circular(25)),
            child: Padding(
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
          ),
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
        print(index.toString());
        // setState(() {
        widget.index = index;
        // widget.index = 0;
        onTap.call();
        // });
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:
                widget.index == index ? ColorApp.darkGreen : Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
            child: SvgPicture.asset(linkImage),
          )),
    );
  }
}
