import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:bloc_base/router/router.dart';
import 'package:bloc_base/widget/item/appbar.dart';
import 'package:bloc_base/widget/item/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gap/gap.dart';

import '../../../bloc/language/bloc_lang.dart';
import '../../../config/const.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/input/text_filed.dart';

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
    return BlocBuilder<BlocLanguage, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return Scaffold(
          body: Stack(
            children: [
              AppBarWidget(
                title: language.quenMK,
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.12,
                height: MediaQuery.of(context).size.height,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: ColorApp.backgroundF5F6EE,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: Const.size(context).width * 0.04615384615,
                        right: Const.size(context).width * 0.04615384615),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(
                          MediaQuery.of(context).size.height * 0.25,
                        ),
                        Text(
                          language.vuiLongNhap,
                          style: StyleApp.textStyle500(
                              color: ColorApp.dark500, fontSize: 16),
                        ),
                        const Gap(30),
                        Text(
                          language.maOTP,
                          style: StyleApp.styleGilroy700(
                              color: ColorApp.dark252525),
                        ),
                        const Gap(12),
                        InputText1(
                          radius: 10,
                          label: '',
                          borderColor: ColorApp.background,
                          colorBg: ColorApp.borderEAEAEA,
                        ),
                        const Gap(20),
                        ButtonWidget(
                          text: language.nhap.toUpperCase(),
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouterName.rePassworkScreen);
                          },
                          type: ButtonType.secondary,
                        )
                      ],
                    ),
                  ),
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
