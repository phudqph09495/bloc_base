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

class GoiDaDatScreen extends StatefulWidget {
  const GoiDaDatScreen({Key? key}) : super(key: key);

  @override
  State<GoiDaDatScreen> createState() => _GoiDaDatScreenState();
}

class _GoiDaDatScreenState extends State<GoiDaDatScreen> {
  List<ModelLocal2> listFilter = [
    ModelLocal2(
        name: 'Kiểm soát dầu, thu gọn lỗ chân lông',
        id: '200.000',
        value: true),
    ModelLocal2(
        name:
            'Dịch vụ gì đó tên dài rất dài mà phải xuống dòng abc njkf kvnjxv',
        id: '200.000'),
    ModelLocal2(name: 'Tiếp nước cho da', id: '₫ 200.000', value: true),
  ];
  List<ModelLocal2> listFilter2 = [
    ModelLocal2(name: 'Kiểm soát dầu, thu gọn lỗ chân lông', id: '200.000'),
    ModelLocal2(name: 'Tiếp nước cho da', id: '₫ 200.000'),
  ];
  TextEditingController ngay = TextEditingController();
  TextEditingController gio = TextEditingController();
  List<String> items = [
    'Chi nhánh 16A Lê Lợi - Lạng Sơn',
    'Chi nhánh gì đó tên dài rất dài mà phải xuống dòng - Hoàn Kiếm - Hà Nội',
    'Chi nhánh 16B Lê Lợi - Lạng Sơn'
  ];
  String? selectedDV;
  String? selectedCN;
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
                              const SizedBox(),
                              Text(
                                language.goiDaDat,
                                style: StyleApp.textStyle700(
                                    color: Colors.white, fontSize: 20),
                              ),
                              const SizedBox()
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
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
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
                  decoration: const BoxDecoration(
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
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25)))),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  width: Const.size(context).width * 0.9,
                                  decoration: BoxDecoration(
                                      color: ColorApp.whiteF0,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: Const.size(context).width *
                                            0.02615384615,
                                        bottom: Const.size(context).width *
                                            0.02615384615,
                                        left: Const.size(context).width *
                                            0.04615384615,
                                        right: Const.size(context).width *
                                            0.04615384615),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width:
                                              Const.size(context).width * 0.75,
                                          child: Text(
                                            'Combo Chăm Sóc Da Mặt + Gội Đầu Thảo Dược',
                                            style: StyleApp.textStyle600(
                                                color: ColorApp.dark,
                                                fontSize: 16),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          '₫ ${Const.ConvertPrice.format(1200000)}',
                                          style: StyleApp.textStyle700(
                                              color: ColorApp.bottomBar,
                                              fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/svg/notiIcon.svg'),
                                                Text(
                                                  '   6 buổi',
                                                  style: StyleApp.textStyle500(
                                                      color:
                                                          ColorApp.darkGreen),
                                                ),
                                                SizedBox(
                                                  width: Const.size(context)
                                                          .width *
                                                      0.03846153846,
                                                ),
                                                Text(
                                                  'Còn lại: 3 buổi',
                                                  style: StyleApp.textStyle500(
                                                      color:
                                                          ColorApp.darkGreen),
                                                )
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () {
                                                showModalBottomSheet(
                                                    context: context,
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(12),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      12)),
                                                    ),
                                                    isScrollControlled: true,
                                                    builder:
                                                        (BuildContext context) {
                                                      return StatefulBuilder(
                                                          builder: (BuildContext
                                                                  context,
                                                              StateSetter
                                                                  setState1) {
                                                        return Container(
                                                          decoration: const BoxDecoration(
                                                              borderRadius: BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          12),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          12))),
                                                          height: Const.size(
                                                                      context)
                                                                  .height *
                                                              0.82231852654,
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child: const Icon(
                                                                            Icons.clear),
                                                                      ),
                                                                      Text(
                                                                        language
                                                                            .datLich,
                                                                        style: StyleApp.textStyle700(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                ColorApp.dark),
                                                                      ),
                                                                      const SizedBox()
                                                                    ],
                                                                  ),
                                                                  const Divider(),
                                                                  SizedBox(
                                                                    height: Const.size(context)
                                                                            .width *
                                                                        0.0241025641,
                                                                  ),
                                                                  Text(
                                                                    language
                                                                        .chiNhanh,
                                                                    style: StyleApp
                                                                        .textStyle700(
                                                                            color:
                                                                                ColorApp.dark),
                                                                  ),
                                                                  SizedBox(
                                                                    height: Const.size(context)
                                                                            .width *
                                                                        0.0241025641,
                                                                  ),
                                                                  DropdownButtonFormField2(
                                                                    isExpanded:
                                                                        true,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          ColorApp
                                                                              .greyF9,
                                                                      //Add isDense true and zero Padding.
                                                                      //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                                                      isDense:
                                                                          true,
                                                                      contentPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      border: OutlineInputBorder(
                                                                          borderSide: BorderSide
                                                                              .none,
                                                                          borderRadius:
                                                                              BorderRadius.circular(12)),
                                                                    ),
                                                                    buttonStyleData:
                                                                        ButtonStyleData(
                                                                      height: Const.size(context)
                                                                              .width *
                                                                          0.1282051282,
                                                                      padding: EdgeInsets.only(
                                                                          left: Const.size(context).width *
                                                                              0.02846153846,
                                                                          right:
                                                                              Const.size(context).width * 0.01846153846),
                                                                    ),

                                                                    //Ad

                                                                    hint: Text(
                                                                      language
                                                                          .chonChiNhanh,
                                                                      style: StyleApp
                                                                          .textStyle500(
                                                                        fontSize:
                                                                            14,
                                                                        color: ColorApp
                                                                            .dark500,
                                                                      ),
                                                                    ),
                                                                    items: items
                                                                        .map((item) =>
                                                                            DropdownMenuItem<String>(
                                                                              value: item,
                                                                              child: Text(
                                                                                item,
                                                                                style: StyleApp.textStyle500(
                                                                                  fontSize: 14,
                                                                                  color: ColorApp.dark500,
                                                                                ),
                                                                              ),
                                                                            ))
                                                                        .toList(),
                                                                    value:
                                                                        selectedCN,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState1(
                                                                          () {
                                                                        selectedCN =
                                                                            value
                                                                                as String;
                                                                      });
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    height: Const.size(context)
                                                                            .width *
                                                                        0.0541025641,
                                                                  ),
                                                                  Text(
                                                                    language
                                                                        .dichvu,
                                                                    style: StyleApp
                                                                        .textStyle700(
                                                                            color:
                                                                                ColorApp.dark),
                                                                  ),
                                                                  SizedBox(
                                                                    height: Const.size(context)
                                                                            .width *
                                                                        0.0241025641,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                          flex:
                                                                              5,
                                                                          child:
                                                                              ListView.builder(
                                                                            itemBuilder:
                                                                                (context, index) {
                                                                              return Padding(
                                                                                padding: const EdgeInsets.only(bottom: 5),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(15),
                                                                                    color: ColorApp.greyF9,
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Column(
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text('${listFilter2[index].name}'),
                                                                                              Text('₫ ${listFilter2[index].id}')
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        InkWell(
                                                                                            onTap: () {
                                                                                              for (var item in listFilter) {
                                                                                                if (listFilter2[index].name == item.name) {
                                                                                                  item.value = false;
                                                                                                }
                                                                                              }
                                                                                              listFilter2.removeAt(index);
                                                                                              setState1(() {});
                                                                                            },
                                                                                            child: const Icon(Icons.clear))
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                            itemCount:
                                                                                listFilter2.length,
                                                                            shrinkWrap:
                                                                                true,
                                                                            physics:
                                                                                const NeverScrollableScrollPhysics(),
                                                                          )),
                                                                      Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () {
                                                                              showModalBottomSheet(
                                                                                  context: context,
                                                                                  builder: (BuildContext context) {
                                                                                    return StatefulBuilder(builder: (BuildContext context, StateSetter setState2) {
                                                                                      return SizedBox(
                                                                                        height: Const.size(context).height * 0.8,
                                                                                        child: SingleChildScrollView(
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsets.all(8.0),
                                                                                            child: Column(
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    InkWell(
                                                                                                      onTap: () {
                                                                                                        Navigator.pop(context);
                                                                                                      },
                                                                                                      child: const Icon(Icons.clear),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      language.dichvu,
                                                                                                      style: StyleApp.textStyle700(fontSize: 18, color: ColorApp.dark),
                                                                                                    ),
                                                                                                    const SizedBox()
                                                                                                  ],
                                                                                                ),
                                                                                                const Divider(),
                                                                                                ListView.builder(
                                                                                                  itemBuilder: (context, index) {
                                                                                                    return Padding(
                                                                                                      padding: const EdgeInsets.only(bottom: 5),
                                                                                                      child: Container(
                                                                                                        width: double.infinity,
                                                                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: ColorApp.greyF9),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsets.only(left: Const.size(context).width * 0.04615384615),
                                                                                                          child: CheckboxListTile(
                                                                                                            checkboxShape: const CircleBorder(),
                                                                                                            activeColor: Colors.green,
                                                                                                            controlAffinity: ListTileControlAffinity.trailing,
                                                                                                            contentPadding: EdgeInsets.zero,
                                                                                                            dense: true,
                                                                                                            title: Text(
                                                                                                              listFilter[index].name ?? '',
                                                                                                              style: StyleApp.textStyle500(),
                                                                                                            ),
                                                                                                            value: listFilter[index].value,
                                                                                                            onChanged: (value) {
                                                                                                              listFilter[index].value = value;
                                                                                                              listFilter2 = [];
                                                                                                              for (var item in listFilter) {
                                                                                                                if (item.value == true) {
                                                                                                                  listFilter2.add(item);
                                                                                                                }
                                                                                                              }
                                                                                                              setState2(() {});
                                                                                                              setState1(() {});
                                                                                                            },
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                  shrinkWrap: true,
                                                                                                  physics: const NeverScrollableScrollPhysics(),
                                                                                                  itemCount: listFilter.length,
                                                                                                )
                                                                                                // ListView.builder(
                                                                                                //   shrinkWrap: true,
                                                                                                //   physics:
                                                                                                //       NeverScrollableScrollPhysics(),
                                                                                                //   itemCount: listFilter
                                                                                                //       .length, // The number of RadioListTiles you want to display
                                                                                                //   itemBuilder:
                                                                                                //       (BuildContext
                                                                                                //               context,
                                                                                                //           int index) {
                                                                                                //     return Padding(
                                                                                                //       padding:
                                                                                                //           const EdgeInsets
                                                                                                //                   .only(
                                                                                                //               bottom:
                                                                                                //                   5),
                                                                                                //       child:
                                                                                                //           Container(
                                                                                                //         decoration: BoxDecoration(
                                                                                                //             color: ColorApp
                                                                                                //                 .grey8B
                                                                                                //                 .withOpacity(
                                                                                                //                     0.1),
                                                                                                //             borderRadius:
                                                                                                //                 BorderRadius.circular(
                                                                                                //                     15)),
                                                                                                //         child:
                                                                                                //             Padding(
                                                                                                //           padding: const EdgeInsets
                                                                                                //                   .symmetric(
                                                                                                //               horizontal:
                                                                                                //                   5),
                                                                                                //           child:
                                                                                                //               RadioListTile<
                                                                                                //                   int>(
                                                                                                //             controlAffinity:
                                                                                                //                 ListTileControlAffinity
                                                                                                //                     .trailing,
                                                                                                //             contentPadding:
                                                                                                //                 EdgeInsets
                                                                                                //                     .zero,
                                                                                                //             title:
                                                                                                //                 Text(
                                                                                                //               '${listFilter[index].name}',
                                                                                                //               style: StyleApp.textStyle600(
                                                                                                //                   color:
                                                                                                //                       ColorApp.dark500),
                                                                                                //             ),
                                                                                                //             value:
                                                                                                //                 index,
                                                                                                //             activeColor:
                                                                                                //                 ColorApp
                                                                                                //                     .darkGreen,
                                                                                                //             groupValue:
                                                                                                //                 selectedIndex,
                                                                                                //             onChanged:
                                                                                                //                 (int?
                                                                                                //                     value) {
                                                                                                //               setState(
                                                                                                //                   () {
                                                                                                //                 selectedIndex =
                                                                                                //                     value!;
                                                                                                //               });
                                                                                                //               dichVu
                                                                                                //                   .text = listFilter[
                                                                                                //                       index]
                                                                                                //                   .name
                                                                                                //                   .toString();
                                                                                                //             },
                                                                                                //           ),
                                                                                                //         ),
                                                                                                //       ),
                                                                                                //     );
                                                                                                //   },
                                                                                                // ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    });
                                                                                  });
                                                                            },
                                                                            child:
                                                                                const Padding(
                                                                              padding: EdgeInsets.symmetric(vertical: 5),
                                                                              child: Icon(Icons.keyboard_arrow_down_rounded),
                                                                            ),
                                                                          ))
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: Const.size(context)
                                                                            .width *
                                                                        0.0541025641,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Expanded(
                                                                          flex:
                                                                              10,
                                                                          child:
                                                                              Text(
                                                                            language.ngayThucHien,
                                                                            style:
                                                                                StyleApp.textStyle700(color: ColorApp.dark500),
                                                                          )),
                                                                      const Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            SizedBox(),
                                                                      ),
                                                                      Expanded(
                                                                          flex:
                                                                              10,
                                                                          child:
                                                                              Text(
                                                                            language.gioGoiY,
                                                                            style:
                                                                                StyleApp.textStyle700(color: ColorApp.dark500),
                                                                          ))
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: Const.size(context)
                                                                            .width *
                                                                        0.0241025641,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Expanded(
                                                                          flex:
                                                                              10,
                                                                          child:
                                                                              InputText1(
                                                                            onTap:
                                                                                () {
                                                                              DatePicker.showDatePicker(context, currentTime: DateTime.now(), locale: language.codeNow == 'en' ? LocaleType.en : LocaleType.vi, onConfirm: (date) {
                                                                                ngay.text = Const.formatTime(
                                                                                  date.millisecondsSinceEpoch,
                                                                                  format: 'dd/MM/yyyy',
                                                                                );
                                                                              });
                                                                            },
                                                                            controller:
                                                                                ngay,
                                                                            label:
                                                                                '${Const.formatTime(DateTime.now().millisecondsSinceEpoch, format: 'dd/MM/yyyy')}',
                                                                            colorBg:
                                                                                ColorApp.greyF9,
                                                                            radius:
                                                                                12,
                                                                            readOnly:
                                                                                true,
                                                                          )),
                                                                      const Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            SizedBox(),
                                                                      ),
                                                                      Expanded(
                                                                          flex:
                                                                              10,
                                                                          child:
                                                                              InputText1(
                                                                            onTap:
                                                                                () {
                                                                              DatePicker.showTimePicker(context, currentTime: DateTime.now(), locale: language.codeNow == 'en' ? LocaleType.en : LocaleType.vi, onConfirm: (date) {
                                                                                gio.text = Const.formatTime(
                                                                                  date.millisecondsSinceEpoch,
                                                                                  format: 'HH:mm',
                                                                                );
                                                                              }, showSecondsColumn: false);
                                                                            },
                                                                            controller:
                                                                                gio,
                                                                            label:
                                                                                '${Const.formatTime(DateTime.now().millisecondsSinceEpoch, format: 'HH:mm')}',
                                                                            colorBg:
                                                                                ColorApp.greyF9,
                                                                            radius:
                                                                                12,
                                                                            readOnly:
                                                                                true,
                                                                          ))
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: Const.size(context)
                                                                            .width *
                                                                        0.0541025641,
                                                                  ),
                                                                  Text(
                                                                    language
                                                                        .yeuCauDacBiet,
                                                                    style: StyleApp
                                                                        .textStyle700(
                                                                            color:
                                                                                ColorApp.dark),
                                                                  ),
                                                                  SizedBox(
                                                                    height: Const.size(context)
                                                                            .width *
                                                                        0.0241025641,
                                                                  ),
                                                                  InputText1(
                                                                    label: '',
                                                                    maxLine: 5,
                                                                    colorBg:
                                                                        ColorApp
                                                                            .greyF9,
                                                                  ),
                                                                  SizedBox(
                                                                    height: Const.size(context)
                                                                            .width *
                                                                        0.0541025641,
                                                                  ),
                                                                  DottedBorder(
                                                                      borderType:
                                                                          BorderType
                                                                              .RRect,
                                                                      radius:
                                                                          const Radius.circular(
                                                                              15),
                                                                      color: ColorApp
                                                                          .bottomBar,
                                                                      dashPattern: const [
                                                                        5,
                                                                        1
                                                                      ],
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(3),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsets.all(Const.size(context).width * 0.03),
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  SvgPicture.asset('assets/svg/discount2.svg'),
                                                                                  Text(
                                                                                    '   ${language.maGiamGia}',
                                                                                    style: StyleApp.textStyle700(color: ColorApp.dark500, fontSize: 13),
                                                                                  ),
                                                                                  const SizedBox(),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsets.only(right: Const.size(context).width * 0.05277777777),
                                                                              child: const FaIcon(
                                                                                FontAwesomeIcons.arrowRightLong,
                                                                                size: 16,
                                                                                color: ColorApp.bottomBar,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )),
                                                                  SizedBox(
                                                                      height: Const.size(context)
                                                                              .width *
                                                                          0.0541025641),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            language.tongThanhToan,
                                                                            style:
                                                                                StyleApp.textStyle500(color: ColorApp.dark500),
                                                                          ),
                                                                          Text(
                                                                            '₫ 400.000',
                                                                            style:
                                                                                StyleApp.textStyle700(color: ColorApp.darkGreen),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              shape: const RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.only(
                                                                                  topLeft: Radius.circular(12),
                                                                                  topRight: Radius.circular(12),
                                                                                ),
                                                                              ),
                                                                              context: context,
                                                                              builder: (BuildContext context) {
                                                                                return Container(
                                                                                  height: MediaQuery.of(context).size.height * 0.75,
                                                                                  decoration: const BoxDecoration(
                                                                                      borderRadius: BorderRadius.only(
                                                                                    topLeft: Radius.circular(12),
                                                                                    topRight: Radius.circular(12),
                                                                                  )),
                                                                                  child: SingleChildScrollView(
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                      child: Column(
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              InkWell(
                                                                                                onTap: () {
                                                                                                  Navigator.pop(context);
                                                                                                },
                                                                                                child: const Icon(Icons.clear),
                                                                                              ),
                                                                                              const SizedBox()
                                                                                            ],
                                                                                          ),
                                                                                          SizedBox(height: Const.size(context).width * 0.1),
                                                                                          Text(
                                                                                            language.daThemVaoGioHang,
                                                                                            style: StyleApp.textStyle700(color: ColorApp.dark, fontSize: 20),
                                                                                          ),
                                                                                          SizedBox(height: Const.size(context).width * 0.11),
                                                                                          SvgPicture.asset('assets/svg/datLichTC.svg'),
                                                                                          SizedBox(height: Const.size(context).width * 0.08),
                                                                                          Text(
                                                                                            language.banDaThem,
                                                                                            style: StyleApp.textStyle500(color: ColorApp.dark500),
                                                                                            textAlign: TextAlign.center,
                                                                                          ),
                                                                                          SizedBox(height: Const.size(context).width * 0.03),
                                                                                          Text(
                                                                                            language.camOnBan,
                                                                                            style: StyleApp.textStyle500(color: ColorApp.dark500),
                                                                                          ),
                                                                                          SizedBox(height: Const.size(context).width * 0.18),
                                                                                          Container(
                                                                                            height: MediaQuery.of(context).size.height * 0.065,
                                                                                            alignment: Alignment.center,
                                                                                            decoration: BoxDecoration(
                                                                                              color: ColorApp.orange,
                                                                                              borderRadius: BorderRadius.circular(20),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsets.symmetric(vertical: Const.size(context).width * 0.02615384615),
                                                                                              child: Text(
                                                                                                language.thanhToan.toUpperCase(),
                                                                                                style: StyleApp.textStyle700(color: ColorApp.dark),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          SizedBox(height: Const.size(context).width * 0.03),
                                                                                          Container(
                                                                                            height: MediaQuery.of(context).size.height * 0.065,
                                                                                            alignment: Alignment.center,
                                                                                            decoration: BoxDecoration(
                                                                                              color: ColorApp.bottomBar,
                                                                                              borderRadius: BorderRadius.circular(20),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsets.symmetric(
                                                                                                vertical: Const.size(context).width * 0.02615384615,
                                                                                              ),
                                                                                              child: Text(
                                                                                                language.timDVKhac.toUpperCase(),
                                                                                                style: StyleApp.textStyle700(color: Colors.white),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              });
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          decoration: BoxDecoration(
                                                                              color: ColorApp.yellow,
                                                                              borderRadius: BorderRadius.circular(20)),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.symmetric(
                                                                              vertical: Const.size(context).width * 0.04615384615,
                                                                              horizontal: Const.size(context).width * 0.08615384615,
                                                                            ),
                                                                            child:
                                                                                Text(
                                                                              language.datLich.toUpperCase(),
                                                                              style: StyleApp.textStyle700(color: ColorApp.dark),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                    });
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: index % 2 == 1
                                                        ? ColorApp.bottomBar
                                                        : ColorApp.orange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical:
                                                          Const.size(context)
                                                                  .width *
                                                              0.02615384615,
                                                      horizontal:
                                                          Const.size(context)
                                                                  .width *
                                                              0.04615384615),
                                                  child: Text(
                                                    index % 2 == 1
                                                        ? language.datLich
                                                        : language.datThem,
                                                    style:
                                                        StyleApp.textStyle700(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 5,
                                  color: Colors.white,
                                )
                              ],
                            );
                          },
                          shrinkWrap: true,
                          itemCount: 3,
                          physics: const NeverScrollableScrollPhysics(),
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
      return const Scaffold();
    });
  }
}
