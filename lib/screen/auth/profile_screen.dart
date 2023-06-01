import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:bloc_base/homePage.dart';
import 'package:bloc_base/screen/Cart/thanhToan_screen.dart';
import 'package:bloc_base/widget/item/input/text_filed2.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../bloc/language/bloc_lang.dart';
import '../../config/const.dart';
import '../../model/model_local.dart';
import '../../styles/init_style.dart';
import '../../widget/item/input/text_filed.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController gioiTinh = TextEditingController();
  TextEditingController ngaySinh = TextEditingController();
  int selectedIndex=0;
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
                child: Stack(
                  children: [
                    Container(
                      color: ColorApp.darkGreen,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(),
                              Text(
                                '${language.ttTK}',
                                style: StyleApp.textStyle700(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox()
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.04,
                      left: 10,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            child: FaIcon(
                              FontAwesomeIcons.arrowLeftLong,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.12,
                height: MediaQuery.of(context).size.height * 1.5,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1.5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: SingleChildScrollView(
                      child: SizedBox(
                    height: MediaQuery.of(context).size.height * 3,
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
                              vertical:
                                  Const.size(context).width * 0.04179487179,
                              horizontal:
                                  Const.size(context).width * 0.04615384615),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${language.ttCN}',
                                style: StyleApp.textStyle700(
                                    color: ColorApp.dark, fontSize: 16),
                              ),
                              SizedBox(
                                height:
                                    Const.size(context).width * 0.04179487179,
                              ),
                              Text(
                                '${language.hoTen}',
                                style:
                                    StyleApp.textStyle700(color: ColorApp.dark),
                              ),
                              SizedBox(
                                height:
                                    Const.size(context).width * 0.02179487179,
                              ),
                              InputText1(
                                colorBg: ColorApp.whiteF0,
                                label: 'Nguyễn Quang Vinh',
                                radius: 10,
                              ),
                              SizedBox(
                                height:
                                    Const.size(context).width * 0.04179487179,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 14,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${language.ngaySinh}',
                                          style: StyleApp.textStyle700(
                                              color: ColorApp.dark),
                                        ),
                                        SizedBox(
                                          height: Const.size(context).width *
                                              0.02179487179,
                                        ),
                                        InputText1(
                                          suffix: Transform.scale(scale: 0.5,child: SvgPicture.asset('assets/svg/notiIcon.svg')),
                                          colorBg: ColorApp.whiteF0,
                                          controller: ngaySinh,
                                          onTap: () {
                                            DatePicker.showDatePicker(context,
                                                currentTime: DateTime.now(),
                                                locale: language.codeNow == 'en'
                                                    ? LocaleType.en
                                                    : LocaleType.vi,
                                                onConfirm: (date) {
                                              ngaySinh.text = Const.formatTime(
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
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(),
                                  ),
                                  Expanded(
                                    flex: 14,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${language.gioiTinh}',
                                          style: StyleApp.textStyle700(
                                              color: ColorApp.dark),
                                        ),
                                        SizedBox(
                                          height: Const.size(context).width *
                                              0.02179487179,
                                        ),
                                        InputText1(colorBg: ColorApp.whiteF0,
                                          onTap: () {
                                            showModalBottomSheet(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  12),
                                                          topLeft:
                                                              Radius.circular(
                                                                  12)),
                                                ),
                                                context: context,
                                                builder: (context) =>
                                                    StatefulBuilder(builder:(BuildContext context,StateSetter setState1){
                                                      return Container(
                                                       height: Const.size(context).height * 0.35,
                                                        child: SingleChildScrollView(
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap: () {
                                                                        Navigator.pop(context);
                                                                      },
                                                                      child: Icon(Icons.clear),
                                                                    ),
                                                                    Text(
                                                                      '${language.gioiTinh}',
                                                                      style: StyleApp.textStyle700(
                                                                          fontSize: 18,
                                                                          color: ColorApp.dark),
                                                                    ),
                                                                    SizedBox()
                                                                  ],
                                                                ),
                                                                Divider(),
                                                                Padding(
                                                                  padding:
                                                                  const EdgeInsets.only(
                                                                      bottom: 5),
                                                                  child: Container(
                                                                    decoration: BoxDecoration(
                                                                        color: ColorApp.grey8B
                                                                            .withOpacity(0.1),
                                                                        borderRadius:
                                                                        BorderRadius
                                                                            .circular(15)),
                                                                    child: Padding(
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          horizontal: 5),
                                                                      child: RadioListTile<int>(
                                                                        controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .trailing,
                                                                        contentPadding:
                                                                        EdgeInsets.zero,
                                                                        title: Text(
                                                                          '${language.nam}',
                                                                          style: StyleApp
                                                                              .textStyle600(
                                                                              color: ColorApp
                                                                                  .dark500),
                                                                        ),
                                                                        value: 0,
                                                                        activeColor:
                                                                        ColorApp.darkGreen,
                                                                        groupValue:
                                                                        selectedIndex,
                                                                        onChanged:
                                                                            (int? value) {
                                                                          setState1(() {
                                                                            selectedIndex =
                                                                            value!;
                                                                          });
                                                                         gioiTinh.text=language.nam;
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                  const EdgeInsets.only(
                                                                      bottom: 5),
                                                                  child: Container(
                                                                    decoration: BoxDecoration(
                                                                        color: ColorApp.grey8B
                                                                            .withOpacity(0.1),
                                                                        borderRadius:
                                                                        BorderRadius
                                                                            .circular(15)),
                                                                    child: Padding(
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          horizontal: 5),
                                                                      child: RadioListTile<int>(
                                                                        controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .trailing,
                                                                        contentPadding:
                                                                        EdgeInsets.zero,
                                                                        title: Text(
                                                                          '${language.nu}',
                                                                          style: StyleApp
                                                                              .textStyle600(
                                                                              color: ColorApp
                                                                                  .dark500),
                                                                        ),
                                                                        value: 1,
                                                                        activeColor:
                                                                        ColorApp.darkGreen,
                                                                        groupValue:
                                                                        selectedIndex,
                                                                        onChanged:
                                                                            (int? value) {
                                                                          setState1(() {
                                                                            selectedIndex =
                                                                            value!;
                                                                          });
                                                                          gioiTinh.text=language.nu;
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }));
                                          },
                                          controller: gioiTinh,
                                          label: '${language.nam}',
                                          radius: 10,
                                          hasSuffix: true,
                                          suffix: Icon(Icons.keyboard_arrow_down_rounded,color: ColorApp.dark500,),
                                          readOnly: true,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height:
                                Const.size(context).width * 0.04179487179,
                              ),
                              Text(
                                '${language.soDienThoai}',
                                style:
                                StyleApp.textStyle700(color: ColorApp.dark),
                              ),
                              SizedBox(
                                height:
                                Const.size(context).width * 0.02179487179,
                              ),
                              InputText1(keyboardType: TextInputType.phone,
                                label: '0974859632',
                                radius: 10,
                                colorBg: ColorApp.whiteF0,
                              ),
                              SizedBox(
                                height:
                                Const.size(context).width * 0.02179487179,
                              ),

                            ],
                          ),
                        ),
                        Divider(thickness: 1.2,),

                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                              Const.size(context).width * 0.02179487179,
                              horizontal:
                              Const.size(context).width * 0.04615384615),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${language.thayDoiMK}',
                                style: StyleApp.textStyle700(
                                    color: ColorApp.dark, fontSize: 16),
                              ),
                              SizedBox(
                                height:
                                Const.size(context).width * 0.04179487179,
                              ),

                             InputText2(colorBg: ColorApp.whiteF0,label: '${language.matKhauCu}',radius: 10,hasPass: true,obscureText: true,),
                              SizedBox(
                                height:
                                Const.size(context).width * 0.03179487179,
                              ),
                              InputText2(label: '${language.matKhauMoi}',hasPass: true,obscureText: true,radius: 10,colorBg: ColorApp.whiteF0,),
                              SizedBox(
                                height:
                                Const.size(context).width * 0.03179487179,
                              ),
                              InputText2(label: '${language.xacNhanMatKhau}',hasPass: true,obscureText: true,radius: 10,colorBg: ColorApp.whiteF0,),
                              SizedBox(
                                height:
                                Const.size(context).width * 0.04179487179,
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height * 0.065,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: ColorApp.orange,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: Const.size(context).width * 0.02615384615),
                                  child: Text(
                                    '${language.luuThayDoi.toUpperCase()}',
                                    style: StyleApp.textStyle700(color: ColorApp.dark),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
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
