import 'package:bloc_base/bloc/language/bloc_lang.dart';
import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/screen/Cart/gioHang_screen.dart';
import 'package:bloc_base/screen/auth/account_screen.dart';
import 'package:bloc_base/screen/ex.dart';
import 'package:bloc_base/screen/home/home_screen.dart';
import 'package:bloc_base/screen/search/search_tab_screen.dart';
import 'package:bloc_base/widget/drawler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:url_launcher/url_launcher.dart';

import '../bloc/auth/bloc_checkLogin.dart';

import '../bloc/event_bloc.dart';
import '../bloc/state_bloc.dart';
import '../styles/init_style.dart';

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
    context.read<BlocLang>().add(GetLang());
    // context.read<BlocFireBaseMS>().add(firebase());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: IndexedStack(
        index: widget.index,
        children: [
          const HomeScreen(),
          // Scene(),
          Container(),
          const SearchTabScreen(),
          const GioHangScreen(),
          // LoveScreen(),
          const AccountScreen(),
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
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.025,
          right: MediaQuery.of(context).size.width * 0.025,
        ),
        child: Container(
          decoration: BoxDecoration(
              color: ColorApp.bottomBar,
              borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 8 / 844,
                horizontal: MediaQuery.of(context).size.width * 20 / 390),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      widget.index = 0;
                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.index == 0
                              ? ColorApp.darkGreen
                              : Colors.transparent),
                      child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.03),
                        child: SvgPicture.asset(
                          'assets/svg/IconHome.svg',
                        ),
                      )),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      widget.index = 1;
                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.index == 1
                              ? ColorApp.darkGreen
                              : Colors.transparent),
                      child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.03),
                        child: SvgPicture.asset(
                          'assets/svg/IconMap.svg',
                        ),
                      )),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      widget.index = 2;
                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.index == 2
                              ? ColorApp.darkGreen
                              : Colors.transparent),
                      child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.03),
                        child: SvgPicture.asset(
                          'assets/svg/IconSe.svg',
                        ),
                      )),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      widget.index = 3;
                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.index == 3
                              ? ColorApp.darkGreen
                              : Colors.transparent),
                      child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.03),
                        child: SvgPicture.asset(
                          'assets/svg/IconCart.svg',
                        ),
                      )),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      widget.index = 4;
                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.index == 4
                              ? ColorApp.darkGreen
                              : Colors.transparent),
                      child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.03),
                        child: SvgPicture.asset(
                          'assets/svg/IconAcc.svg',
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.only(
      //       left: MediaQuery.of(context).size.width * 0.025,
      //       right: MediaQuery.of(context).size.width * 0.025,
      //       bottom: MediaQuery.of(context).size.width * 0.021,
      //       top: MediaQuery.of(context).size.width * 0.013),
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.circular(25),
      //     child: BottomNavigationBar(
      //       items: [
      //         BottomNavigationBarItem(
      //           label: 'a',
      //             icon: Container(
      //                 decoration: BoxDecoration(
      //                     shape: BoxShape.circle, color:widget.index==0? ColorApp.darkGreen:Colors.transparent),
      //                 child: Padding(
      //                   padding:  EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      //                   child: SvgPicture.asset(
      //                     'assets/svg/IconHome.svg',
      //                   ),
      //                 ))),
      //         BottomNavigationBarItem(
      //             label: 'a',
      //             icon: Container(
      //                 decoration: BoxDecoration(
      //                     shape: BoxShape.circle,  color:widget.index==1? ColorApp.darkGreen:Colors.transparent),
      //                 child: Padding(
      //                   padding:  EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      //                   child: SvgPicture.asset(
      //                     'assets/svg/IconMap.svg',
      //                   ),
      //                 ))),
      //         BottomNavigationBarItem(
      //             label: 'a',
      //             icon: Container(
      //                 decoration: BoxDecoration(
      //                     shape: BoxShape.circle, color:widget.index==2? ColorApp.darkGreen:Colors.transparent),
      //                 child: Padding(
      //                   padding:  EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      //                   child: SvgPicture.asset(
      //                     'assets/svg/IconSe.svg',
      //                   ),
      //                 ))),
      //         BottomNavigationBarItem(
      //             label: 'a',
      //             icon: Container(
      //                 decoration: BoxDecoration(
      //                     shape: BoxShape.circle, color:widget.index==3? ColorApp.darkGreen:Colors.transparent),
      //                 child: Padding(
      //                   padding:  EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      //                   child: SvgPicture.asset(
      //                     'assets/svg/IconCart.svg',
      //                   ),
      //                 ))),
      //         BottomNavigationBarItem(
      //             label: 'a',
      //             icon: Container(
      //                 decoration: BoxDecoration(
      //                     shape: BoxShape.circle, color:widget.index==4? ColorApp.darkGreen:Colors.transparent),
      //                 child: Padding(
      //                   padding:  EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      //                   child: SvgPicture.asset(
      //                     'assets/svg/IconAcc.svg',
      //                   ),
      //                 ))),
      //         // BottomNavigationBarItem(
      //         //     icon:ImageIcon(AssetImage(ImagePath.bottomBarAccount)), label: "Tài khoản"),
      //       ],
      //       onTap: (val) {
      //         widget.index = val;
      //         setState(() {});
      //       },
      //       selectedFontSize: 0,
      //       showSelectedLabels: false,
      //       showUnselectedLabels: false,
      //       backgroundColor: ColorApp.bottomBar,
      //       currentIndex: widget.index,
      //       type: BottomNavigationBarType.fixed,
      //       selectedItemColor: ColorApp.red,
      //       selectedLabelStyle:
      //           StyleApp.textStyle400(color: ColorApp.red, fontSize: 12),
      //       unselectedItemColor: ColorApp.black,
      //       unselectedLabelStyle:
      //           StyleApp.textStyle400(color: ColorApp.black, fontSize: 12),
      //     ),
      //   ),
      // ),
    );
  }
}
