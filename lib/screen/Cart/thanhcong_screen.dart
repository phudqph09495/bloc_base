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

import 'ma_dat_Lich_screen.dart';

class ThanhCongScreen extends StatefulWidget {
  const ThanhCongScreen({Key? key}) : super(key: key);

  @override
  State<ThanhCongScreen> createState() => _ThanhCongScreenState();
}

class _ThanhCongScreenState extends State<ThanhCongScreen> {
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
                            children: const [SizedBox(), SizedBox()],
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
                        SvgPicture.asset('assets/svg/thanhCOng.svg'),
                        SizedBox(
                          height: Const.size(context).height * 50 / 844,
                        ),
                        SizedBox(
                            width: Const.size(context).width * 0.65,
                            child: Text(
                              language.camOnBan,
                              textAlign: TextAlign.center,
                              style: StyleApp.textStyle700(
                                  color: ColorApp.darkGreen, fontSize: 18),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            width: Const.size(context).width * 0.9,
                            child: Text(
                              'Mỗi booking của quý khách được hoàn thành sẽ tương ứng với 1000 đồng gửi tới Tổ chức trẻ em Rồng Xanh.',
                              textAlign: TextAlign.center,
                              style: StyleApp.textStyle500(
                                  color: ColorApp.black3F, fontSize: 16),
                            )),
                        SizedBox(
                          height: Const.size(context).height * 40 / 844,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            Row(
                              children: [
                                Text(
                                  language.timHieuThem,
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.bottomBar),
                                ),
                                const Icon(
                                  Icons.double_arrow_rounded,
                                  color: ColorApp.bottomBar,
                                  size: 16,
                                )
                              ],
                            ),
                            const SizedBox(),
                          ],
                        )
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MaDatLichScreen()));
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
                    language.xemthemMaDatLich.toUpperCase(),
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
