import 'package:bloc_base/bloc/language/bloc_lang.dart';
import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:bloc_base/screen/cart/no_connect_screen/no_connect_screen.dart';
import 'package:bloc_base/styles/init_style.dart';
import 'package:bloc_base/widget/item/button.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../config/const.dart';
import '../../../../router/router.dart';
import '../../../../styles/colors.dart';
import '../../../../widget/item/appBar.dart';

class PhoneNumberSignUp extends StatefulWidget {
  const PhoneNumberSignUp({super.key});
  static String verify ='';
  @override
  State<PhoneNumberSignUp> createState() => _PhoneNumberSignUpState();
}

class _PhoneNumberSignUpState extends State<PhoneNumberSignUp> {
  final phoneNumberController = TextEditingController();
  final countryCodeController = TextEditingController();

  var phone = '';
  var countryCode = '+84';
  CountryCode selecteCountry = CountryCode( name: 'VN', flagUri: 'vn');


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLanguage, StateBloc>(
        builder: (context, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return Scaffold(
          backgroundColor: ColorApp.darkGreen,
          appBar: AppBarWidget(
            title: language.dangKySDT,
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
                Row(
                  children: [
                    Container(
                      height: 59,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 0.5, color: ColorApp.dark500),
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(15))),
                      child: CountryCodePicker(
                        onChanged: (CountryCode value){
                          countryCode = value.dialCode!;
                        },
                        initialSelection: '+84',
                        favorite: ['+84','VN'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                      ),
                    ),
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 0.5, color: ColorApp.dark500),
                          borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(15))),
                      child: TextFormField(
                        controller: phoneNumberController,
                        keyboardType: TextInputType.number,
                        onChanged: (String value){
                          phone = value;
                        },
                        decoration:
                             InputDecoration(border: InputBorder.none,
                              hintText: language.soDienThoai,
                            ),
                      ),
                    ))
                  ],
                ),
                const Gap(30),
                ButtonWidget(text: language.nhanOTP, onTap: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: countryCode+phone,
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                     PhoneNumberSignUp.verify = verificationId;
                     var numberPhone = countryCode+phone;
                      Navigator.pushNamed(context, RouterName.confirmOTPScreen, arguments: numberPhone);
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );

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
