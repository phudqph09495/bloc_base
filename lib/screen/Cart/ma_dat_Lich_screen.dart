import 'dart:typed_data';

import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:bloc_base/homePage.dart';
import 'package:bloc_base/widget/item/input/text_filed2.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../bloc/language/bloc_lang.dart';
import '../../config/const.dart';
import '../../model/model_local.dart';
import '../../styles/init_style.dart';
import '../../widget/item/input/text_filed.dart';
import 'package:http/http.dart' as http;

class MaDatLichScreen extends StatefulWidget {
  const MaDatLichScreen({Key? key}) : super(key: key);

  @override
  State<MaDatLichScreen> createState() => _MaDatLichScreenState();
}

class _MaDatLichScreenState extends State<MaDatLichScreen> {
  int selectedIndex = 0;
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
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              Text(
                                language.maDatLich,
                                style: StyleApp.textStyle700(
                                    color: Colors.white, fontSize: 20),
                              ),
                              const SizedBox()
                            ],
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
                height: MediaQuery.of(context).size.height * 1.5,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1.5,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: SingleChildScrollView(
                      child: SizedBox(
                    height: MediaQuery.of(context).size.height * 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25)))),
                        SvgPicture.asset('assets/svg/qrEX.svg'),
                        SizedBox(
                          height: Const.size(context).height * 44 / 844,
                        ),
                        Text(
                          language.soBooking,
                          style: StyleApp.textStyle500(
                              color: ColorApp.dark500, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '124 658',
                          style: StyleApp.textStyle700(
                              color: ColorApp.darkGreen, fontSize: 32),
                        ),
                        SizedBox(
                          height: Const.sizeHeight(context, 28),
                        ),
                        SizedBox(
                          width: Const.sizeWidth(context, 354),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: language.luuY,
                              style: StyleApp.textStyle500(
                                  color: ColorApp.dark500),
                              children: <TextSpan>[
                                TextSpan(
                                  text: language.day,
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.bottomBar),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
              ),
            ],
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.065,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: ColorApp.orange,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Const.size(context).width * 0.02615384615),
                  child: Text(
                    language.xemthemDV.toUpperCase(),
                    style: StyleApp.textStyle700(color: ColorApp.dark),
                  ),
                ),
              ),
            ),
          ),
        );
      }
      return const Scaffold();
    });
  }
}
