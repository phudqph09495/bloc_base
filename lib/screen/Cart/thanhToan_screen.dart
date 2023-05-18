import 'dart:typed_data';

import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:bloc_base/homePage.dart';
import 'package:bloc_base/widget/item/input/text_filed2.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../bloc/language/bloc_lang.dart';
import '../../config/const.dart';
import '../../model/model_local.dart';
import '../../styles/init_style.dart';
import '../../widget/item/input/text_filed.dart';
import 'package:http/http.dart' as http;

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ThanhToanScreen extends StatefulWidget {
  const ThanhToanScreen({Key? key}) : super(key: key);

  @override
  State<ThanhToanScreen> createState() => _ThanhToanScreenState();
}

class _ThanhToanScreenState extends State<ThanhToanScreen> {
  int selectedIndex = 0;
  bool? taoTKMoi = false;
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
                                '${language.thanhToan}',
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
                        Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25)))),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: Const.size(context).width *
                                          0.04615384615,
                                      bottom: Const.size(context).width *
                                          0.02615384615,
                                      left: Const.size(context).width *
                                          0.04615384615,
                                      right: Const.size(context).width *
                                          0.04615384615),
                                  child: Container(
                                    width: Const.size(context).width * 0.9,
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Container(
                                                width:
                                                    Const.size(context).width *
                                                        0.17948717948,
                                                height:
                                                    Const.size(context).width *
                                                        0.17948717948,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  child: Image.asset(
                                                    'assets/images/exSpa.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(),
                                              flex: 1,
                                            ),
                                            Expanded(
                                              flex: 14,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          '2 x Chăm sóc da mặt',
                                                          style: StyleApp
                                                              .textStyle600(
                                                                  fontSize: 16,
                                                                  color: ColorApp
                                                                      .dark),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Transform.scale(
                                                                scale: 0.75,
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/svg/notiIcon.svg',
                                                                  color: ColorApp
                                                                      .dark500,
                                                                )),
                                                            Text(
                                                              ' 4/6/2023 - 15:35',
                                                              style: StyleApp
                                                                  .textStyle400(
                                                                      color: ColorApp
                                                                          .dark500,
                                                                      fontSize:
                                                                          14),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      '₫ 500.000',
                                                      textAlign: TextAlign.end,
                                                      style:
                                                          StyleApp.textStyle700(
                                                              fontSize: 16,
                                                              color: ColorApp
                                                                  .darkGreen),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  color: ColorApp.whiteF0,
                                )
                              ],
                            );
                          },
                          shrinkWrap: true,
                          itemCount: 3,
                          physics: NeverScrollableScrollPhysics(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: Const.size(context).width * 0.04615384615,
                              bottom: Const.size(context).width * 0.02615384615,
                              left: Const.size(context).width * 0.04615384615,
                              right: Const.size(context).width * 0.04615384615),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${language.phuongThucThanhToan}',
                                style: StyleApp.textStyle700(
                                    color: ColorApp.dark, fontSize: 16),
                              ),
                              SizedBox(
                                height:
                                    Const.size(context).width * 0.04615384615,
                              ),
                              Container(
                                color: ColorApp.whiteF0,
                                child: ExpansionTile(
                                  childrenPadding: EdgeInsets.symmetric(
                                      horizontal: Const.size(context).width *
                                          0.04615384615,
                                      vertical: Const.size(context).width *
                                          0.02615384615),
                                  expandedCrossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/svg/credit_card.svg'),
                                          Text(' ${language.theTinDung}'),
                                        ],
                                      ),
                                      Radio<int>(
                                        value: 0,
                                        activeColor: ColorApp.darkGreen,
                                        groupValue: selectedIndex,
                                        onChanged: (int? value) {
                                          setState(() {
                                            selectedIndex = value!;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  children: [
                                    Text(
                                      '${language.hoTen}',
                                      style: StyleApp.textStyle700(
                                          color: ColorApp.dark),
                                    ),
                                    SizedBox(
                                      height: Const.size(context).width *
                                          0.02615384615,
                                    ),
                                    InputText1(
                                      label: '',
                                      radius: 10,
                                    ),
                                    SizedBox(
                                      height: Const.size(context).width *
                                          0.02615384615,
                                    ),
                                    Text(
                                      '${language.soThe}',
                                      style: StyleApp.textStyle700(
                                          color: ColorApp.dark),
                                    ),
                                    SizedBox(
                                      height: Const.size(context).width *
                                          0.02615384615,
                                    ),
                                    InputText1(
                                      label: '',
                                      radius: 10,
                                    ),
                                    SizedBox(
                                      height: Const.size(context).width *
                                          0.02615384615,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 13,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${language.ngayHetHan}',
                                                  style: StyleApp.textStyle700(
                                                      color: ColorApp.dark),
                                                ),
                                                SizedBox(
                                                  height: Const.size(context)
                                                          .width *
                                                      0.02615384615,
                                                ),
                                                InputText1(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputformater: [
                                                    NoSpaceFormatter(),
                                                    ExpiryDateFormatter(),
                                                  ],
                                                  label: 'MM/YY',
                                                  radius: 10,
                                                ),
                                              ],
                                            )),
                                        Expanded(flex: 1, child: SizedBox()),
                                        Expanded(
                                            flex: 13,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'CVV',
                                                  style: StyleApp.textStyle700(
                                                      color: ColorApp.dark),
                                                ),
                                                SizedBox(
                                                  height: Const.size(context)
                                                          .width *
                                                      0.02615384615,
                                                ),
                                                InputText1(
                                                  label: '',
                                                  radius: 10,
                                                ),
                                              ],
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                color: ColorApp.whiteF0,
                                child: ExpansionTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/svg/logo_momo.svg'),
                                          Text(' ${language.viMomo}'),
                                        ],
                                      ),
                                      Radio<int>(
                                        value: 1,
                                        activeColor: ColorApp.darkGreen,
                                        groupValue: selectedIndex,
                                        onChanged: (int? value) {
                                          setState(() {
                                            selectedIndex = value!;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  children: [
                                    Text('data'),
                                    Text('data2'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                color: ColorApp.whiteF0,
                                child: ExpansionTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/svg/ttDiem.svg'),
                                          Text(
                                              ' ${language.thanhToanBangDiem}'),
                                        ],
                                      ),
                                      Radio<int>(
                                        value: 2,
                                        activeColor: ColorApp.darkGreen,
                                        groupValue: selectedIndex,
                                        onChanged: (int? value) {
                                          setState(() {
                                            selectedIndex = value!;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  children: [
                                    Text('data'),
                                    Text('data2'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    Const.size(context).width * 0.04615384615,
                              ),
                              Text(
                                '${language.thongtinLienHe}',
                                style: StyleApp.textStyle700(
                                    color: ColorApp.dark, fontSize: 16),
                              ),
                              SizedBox(
                                height:
                                    Const.size(context).width * 0.02615384615,
                              ),
                              InputText1(
                                widgetLabel: Row(
                                  children: [
                                    Text(
                                      '${language.hoTen}',
                                      style: StyleApp.textStyle500(
                                          color: ColorApp.dark500),
                                    ),
                                    Text(
                                      '*',
                                      style: StyleApp.textStyle500(
                                          color: Colors.red),
                                    ),
                                  ],
                                ),
                                label: '',
                                radius: 10,
                              ),
                              SizedBox(
                                height:
                                    Const.size(context).width * 0.02615384615,
                              ),
                              InputText1(
                                widgetLabel: Row(
                                  children: [
                                    Text(
                                      'Email',
                                      style: StyleApp.textStyle500(
                                          color: ColorApp.dark500),
                                    ),
                                    Text(
                                      '*',
                                      style: StyleApp.textStyle500(
                                          color: Colors.red),
                                    ),
                                  ],
                                ),
                                label: '',
                                radius: 10,
                              ),
                              SizedBox(
                                height:
                                    Const.size(context).width * 0.02615384615,
                              ),
                              InputText1(
                                widgetLabel: Row(
                                  children: [
                                    Text(
                                      '${language.soDienThoai}',
                                      style: StyleApp.textStyle500(
                                          color: ColorApp.dark500),
                                    ),
                                    Text(
                                      '*',
                                      style: StyleApp.textStyle500(
                                          color: Colors.red),
                                    ),
                                  ],
                                ),
                                label: '',
                                radius: 10,
                              ),
                              SizedBox(
                                height:
                                    Const.size(context).width * 0.02615384615,
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 24.0,
                                    height: 24.0,
                                    child: Checkbox(
                                      side: BorderSide(color: ColorApp.border),
                                        shape: CircleBorder(),

                                        activeColor: ColorApp.bottomBar,
                                        value: taoTKMoi,
                                        onChanged: (value) {
                                          setState(() {
                                            taoTKMoi = value;
                                          });
                                        }),
                                  ),
                                  Text(' ${language.taoTaiKhoanMoi}',style: StyleApp.textStyle500(color: ColorApp.dark500),)
                                ],
                              ),
                              SizedBox(
                                height:
                                Const.size(context).width * 0.02615384615,
                              ),
                              InputText2(
                                hasPass: true,
                                obscureText: true,
                                widgetLabel: Row(
                                  children: [
                                    Text(
                                      '${language.matKhau}',
                                      style: StyleApp.textStyle500(
                                          color: ColorApp.dark500),
                                    ),
                                    Text(
                                      '*',
                                      style: StyleApp.textStyle500(
                                          color: Colors.red),
                                    ),
                                  ],
                                ),
                                label: '',
                                radius: 10,
                              ),
                              SizedBox(
                                height:
                                Const.size(context).width * 0.02615384615,
                              ),
                              InputText2(
                                hasPass: true,
                                obscureText: true,
                                widgetLabel: Row(
                                  children: [
                                    Text(
                                      '${language.xacNhanMatKhau}',
                                      style: StyleApp.textStyle500(
                                          color: ColorApp.dark500),
                                    ),
                                    Text(
                                      '*',
                                      style: StyleApp.textStyle500(
                                          color: Colors.red),
                                    ),
                                  ],
                                ),
                                label: '',
                                radius: 10,
                              ),
                              SizedBox(
                                height:
                                Const.size(context).width * 0.06615384615,
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${language.tongThanhToan}',style: StyleApp.textStyle600(color: ColorApp.dark,fontSize: 16),),
                                      Text('₫ 3.820.000',style: StyleApp.textStyle700(color: ColorApp.dark500,fontSize: 12,decoration: TextDecoration.lineThrough),)
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Đã chọn 3 dịch vụ, giá đã bao gồm thuế',style: StyleApp.textStyle400(color: ColorApp.dark500,fontSize: 14),),
                                      Text('₫ ${Const.ConvertPrice.format(2500000)}',style: StyleApp.textStyle700(color: ColorApp.darkGreen,fontSize: 16,),)
                                    ],
                                  ),
                                  SizedBox(height: 30,),
                                  InkWell(
                                    onTap: (){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Thành công',style: StyleApp.textStyle500(),)));
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
                                          '${language.thanhToan.toUpperCase()}',
                                          style: StyleApp.textStyle700(color: ColorApp.dark),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
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
