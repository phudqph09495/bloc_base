import 'package:bloc_base/router/router.dart';
import 'package:bloc_base/screen/login/login_screen/pages/phone_number_sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

import '../../../../bloc/language/bloc_lang.dart';
import '../../../../bloc/language/event_bloc2.dart';
import '../../../../bloc/state_bloc.dart';
import '../../../../config/const.dart';
import '../../../../styles/colors.dart';
import '../../../../styles/styles.dart';
import '../../../../widget/item/appBar.dart';
import '../../../../widget/item/button.dart';
import '../../../cart/no_connect_screen/no_connect_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, required this.numberPhone});
 final String numberPhone;
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final otpController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  var smsCode = '';

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return BlocBuilder<BlocLanguage, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return Scaffold(
          backgroundColor: ColorApp.darkGreen,
          appBar: AppBarWidget(
            title: language.xacNhanOTP,
            isBack: true,
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              color: ColorApp.backgroundF5F6EE,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            child: Column(
              children: [
                const Gap(30),
                Image.asset(
                  'assets/images/logo_app.png',
                  height: Const.sizeWidth(context, 68),
                ),
                const Gap(80),
                Text(
                  language.xacMinhSDTcontent,
                  textAlign: TextAlign.center,
                  style: StyleApp.textStyle400(
                      color: ColorApp.dark500, fontSize: 16),
                ),
                const Gap(30),
                Pinput(
                  controller: otpController,
                  length: 6,
                  showCursor: true,
                  onChanged: (String value) {
                    smsCode = value;
                  },
                ),
                const Gap(30),
                ButtonWidget(
                    text: language.xacNhan,
                    onTap: () async {
                      try {
                        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: PhoneNumberSignUp.verify, smsCode: smsCode);
                        await auth.signInWithCredential(credential);
                        Navigator.pushNamed(context, RouterName.signUpScreen,arguments: widget.numberPhone);
                      } catch (e) {
                      }
                    })
              ],
            ),
          ),
        );
      }
      return const NoConnectScreen();
    });
  }
}
