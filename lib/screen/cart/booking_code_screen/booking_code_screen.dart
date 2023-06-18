import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:bloc_base/homepage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../bloc/language/bloc_lang.dart';
import '../../../config/const.dart';

import '../../../styles/init_style.dart';
import '../../../widget/item/appbar.dart';
import '../../../widget/item/button.dart';

class BookingCodeScreen extends StatefulWidget {
  const BookingCodeScreen({Key? key}) : super(key: key);

  @override
  State<BookingCodeScreen> createState() => _BookingCodeScreenState();
}

class _BookingCodeScreenState extends State<BookingCodeScreen> {
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
              AppBarWidget(title: language.maDatLich),
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
                            style:
                                StyleApp.textStyle500(color: ColorApp.dark500),
                            children: <TextSpan>[
                              TextSpan(
                                text: language.day,
                                style: StyleApp.textStyle500(
                                    color: ColorApp.bottomBarABCA74),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomSheet: SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                children: [
                  ButtonWidget(
                    type: ButtonType.secondary,
                    onTap: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyHomePage(index: 2)),
                      (Route<dynamic> route) => false,
                    ),
                    text: language.xemthemDV.toUpperCase(),
                  ),
                  // const Gap(10)
                ],
              ),
            ),
          ),
        );
      }
      return const Scaffold();
    });
  }
}
