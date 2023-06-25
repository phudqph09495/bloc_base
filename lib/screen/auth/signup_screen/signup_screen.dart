import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:bloc_base/model/model_local.dart';
import 'package:bloc_base/widget/item/appbar.dart';
import 'package:bloc_base/widget/item/input/bottom_sheet.dart';
import 'package:bloc_base/widget/item/input/text_filed2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../bloc/language/bloc_lang.dart';
import '../../../config/const.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/input/text_filed.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController genderController = TextEditingController();
  TextEditingController dOBController = TextEditingController();
  int selectedIndex = -1;
  bool? taoTKMoi = false;
  List<ModelLocal2> genderList = [
    ModelLocal2(name: 'Nam'),
    ModelLocal2(name: 'Nữ'),
  ];
  @override
  void dispose() {
    genderController.dispose();
    dOBController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLanguage, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: ColorApp.darkGreen,
            appBar: AppBarWidget(
              title: language.dangKy,
            ),
            body: Container(
              decoration: const BoxDecoration(
                  color: ColorApp.backgroundF5F6EE,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const Gap(30),
                      SvgPicture.asset('assets/svg/LogoApp.svg'),
                      const Gap(30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            language.hoTen,
                            style: StyleApp.textStyle700(
                                color: ColorApp.dark252525),
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.03179487179,
                          ),
                          InputText1(
                            colorBg: Colors.white,
                            label: '',
                            radius: 10,
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.05179487179,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      language.ngaySinh,
                                      style: StyleApp.textStyle700(
                                          color: ColorApp.dark252525),
                                    ),
                                    SizedBox(
                                      height: Const.size(context).width *
                                          0.02179487179,
                                    ),
                                    InputText1(
                                      hasSuffix: true,
                                      suffix: Transform.scale(
                                          scale: 0.5,
                                          child: SvgPicture.asset(
                                              'assets/svg/notiIcon.svg')),
                                      colorBg: Colors.white,
                                      controller: dOBController,
                                      onTap: () {
                                        DatePicker.showDatePicker(context,
                                            currentTime: DateTime.now(),
                                            locale: language.codeNow == 'en'
                                                ? LocaleType.en
                                                : LocaleType.vi,
                                            onConfirm: (date) {
                                          dOBController.text = Const.formatTime(
                                              date.millisecondsSinceEpoch,
                                              format: 'dd/MM/yyyy');
                                        });
                                      },
                                      label:
                                          '${Const.formatTime(DateTime.now().millisecondsSinceEpoch, format: 'dd/MM/yyyy')}',
                                      radius: 10,
                                      readOnly: true,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      language.gioiTinh,
                                      style: StyleApp.textStyle700(
                                          color: ColorApp.dark252525),
                                    ),
                                    SizedBox(
                                      height: Const.size(context).width *
                                          0.02179487179,
                                    ),
                                    InputText1(
                                      colorBg: Colors.white,
                                      onTap: () {
                                        BottomSheetInforService
                                            .selecteRadioBottomSheet(
                                          context,
                                          language.gioiTinh,
                                          genderList,
                                          selectedIndex,
                                          genderController,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.4,
                                        );
                                      },
                                      controller: genderController,
                                      label: '${language.nam}/${language.nu}',
                                      radius: 10,
                                      hasSuffix: true,
                                      suffix: const Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: ColorApp.dark500,
                                      ),
                                      readOnly: true,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.05179487179,
                          ),
                          Text(
                            language.soDienThoai,
                            style: StyleApp.textStyle700(
                                color: ColorApp.dark252525),
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.03179487179,
                          ),
                          InputText1(
                            keyboardType: TextInputType.phone,
                            label: '',
                            radius: 10,
                            colorBg: Colors.white,
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.05179487179,
                          ),
                          Text(
                            language.matKhau,
                            style: StyleApp.textStyle700(
                                color: ColorApp.dark252525),
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.03179487179,
                          ),
                          InputText2(
                            label: '',
                            hasPass: true,
                            obscureText: true,
                            radius: 10,
                            colorBg: Colors.white,
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.05179487179,
                          ),
                          Text(
                            language.xacNhanMatKhau,
                            style: StyleApp.textStyle700(
                                color: ColorApp.dark252525),
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.03179487179,
                          ),
                          InputText2(
                            label: '',
                            hasPass: true,
                            obscureText: true,
                            radius: 10,
                            colorBg: Colors.white,
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.04179487179,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 24.0,
                                height: 24.0,
                                child: Checkbox(
                                    side: const BorderSide(
                                        color: ColorApp.black3F),
                                    shape: const CircleBorder(),
                                    activeColor: ColorApp.bottomBarABCA74,
                                    value: taoTKMoi,
                                    onChanged: (value) {
                                      setState(() {
                                        taoTKMoi = value;
                                      });
                                    }),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text(
                                ' ${language.nhanEmail}',
                                style: StyleApp.textStyle500(
                                    color: ColorApp.dark500),
                              ))
                            ],
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.05179487179,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.065,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: ColorApp.orangeFFC94D,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Const.size(context).width *
                                      0.02615384615),
                              child: Text(
                                language.dangKy.toUpperCase(),
                                style: StyleApp.textStyle700(
                                    color: ColorApp.dark252525),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.05179487179,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: '${language.khiDangKy} ',
                              style: StyleApp.textStyle500(
                                  color: ColorApp.dark500),
                              children: <TextSpan>[
                                TextSpan(
                                  text: language.dieuKhoanSuDung,
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.bottomBarABCA74),
                                ),
                                TextSpan(
                                  text: ' ${language.va}',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.dark500),
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
                      )
                    ],
                  ),
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
