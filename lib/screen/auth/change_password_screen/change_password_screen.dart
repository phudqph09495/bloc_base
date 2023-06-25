import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../bloc/language/bloc_lang.dart';
import '../../../config/const.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/appbar.dart';
import '../../../widget/item/button.dart';
import '../../../widget/item/input/text_filed2.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLanguage, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return Scaffold(
          body: Stack(
            children: [
              AppBarWidget(title: language.matKhau),
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
                    height: MediaQuery.of(context).size.height * 1.5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Gap(25),
                                Column(
                                  children: [
                                    Text(
                                      language.thayDoiMK,
                                      style: StyleApp.textStyle700(
                                          color: ColorApp.dark252525,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: Const.size(context).width *
                                          0.04179487179,
                                    ),
                                    InputText2(
                                      colorBg: ColorApp.whiteF0,
                                      label: language.matKhauCu,
                                      radius: 10,
                                      hasPass: true,
                                      obscureText: true,
                                    ),
                                    SizedBox(
                                      height: Const.size(context).width *
                                          0.03179487179,
                                    ),
                                    InputText2(
                                      label: language.matKhauMoi,
                                      hasPass: true,
                                      obscureText: true,
                                      radius: 10,
                                      colorBg: ColorApp.whiteF0,
                                    ),
                                    SizedBox(
                                      height: Const.size(context).width *
                                          0.03179487179,
                                    ),
                                    InputText2(
                                      label: language.xacNhanMatKhau,
                                      hasPass: true,
                                      obscureText: true,
                                      radius: 10,
                                      colorBg: ColorApp.whiteF0,
                                    ),
                                  ],
                                ),
                                ButtonWidget(
                                    text: language.luuThayDoi,
                                    onTap: () {},
                                    type: ButtonType.secondary),
                              ],
                            ),
                          ),
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
