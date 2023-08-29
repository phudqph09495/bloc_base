import 'dart:ui';
import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:bloc_base/router/router.dart';
import 'package:bloc_base/services/auth_service.dart';
import 'package:bloc_base/styles/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bloc_base/widget/item/input/text_filed2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../../bloc/language/bloc_lang.dart';
import '../../../../config/const.dart';
import '../../../../styles/app_values.dart';
import '../../../../styles/colors.dart';
import '../../../../styles/styles.dart';
import '../../../../widget/item/appBar.dart';
import '../../../../widget/item/button.dart';
import '../../../../widget/item/input/text_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signUserIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: accountController.text, password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              color: ColorApp.backgroundF5F6EE,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            child: Column(
              children: [
                const Gap(AppSize.s30),
                Image.asset(
                  'assets/images/logo_app.png',
                  height: Const.sizeWidth(context, 68),
                ),
                const Gap(AppSize.s30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      language.soDienThoai,
                      style:AppTextStyles.textDark16(),
                    ),
                   const Gap(15),
                    InputText1(
                      controller: accountController,
                      borderSize: 0.8,
                      borderColor: ColorApp.borderEAEAEA,
                      radius: 10,
                      label: '',
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ),
                const Gap(30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      language.matKhau,
                      style:AppTextStyles.textDark16(),
                    ),
                    const Gap(15),
                    InputText2(
                      controller: passwordController,
                      borderColor: ColorApp.borderEAEAEA,
                      radius: 10,
                      label: '',
                      obscureText: true,
                      hasPass: true,
                    ),
                  ],
                ),
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    InkWell(
                      onTap: () {
                        signUserIn();
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/svg/forgot.svg',height: AppSize.s16),
                          Text(
                            '  ${language.quenMK}',
                            style: AppTextStyles.textGreen14(),
                          )
                        ],
                      ),
                    )
                  ],
                ),
               const Gap(20),
                ButtonWidget(
                  type: ButtonType.secondary,
                  text: language.dangNhap.toUpperCase(),
                  onTap: () {
                    Navigator.of(context,rootNavigator: true).pushNamed(RouterName.myHomePage, arguments: 0);
                  },
                ),
              const Gap(15),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouterName.confirmPhoneNumberScreen);
                  },
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/svg/IconAcc2.svg', height: 18,),
                        const Gap(10),
                        Text(
                          language.dangKyTaiKhoan,
                          style: AppTextStyles.textDarkGreen16(),
                        )
                      ],
                    ),
                  ),
                ),
                const Gap(35),
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
                      style: AppTextStyles.text14Medium(),
                    ),
                    const Expanded(
                        flex: 1,
                        child: Divider(
                          thickness: 1.5,
                        )),
                  ],
                ),
                const Gap(35),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Const.size(context).width * 0.01),
                        child: GestureDetector(
                          onTap: () => AuthService().signInWithGoogle(),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/svg/google.svg'),
                                  const Gap(20),
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
                  ],
                ),
                const Gap(35),
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
              ],
            ),
          ),
        );
      }
      return const Scaffold();
    });
  }
}
