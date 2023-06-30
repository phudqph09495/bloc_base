import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:bloc_base/router/router.dart';

import 'package:bloc_base/widget/item/input/text_filed2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../bloc/language/bloc_lang.dart';
import '../../../config/const.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/appbar.dart';
import '../../../widget/item/button.dart';
import '../../../widget/item/input/text_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<BlocCheckLogin>().add(GetData());
    context.read<BlocLanguage>().add(GetLanguage());

    // context.read<BlocFireBaseMS>().add(firebase());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLanguage, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return Scaffold(
          backgroundColor: ColorApp.darkGreen,
          appBar: AppBarWidget(
            title: language.dangNhap,
            isBack: false,
          ),
          body: Container(
            decoration: const BoxDecoration(
                color: ColorApp.backgroundF5F6EE,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const Gap(30),
                    Image.asset(
                      'assets/images/logo_app.png',
                      height: Const.sizeWidth(context, 68),
                    ),
                    const Gap(30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          language.soDienThoai,
                          style:
                              StyleApp.textStyle700(color: ColorApp.dark252525),
                        ),
                        SizedBox(
                          height: Const.size(context).width * 0.02615384615,
                        ),
                        InputText1(
                          borderColor: ColorApp.borderEAEAEA,
                          radius: 10,
                          label: '',
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Const.size(context).width * 0.04615384615,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          language.matKhau,
                          style:
                              StyleApp.textStyle700(color: ColorApp.dark252525),
                        ),
                        SizedBox(
                          height: Const.size(context).width * 0.02615384615,
                        ),
                        InputText2(
                          borderColor: ColorApp.borderEAEAEA,
                          radius: 10,
                          label: '',
                          obscureText: true,
                          hasPass: true,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Const.size(context).width * 0.04615384615,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouterName.forgetPassScreen);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/svg/forgot.svg'),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                '  ${language.quenMK}',
                                style: StyleApp.textStyle500(
                                    color: ColorApp.bottomBarABCA74),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Const.size(context).width * 0.05615384615,
                    ),
                    ButtonWidget(
                      type: ButtonType.secondary,
                      text: language.dangNhap.toUpperCase(),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, RouterName.myHomePage);
                      },
                    ),
                    SizedBox(
                      height: Const.size(context).width * 0.03615384615,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouterName.signUpScreen);
                      },
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset('assets/svg/IconAcc2.svg'),
                            Text(
                              ' ${language.dangKyTaiKhoan}',
                              style: StyleApp.textStyle400(
                                  color: ColorApp.darkGreen),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Const.size(context).width * 0.08615384615,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                            flex: 1,
                            child: Divider(
                              thickness: 1.5,
                            )),
                        Text(
                          '  ${language.hoacDangNhap}  ',
                          style: StyleApp.textStyle500(color: ColorApp.dark500),
                        ),
                        const Expanded(
                            flex: 1,
                            child: Divider(
                              thickness: 1.5,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: Const.size(context).width * 0.06615384615,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Const.size(context).width * 0.01),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.065,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: Const.size(context).width *
                                          0.02615384615,
                                      horizontal: Const.size(context).width *
                                          0.08615384615),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset('assets/svg/google.svg'),
                                      Text(
                                        'GOOGLE',
                                        style: StyleApp.textStyle700(
                                            color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '    ',
                          style: StyleApp.textStyle500(color: ColorApp.dark500),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouterName.homeScreenTest);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Const.size(context).width * 0.01),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.065,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: Const.size(context).width *
                                          0.02615384615,
                                      horizontal: Const.size(context).width *
                                          0.08615384615),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/svg/facebook.svg'),
                                      Text(
                                        'FACEBOOK',
                                        style: StyleApp.textStyle700(
                                            color: ColorApp.blue3A),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Const.size(context).width * 0.06615384615,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: '${language.khiDangNhap} ',
                        style: StyleApp.textStyle500(color: ColorApp.dark500),
                        children: <TextSpan>[
                          TextSpan(
                            text: language.dieuKhoanSuDung,
                            style: StyleApp.textStyle500(
                                color: ColorApp.bottomBarABCA74),
                          ),
                          TextSpan(
                            text: ' ${language.va}',
                            style:
                                StyleApp.textStyle500(color: ColorApp.dark500),
                          ),
                          TextSpan(
                            text: ' ${language.chinhSachbaoMat}.',
                            style: StyleApp.textStyle500(
                                color: ColorApp.bottomBarABCA74),
                          ),
                        ],
                      ),
                    ),
                    const Gap(100),
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
