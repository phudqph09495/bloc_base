import 'dart:typed_data';

import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:bloc_base/homePage.dart';
import 'package:bloc_base/widget/item/input/text_filed2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../bloc/language/bloc_lang.dart';
import '../../config/const.dart';
import '../../styles/init_style.dart';
import '../../widget/item/input/text_filed.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  TextEditingController gioiTinh = TextEditingController();
  TextEditingController ngaySinh = TextEditingController();
  int selectedIndex = -1;
  bool? taoTKMoi = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLang, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: 0,
                child: Stack(
                  children: [
                    Container(
                      color: ColorApp.darkGreen,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Text(
                            language.quenMK2,
                            style: StyleApp.textStyle700(
                                color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.04,
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
                                horizontal: 20, vertical: 8),
                            child: FaIcon(
                              FontAwesomeIcons.arrowLeftLong,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.12,
                height: MediaQuery.of(context).size.height,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: ColorApp.whiteF0,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: SingleChildScrollView(
                      child: SizedBox(
                    height: Const.size(context).height * 0.8,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: Const.size(context).width * 0.07692307692,
                          left: Const.size(context).width * 0.04615384615,
                          right: Const.size(context).width * 0.04615384615),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          SizedBox(
                            height: Const.size(context).height * 0.33,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  language.vuiLongNhap,
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.dark500),
                                ),
                                Text(
                                  language.maOTP,
                                  style: StyleApp.textStyle700(
                                      color: ColorApp.dark),
                                ),
                                InputText1(label: ''),
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.065,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: ColorApp.orange,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: Const.size(context).width *
                                            0.02615384615),
                                    child: Text(
                                      language.nhap.toUpperCase(),
                                      style: StyleApp.textStyle700(
                                          color: ColorApp.dark),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(),
                        ],
                      ),
                    ),
                  )),
                ),
              ),
            ],
          ),
        );
      }
      return const Scaffold();
    });
  }
}
