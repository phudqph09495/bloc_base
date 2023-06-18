import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:bloc_base/router/router.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../bloc/language/bloc_lang.dart';
import '../../../config/const.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/appbar.dart';
import '../../../widget/item/button.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
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
              const AppBarWidget(),
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
                    children: [
                      Column(
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
                                        color: ColorApp.bottomBarABCA74),
                                  ),
                                  const Icon(
                                    Icons.double_arrow_rounded,
                                    color: ColorApp.bottomBarABCA74,
                                    size: 16,
                                  )
                                ],
                              ),
                              const SizedBox(),
                            ],
                          ),
                        ],
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
                    onTap: () => Navigator.pushNamed(
                        context, RouterName.bookingCodeScreen),
                    text: language.xemthemMaDatLich.toUpperCase(),
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
