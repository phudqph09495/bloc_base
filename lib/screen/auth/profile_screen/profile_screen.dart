import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';

import 'package:bloc_base/widget/item/input/bottom_sheet.dart';
import 'package:bloc_base/widget/item/input/text_filed2.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../bloc/language/bloc_lang.dart';
import '../../../config/const.dart';
import '../../../model/model_local.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/appbar.dart';
import '../../../widget/item/input/text_filed.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void dispose() {
    genderController.dispose();
    dOBController.dispose();
    super.dispose();
  }

  TextEditingController genderController = TextEditingController();
  TextEditingController dOBController = TextEditingController();
  int selectedIndex = 0;
  List<ModelLocal2> listGender = [
    ModelLocal2(name: 'Nam'),
    ModelLocal2(name: 'Nữ')
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLang, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return Scaffold(
          body: Stack(
            children: [
              AppBarWidget(title: language.ttTK),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.12,
                height: MediaQuery.of(context).size.height * 1.5,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1.5,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //     height: MediaQuery.of(context).size.height * 0.03,
                      //     decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         borderRadius: BorderRadius.only(
                      //             topLeft: Radius.circular(25),
                      //             topRight: Radius.circular(25)))),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Const.size(context).width * 0.04179487179,
                            horizontal:
                                Const.size(context).width * 0.04615384615),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              language.ttCN,
                              style: StyleApp.textStyle700(
                                  color: ColorApp.dark252525, fontSize: 16),
                            ),
                            SizedBox(
                              height: Const.size(context).width * 0.04179487179,
                            ),
                            Text(
                              language.hoTen,
                              style: StyleApp.textStyle700(
                                  color: ColorApp.dark252525),
                            ),
                            SizedBox(
                              height: Const.size(context).width * 0.02179487179,
                            ),
                            InputText1(
                              label: 'Nguyễn Quang Vinh',
                              radius: 10,
                            ),
                            SizedBox(
                              height: Const.size(context).width * 0.04179487179,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        suffix: Transform.scale(
                                            scale: 0.5,
                                            child: SvgPicture.asset(
                                                'assets/svg/notiIcon.svg')),
                                        controller: dOBController,
                                        onTap: () {
                                          DatePicker.showDatePicker(context,
                                              currentTime: DateTime.now(),
                                              locale: language.codeNow == 'en'
                                                  ? LocaleType.en
                                                  : LocaleType.vi,
                                              onConfirm: (date) {
                                            dOBController.text =
                                                Const.formatTime(
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
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        onTap: () {
                                          BottomSheetInforService
                                              .selecteRadioBottomSheet(
                                                  context,
                                                  language.gioiTinh,
                                                  listGender,
                                                  selectedIndex,
                                                  genderController,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3);
                                        },
                                        controller: genderController,
                                        label: language.nam,
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
                              height: Const.size(context).width * 0.04179487179,
                            ),
                            Text(
                              language.soDienThoai,
                              style: StyleApp.textStyle700(
                                  color: ColorApp.dark252525),
                            ),
                            SizedBox(
                              height: Const.size(context).width * 0.02179487179,
                            ),
                            InputText1(
                              keyboardType: TextInputType.phone,
                              label: '0974859632',
                              radius: 10,
                            ),
                            SizedBox(
                              height: Const.size(context).width * 0.02179487179,
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1.2,
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Const.size(context).width * 0.02179487179,
                            horizontal:
                                Const.size(context).width * 0.04615384615),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              language.thayDoiMK,
                              style: StyleApp.textStyle700(
                                  color: ColorApp.dark252525, fontSize: 16),
                            ),
                            SizedBox(
                              height: Const.size(context).width * 0.04179487179,
                            ),
                            InputText2(
                              label: language.matKhauCu,
                              radius: 10,
                              hasPass: true,
                              obscureText: true,
                            ),
                            SizedBox(
                              height: Const.size(context).width * 0.03179487179,
                            ),
                            InputText2(
                              label: language.matKhauMoi,
                              hasPass: true,
                              obscureText: true,
                              radius: 10,
                            ),
                            SizedBox(
                              height: Const.size(context).width * 0.03179487179,
                            ),
                            InputText2(
                              label: language.xacNhanMatKhau,
                              hasPass: true,
                              obscureText: true,
                              radius: 10,
                            ),
                            SizedBox(
                              height: Const.size(context).width * 0.04179487179,
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.065,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: ColorApp.orange,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: Const.size(context).width *
                                        0.02615384615),
                                child: Text(
                                  language.luuThayDoi.toUpperCase(),
                                  style: StyleApp.textStyle700(
                                      color: ColorApp.dark252525),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
