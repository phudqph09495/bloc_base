import 'dart:typed_data';

import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:bloc_base/homePage.dart';
import 'package:bloc_base/screen/auth/signup_screen.dart';
import 'package:bloc_base/widget/item/input/text_filed2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bloc/language/bloc_lang.dart';
import '../../config/const.dart';
import '../../styles/init_style.dart';
import '../../widget/item/input/text_filed.dart';
import 'forgetPass_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLang, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return Scaffold(

          body: Stack(
            children: [

              Positioned(
                top: 0,
                child: Container(
                  color: ColorApp.darkGreen,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      SizedBox(height:MediaQuery.of(context).size.height*0.05 ,),
                      Text(
                        '${language.dangNhap}',
                        style: StyleApp.textStyle700(
                        color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.12,
                height: MediaQuery.of(context).size.height,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                   color: ColorApp.whiteF0,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: SingleChildScrollView(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height*1.5,
                        child: Padding(
                    padding: EdgeInsets.only(
                          top: Const.size(context).width * 0.07692307692,

                          left: Const.size(context).width * 0.04615384615,
                          right: Const.size(context).width * 0.04615384615),
                    child: Column(
                        children: [
                          SvgPicture.asset('assets/svg/LogoApp.svg'),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${language.soDienThoai}',
                                style:
                                    StyleApp.textStyle700(color: ColorApp.dark),
                              ),
                              SizedBox(
                                height: Const.size(context).width * 0.02615384615,
                              ),
                              InputText1(
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
                                '${language.matKhau}',
                                style:
                                    StyleApp.textStyle700(color: ColorApp.dark),
                              ),
                              SizedBox(
                                height: Const.size(context).width * 0.02615384615,
                              ),
                              InputText2(
                                label: '',
                                obscureText: true,
                                hasPass: true,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.04615384615,
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassScreen()));
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/svg/forgot.svg'),
                                    Text(
                                      '  ${language.quenMK}',
                                      style: StyleApp.textStyle500(color: ColorApp.bottomBar),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.05615384615,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.065,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: ColorApp.orange,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: Const.size(context).width * 0.02615384615),
                                child: Text(
                                  '${language.dangNhap.toUpperCase()}',
                                  style: StyleApp.textStyle700(color: ColorApp.dark),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.03615384615,
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [SizedBox(),
                              InkWell(
                                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/svg/IconAcc2.svg'),
                                    Text(' ${language.dangKyTaiKhoan}',style: StyleApp.textStyle400(color: ColorApp.darkGreen),)
                                  ],
                                ),
                              ),
                              SizedBox()
                            ],
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.08615384615,
                          ),
                          Row(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(flex: 1,child: Divider(thickness: 1.5,)),
                              Text('  ${language.hoacDangNhap}  ',style: StyleApp.textStyle500(color: ColorApp.dark500),),
                              Expanded(flex: 1,child: Divider(thickness: 1.5,)),
                            ],
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.06615384615,
                          ),
                          Row(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(flex: 1,child:  Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Const.size(context).width * 0.01),
                                child: InkWell(
                                  onTap: (){},
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.065,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: Const.size(context).width * 0.02615384615,horizontal:Const.size(context).width * 0.08615384615 ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SvgPicture.asset('assets/svg/google.svg'),
                                          Text(
                                            'GOOGLE',
                                            style: StyleApp.textStyle700(color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),),
                              Text('    ',style: StyleApp.textStyle500(color: ColorApp.dark500),),
                              Expanded(flex: 1,child:  Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Const.size(context).width * 0.01),
                                child: Container(
                                  height: MediaQuery.of(context).size.height * 0.065,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: Const.size(context).width * 0.02615384615,horizontal:Const.size(context).width * 0.08615384615 ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset('assets/svg/facebook.svg'),
                                        Text(
                                          'FACEBOOK',
                                          style: StyleApp.textStyle700(color: ColorApp.blue3A),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),),
                            ],
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.06615384615,
                          ),
                          RichText(textAlign: TextAlign.center,
                            text: TextSpan(
                              text: '${language.khiDangNhap} ',
style: StyleApp.textStyle500(color: ColorApp.dark500),
                              children:  <TextSpan>[
                                TextSpan(text: '${language.dieuKhoanSuDung}',style: StyleApp.textStyle500(color: ColorApp.bottomBar),),
                                TextSpan(text: ' ${language.va}',style:StyleApp.textStyle500(color: ColorApp.dark500),),
                          TextSpan(text: ' ${language.chinhSachbaoMat}.',style: StyleApp.textStyle500(color: ColorApp.bottomBar),),
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
      return Scaffold();
    });
  }
}



