import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:bloc_base/router/router.dart';
import 'package:bloc_base/widget/item/input/text_filed2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../bloc/language/bloc_lang.dart';
import '../../../config/const.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/appbar.dart';
import '../../../widget/item/button.dart';

class RePassworkScreen extends StatelessWidget {
  const RePassworkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLanguage, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              backgroundColor: ColorApp.darkGreen,
              appBar: AppBarWidget(title: language.matKhau),
              body: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: ColorApp.whiteF0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(25),
                      Text(
                        language.thayDoiMK,
                        style: StyleApp.textStyle700(
                            color: ColorApp.dark252525, fontSize: 16),
                      ),
                      SizedBox(
                        height: Const.size(context).width * 0.04179487179,
                      ),
                      InputText2(
                        label: language.matKhauMoi,
                        radius: 10,
                        hasPass: true,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: Const.size(context).width * 0.03179487179,
                      ),
                      InputText2(
                        label: language.nhapLaiMatKhauMoi,
                        hasPass: true,
                        obscureText: true,
                        radius: 10,
                      ),
                      const Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: ButtonWidget(
                          type: ButtonType.secondary,
                          text: language.luuThayDoi.toUpperCase(),
                          onTap: () {
                            Navigator.pushNamed(context, RouterName.myHomePage);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
      }
      return const Scaffold();
    });
  }
}
