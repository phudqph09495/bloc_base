import 'package:bloc_base/bloc/language/bloc_lang.dart';
import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/screen/ex.dart';
import 'package:bloc_base/screen/home/home_screen.dart';
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
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _launchURL(url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Đã có lỗi , vui lòng quay lại sau';
    }
  }

  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BlocCheckLogin>().add(GetData());
    context.read<BlocLang>().add(getLang());
    // context.read<BlocFireBaseMS>().add(firebase());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BlocCheckLogin, StateBloc>(
        builder: (context, StateBloc state) {
          final check = state is LoadSuccess ? state.data as bool : false;
          return IndexedStack(
            index: index,
            children: [
              HomeScreen(),
              // Scene(),
              Container(),
              Container(),
              Container(),
              // LoveScreen(),
              check ? Container() : Container()
              // AccountScreen()
            ],
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.025,
            right: MediaQuery.of(context).size.width * 0.025,
            bottom: MediaQuery.of(context).size.width * 0.021,
            top: MediaQuery.of(context).size.width * 0.013),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  label: '',
                    icon: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color:index==0? ColorApp.darkGreen:Colors.transparent),
                        child: Padding(
                          padding:  EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                          child: SvgPicture.asset(
                            'assets/svg/IconHome.svg',
                          ),
                        ))),
                BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,  color:index==1? ColorApp.darkGreen:Colors.transparent),
                        child: Padding(
                          padding:  EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                          child: SvgPicture.asset(
                            'assets/svg/IconMap.svg',
                          ),
                        ))),
                BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color:index==2? ColorApp.darkGreen:Colors.transparent),
                        child: Padding(
                          padding:  EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                          child: SvgPicture.asset(
                            'assets/svg/IconSe.svg',
                          ),
                        ))),
                BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color:index==3? ColorApp.darkGreen:Colors.transparent),
                        child: Padding(
                          padding:  EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                          child: SvgPicture.asset(
                            'assets/svg/IconCart.svg',
                          ),
                        ))),
                BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color:index==4? ColorApp.darkGreen:Colors.transparent),
                        child: Padding(
                          padding:  EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                          child: SvgPicture.asset(
                            'assets/svg/IconAcc.svg',
                          ),
                        ))),
                // BottomNavigationBarItem(
                //     icon:ImageIcon(AssetImage(ImagePath.bottomBarAccount)), label: "Tài khoản"),
              ],
              onTap: (val) {
                index = val;
                setState(() {});
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: ColorApp.bottomBar,
              currentIndex: index,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: ColorApp.red,
              selectedLabelStyle:
                  StyleApp.textStyle400(color: ColorApp.red, fontSize: 12),
              unselectedItemColor: ColorApp.black,
              unselectedLabelStyle:
                  StyleApp.textStyle400(color: ColorApp.black, fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}
