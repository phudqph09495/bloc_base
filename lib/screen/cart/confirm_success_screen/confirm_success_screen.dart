import 'package:bloc_base/bloc/language/bloc_lang.dart';
import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../bloc/state_bloc.dart';
import '../../../config/const.dart';
import '../../../router/router.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/button.dart';

class ConfirmSuccesScreen extends StatelessWidget {
  const ConfirmSuccesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLanguage, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return Scaffold(
          backgroundColor: ColorApp.whiteF0,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              // alignment: Alignment.center,
              height: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/svg/image_success.svg'),
                    SizedBox(
                      height: Const.sizeHeight(context, 35),
                    ),
                    Text(
                      language.successConfirm,
                      style: StyleApp.textStyle700(
                          color: ColorApp.darkGreen, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: Const.sizeWidth(context, 324),
                      child: Text(
                        language.dichVuDaXacNhan,
                        textAlign: TextAlign.center,
                        style: StyleApp.textStyle500(
                            color: ColorApp.black3F, fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: Const.sizeHeight(context, 40),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: ButtonWidget(
                        type: ButtonType.secondary,
                        text: language.goHome.toUpperCase(),
                        onTap: () =>
                            Navigator.pushNamed(context, RouterName.homeScreen),
                      ),
                    ),
                  ],
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
