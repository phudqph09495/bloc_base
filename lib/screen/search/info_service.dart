import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:read_more_less/read_more_less.dart';

import '../../bloc/language/bloc_lang.dart';
import '../../bloc/state_bloc.dart';
import '../../config/const.dart';
import '../../model/model_local.dart';
import '../../styles/init_style.dart';
import '../../widget/item/input/text_filed.dart';
import '../../widget/item/load_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Info_Service extends StatefulWidget {
  const Info_Service({Key? key}) : super(key: key);

  @override
  State<Info_Service> createState() => _Info_ServiceState();
}

class _Info_ServiceState extends State<Info_Service> {
  TextEditingController dichVu = TextEditingController();
  bool ttdv = true;
  int selectedIndex = -1;
  int constLength = 3;
  TextEditingController ngay = TextEditingController();
  TextEditingController gio = TextEditingController();
  List<String> items = [
    'Chi nhánh 16A Lê Lợi - Lạng Sơn',
    'Chi nhánh gì đó tên dài rất dài mà phải xuống dòng - Hoàn Kiếm - Hà Nội',
    'Chi nhánh 16B Lê Lợi - Lạng Sơn'
  ];
  String? selectedDV;
  String? selectedCN;

  List<ModelLocal2> listFilter = [
    ModelLocal2(name: 'Kiểm soát dầu, thu gọn lỗ chân lông', id: '200.000'),
    ModelLocal2(
        name:
            'Dịch vụ gì đó tên dài rất dài mà phải xuống dòng abc njkf kvnjxv',
        id: '200.000'),
    ModelLocal2(name: 'Tiếp nước cho da', id: '₫ 200.000'),
  ];
  List<ModelLocal2> listFilter2 = [];
  List<ModelLocal2> checkListItems = [
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Trị liệu thâm nám',
      id: '2',
    ),
    ModelLocal2(
      name: 'Liệu trình tắm trắng',
      id: '3',
    ),
    ModelLocal2(
      name: 'Liệu trình giảm cân',
      id: '4',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
  ];
  List<ModelLocal2> checkListItems2 = [
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Trị liệu thâm námàdasf àiasjf à ấ fasfasjfas fas jfpasjf ậ',
      id: '2',
    ),
    ModelLocal2(
      name: 'Liệu trình tắm trắng',
      id: '3',
    ),
    ModelLocal2(
      name: 'Liệu trình giảm cân',
      id: '4',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLang, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language lang = state.data;
        return Scaffold(
          bottomSheet: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Const.size(context).width * 0.01, vertical: 5),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState) {
                              return Container(
                                height: Const.size(context).height * 0.8,
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
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
                                              '${lang.muaGoi}',
                                              style: StyleApp.textStyle700(
                                                  fontSize: 18,
                                                  color: ColorApp.dark),
                                            ),
                                            SizedBox()
                                          ],
                                        ),
                                        Divider(),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount:
                                              3, // The number of RadioListTiles you want to display
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 5),
                                              decoration: BoxDecoration(
                                                  color: ColorApp.greyF9),
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                    Const.size(context).width *
                                                        0.05),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                            width: Const.size(
                                                                        context)
                                                                    .width *
                                                                0.63,
                                                            child: Text(
                                                              'Combo Chăm Sóc Da Mặt + Gội Đầu Thảo Dược',
                                                              style: StyleApp
                                                                  .textStyle700(
                                                                      color: ColorApp
                                                                          .dark,
                                                                      fontSize:
                                                                          16),
                                                            )),
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  ColorApp.pink,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12)),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical: 6,
                                                                    horizontal:
                                                                        9),
                                                            child: Text(
                                                              '-78%',
                                                              style: StyleApp
                                                                  .textStyle700(
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          Const.size(context)
                                                                  .width *
                                                              0.023,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              '₫ 400.000 ',
                                                              style: StyleApp.textStyle700(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough,
                                                                  color: ColorApp
                                                                      .dark500),
                                                            ),
                                                            Text(
                                                              '₫ 200.000',
                                                              style: StyleApp
                                                                  .textStyle700(
                                                                      color: ColorApp
                                                                          .darkGreen),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Transform.scale(
                                                                scale: 0.8,
                                                                child: SvgPicture
                                                                    .asset(
                                                                        'assets/svg/notiIcon.svg')),
                                                            Text(
                                                              '  6 buổi',
                                                              style: StyleApp
                                                                  .textStyle700(
                                                                      color: ColorApp
                                                                          .darkGreen,
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          Const.size(context)
                                                                  .width *
                                                              0.023,
                                                    ),
                                                    Text(
                                                      'Tấm Home Spa - Combo Chăm Sóc Da Mặt + Gội Đầu Thảo Dược. Voucher 550,000 VNĐ, Còn 119,000 VNĐ, Giảm 78%.',
                                                      style:
                                                          StyleApp.textStyle500(
                                                              color: ColorApp
                                                                  .dark500),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          Const.size(context)
                                                                  .width *
                                                              0.033,
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                          color: ColorApp
                                                              .bottomBar,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12)),
                                                      child: Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            vertical: Const.size(
                                                                        context)
                                                                    .width *
                                                                0.03),
                                                        child: Text(
                                                          '${lang.muaGoi}',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: StyleApp
                                                              .textStyle700(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                          });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.065,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: ColorApp.bottomBar,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                Const.size(context).width * 0.02615384615),
                        child: Text(
                          '${lang.muaGoi}',
                          style: StyleApp.textStyle700(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12)),
                          ),
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState1) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        topLeft: Radius.circular(12))),
                                height:
                                    Const.size(context).height * 0.82231852654,
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                              '${lang.datLich}',
                                              style: StyleApp.textStyle700(
                                                  fontSize: 18,
                                                  color: ColorApp.dark),
                                            ),
                                            SizedBox()
                                          ],
                                        ),
                                        Divider(),
                                        SizedBox(
                                          height: Const.size(context).width *
                                              0.0241025641,
                                        ),
                                        Text(
                                          '${lang.chiNhanh}',
                                          style: StyleApp.textStyle700(
                                              color: ColorApp.dark),
                                        ),
                                        SizedBox(
                                          height: Const.size(context).width *
                                              0.0241025641,
                                        ),
                                        DropdownButtonFormField2(
                                          isExpanded: true,
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: ColorApp.greyF9,
                                              //Add isDense true and zero Padding.
                                              //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                              isDense: true,
                                              contentPadding: EdgeInsets.zero,
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12))),
                                          buttonStyleData: ButtonStyleData(
                                            height: Const.size(context).width *
                                                0.1282051282,
                                            padding: EdgeInsets.only(
                                                left:
                                                    Const.size(context).width *
                                                        0.02846153846,
                                                right:
                                                    Const.size(context).width *
                                                        0.01846153846),
                                          ),

                                          //Ad

                                          hint: Text(
                                            '${lang.chonChiNhanh}',
                                            style: StyleApp.textStyle500(
                                              fontSize: 14,
                                              color: ColorApp.dark500,
                                            ),
                                          ),
                                          items: items
                                              .map((item) =>
                                                  DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style:
                                                          StyleApp.textStyle500(
                                                        fontSize: 14,
                                                        color: ColorApp.dark500,
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                          value: selectedCN,
                                          onChanged: (value) {
                                            setState1(() {
                                              selectedCN = value as String;
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          height: Const.size(context).width *
                                              0.0541025641,
                                        ),
                                        Text(
                                          '${lang.dichvu}',
                                          style: StyleApp.textStyle700(
                                              color: ColorApp.dark),
                                        ),
                                        SizedBox(
                                          height: Const.size(context).width *
                                              0.0241025641,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                flex: 5,
                                                child: ListView.builder(
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 5),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius: BorderRadius.circular(15),color: ColorApp.greyF9),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                        '${listFilter2[index].name}'),
                                                                    Text(
                                                                        '₫ ${listFilter2[index].id}')
                                                                  ],
                                                                ),
                                                              ),
                                                              InkWell(
                                                                  onTap: () {
                                                                    for (var item
                                                                        in listFilter) {
                                                                      if (listFilter2[index]
                                                                              .name ==
                                                                          item.name) {
                                                                        item.value =
                                                                            false;
                                                                      }
                                                                    }
                                                                    listFilter2
                                                                        .removeAt(
                                                                            index);
                                                                    setState1(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                      Icons
                                                                          .clear))
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  itemCount: listFilter2.length,
                                                  shrinkWrap: true,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                )),
                                            Expanded(
                                                flex: 1,
                                                child: InkWell(
                                                  onTap: () {
                                                    showModalBottomSheet(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return StatefulBuilder(
                                                              builder: (BuildContext
                                                                      context,
                                                                  StateSetter
                                                                      setState2) {
                                                            return Container(
                                                              height: Const.size(
                                                                          context)
                                                                      .height *
                                                                  0.8,
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Icon(Icons.clear),
                                                                          ),
                                                                          Text(
                                                                            '${lang.dichvu}',
                                                                            style:
                                                                                StyleApp.textStyle700(fontSize: 18, color: ColorApp.dark),
                                                                          ),
                                                                          SizedBox()
                                                                        ],
                                                                      ),
                                                                      Divider(),
                                                                      ListView
                                                                          .builder(
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          return Padding(
                                                                            padding:
                                                                                EdgeInsets.only(bottom: 5),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: ColorApp.greyF9),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.only(left: Const.size(context).width * 0.04615384615),
                                                                                child: CheckboxListTile(
                                                                                  checkboxShape: CircleBorder(),
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
                                                                        shrinkWrap:
                                                                            true,
                                                                        physics:
                                                                            NeverScrollableScrollPhysics(),
                                                                        itemCount:
                                                                            listFilter.length,
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
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                                    child: Icon(Icons
                                                        .keyboard_arrow_down_rounded),
                                                  ),
                                                ))
                                          ],
                                        ),
                                        SizedBox(
                                          height: Const.size(context).width *
                                              0.0541025641,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                flex: 10,
                                                child: Text(
                                                  '${lang.ngayThucHien}',
                                                  style: StyleApp.textStyle700(
                                                      color: ColorApp.dark500),
                                                )),
                                            Expanded(
                                              child: SizedBox(),
                                              flex: 1,
                                            ),
                                            Expanded(
                                                flex: 10,
                                                child: Text(
                                                  '${lang.gioGoiY}',
                                                  style: StyleApp.textStyle700(
                                                      color: ColorApp.dark500),
                                                ))
                                          ],
                                        ),
                                        SizedBox(
                                          height: Const.size(context).width *
                                              0.0241025641,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                flex: 10,
                                                child: InputText1(
                                                  onTap: () {
                                                    DatePicker.showDatePicker(
                                                        context,
                                                        currentTime:
                                                            DateTime.now(),
                                                        locale:
                                                            lang.codeNow == 'en'
                                                                ? LocaleType.en
                                                                : LocaleType.vi,
                                                        onConfirm: (date) {
                                                      ngay.text = Const.formatTime(
                                                          date.millisecondsSinceEpoch,
                                                          format: 'dd/MM/yyyy');
                                                    });
                                                  },
                                                  controller: ngay,
                                                  label:
                                                      '${Const.formatTime(DateTime.now().millisecondsSinceEpoch, format: 'dd/MM/yyyy')}',
                                                  colorBg: ColorApp.greyF9,
                                                  radius: 12,
                                                  readOnly: true,
                                                )),
                                            Expanded(
                                              child: SizedBox(),
                                              flex: 1,
                                            ),
                                            Expanded(
                                                flex: 10,
                                                child: InputText1(
                                                  onTap: () {
                                                    DatePicker.showTimePicker(
                                                        context,
                                                        currentTime:
                                                            DateTime.now(),
                                                        locale:
                                                            lang.codeNow == 'en'
                                                                ? LocaleType.en
                                                                : LocaleType.vi,
                                                        onConfirm: (date) {
                                                      gio.text = Const.formatTime(
                                                          date.millisecondsSinceEpoch,
                                                          format: 'HH:mm');
                                                    },
                                                        showSecondsColumn:
                                                            false);
                                                  },
                                                  controller: gio,
                                                  label:
                                                      '${Const.formatTime(DateTime.now().millisecondsSinceEpoch, format: 'HH:mm')}',
                                                  colorBg: ColorApp.greyF9,
                                                  radius: 12,
                                                  readOnly: true,
                                                ))
                                          ],
                                        ),
                                        SizedBox(
                                          height: Const.size(context).width *
                                              0.0541025641,
                                        ),
                                        Text(
                                          '${lang.yeuCauDacBiet}',
                                          style: StyleApp.textStyle700(
                                              color: ColorApp.dark),
                                        ),
                                        SizedBox(
                                          height: Const.size(context).width *
                                              0.0241025641,
                                        ),
                                        InputText1(
                                          label: '',
                                          maxLine: 5,
                                          colorBg: ColorApp.greyF9,
                                        ),
                                        SizedBox(
                                          height: Const.size(context).width *
                                              0.0541025641,
                                        ),
                                        DottedBorder(
                                            borderType: BorderType.RRect,
                                            radius: const Radius.circular(15),
                                            color: ColorApp.bottomBar,
                                            dashPattern: const [5, 1],
                                            child: Padding(
                                              padding: EdgeInsets.all(3),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.all(
                                                        Const.size(context)
                                                                .width *
                                                            0.03),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SvgPicture.asset(
                                                            'assets/svg/discount2.svg'),
                                                        Text(
                                                          '   ${lang.maGiamGia}',
                                                          style: StyleApp
                                                              .textStyle700(
                                                                  color: ColorApp
                                                                      .dark500,
                                                                  fontSize: 13),
                                                        ),
                                                        SizedBox(),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right:
                                                            Const.size(context)
                                                                    .width *
                                                                0.05277777777),
                                                    child: FaIcon(
                                                      FontAwesomeIcons
                                                          .arrowRightLong,
                                                      size: 16,
                                                      color: ColorApp.bottomBar,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                        SizedBox(
                                          height: Const.size(context).width *
                                              0.0541025641,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${lang.tongThanhToan}',
                                                  style: StyleApp.textStyle500(
                                                      color: ColorApp.dark500),
                                                ),
                                                Text(
                                                  '₫ 400.000',
                                                  style: StyleApp.textStyle700(
                                                      color:
                                                          ColorApp.darkGreen),
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () {
                                                showModalBottomSheet(
                                                  isScrollControlled: true,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(
                                                              12),
                                                          topRight: Radius
                                                              .circular(
                                                              12)),
                                                    ),
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.75,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        12),
                                                                topRight: Radius
                                                                    .circular(
                                                                        12))),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap: (){
                                                                        Navigator.pop(context);
                                                                      },
                                                                      child: Icon(Icons
                                                                          .clear),
                                                                    ),
                                                                    SizedBox()
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    height: Const.size(context)
                                                                            .width *
                                                                        0.1),
                                                                Text(
                                                                  '${lang.daThemVaoGioHang}',
                                                                  style: StyleApp.textStyle700(
                                                                      color: ColorApp
                                                                          .dark,
                                                                      fontSize:
                                                                          20),
                                                                ),
                                                                SizedBox(
                                                                    height: Const.size(context)
                                                                            .width *
                                                                        0.11),
                                                                SvgPicture.asset(
                                                                    'assets/svg/datLichTC.svg'),
                                                                SizedBox(
                                                                    height: Const.size(context)
                                                                            .width *
                                                                        0.08),
                                                                Text(
                                                                  '${lang.banDaThem}',
                                                                  style: StyleApp
                                                                      .textStyle500(
                                                                          color:
                                                                              ColorApp.dark500),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                SizedBox(
                                                                    height: Const.size(context)
                                                                            .width *
                                                                        0.03),
                                                                Text(
                                                                  '${lang.camOnBan}',
                                                                  style: StyleApp
                                                                      .textStyle500(
                                                                          color:
                                                                              ColorApp.dark500),
                                                                ),
                                                                SizedBox(
                                                                    height: Const.size(context)
                                                                        .width *
                                                                        0.18),
                                                                Container(
                                                                  height: MediaQuery.of(context).size.height * 0.065,
                                                                  alignment: Alignment.center,
                                                                  decoration: BoxDecoration(
                                                                      color: ColorApp.orange,
                                                                      borderRadius: BorderRadius.circular(20)),
                                                                  child: Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        vertical:
                                                                        Const.size(context).width * 0.02615384615),
                                                                    child: Text(
                                                                      '${lang.thanhToan.toUpperCase()}',
                                                                      style: StyleApp.textStyle700(color: ColorApp.dark),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height: Const.size(context)
                                                                        .width *
                                                                        0.03),
                                                                Container(
                                                                  height: MediaQuery.of(context).size.height * 0.065,
                                                                  alignment: Alignment.center,
                                                                  decoration: BoxDecoration(
                                                                      color: ColorApp.bottomBar,
                                                                      borderRadius: BorderRadius.circular(20)),
                                                                  child: Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        vertical:
                                                                        Const.size(context).width * 0.02615384615),
                                                                    child: Text(
                                                                      '${lang.timDVKhac.toUpperCase()}',
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
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: ColorApp.yellow,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical:
                                                          Const.size(context)
                                                                  .width *
                                                              0.04615384615,
                                                      horizontal:
                                                          Const.size(context)
                                                                  .width *
                                                              0.08615384615),
                                                  child: Text(
                                                    '${lang.datLich.toUpperCase()}',
                                                    style:
                                                        StyleApp.textStyle700(
                                                            color:
                                                                ColorApp.dark),
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
                      height: MediaQuery.of(context).size.height * 0.065,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: ColorApp.orange,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                Const.size(context).width * 0.02615384615),
                        child: Text(
                          '${lang.datLichNgay}',
                          style: StyleApp.textStyle700(color: ColorApp.dark),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
              ),
              Stack(
                children: [
                  ImageSlideshow(
                    height: MediaQuery.of(context).size.height * 0.27,
                    width: double.infinity,
                    indicatorColor: ColorApp.dark,
                    isLoop: true,
                    autoPlayInterval: 2000,
                    children: List.generate(
                        3,
                        (index) => Image.asset(
                              'assets/images/exSpa.png',
                              fit: BoxFit.cover,
                            )),
                  ),
                  Positioned(
                    top: Const.size(context).width * 0.08064516129,
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
                              horizontal: 15, vertical: 8),
                          child: FaIcon(
                            FontAwesomeIcons.arrowLeftLong,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: Const.size(context).width * 0.08064516129,
                    right: 10,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: FaIcon(
                              FontAwesomeIcons.heart,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Icon(
                              Icons.share_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                height: MediaQuery.of(context).size.height * 0.7,
                top: MediaQuery.of(context).size.height * 0.25,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 0.2),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Const.size(context).width * 0.05,
                          horizontal: Const.size(context).width * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Chăm Sóc Da Mặt',
                            style: StyleApp.textStyle700(
                                color: ColorApp.dark, fontSize: 20),
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '₫ 400.000 ',
                                    style: StyleApp.textStyle700(
                                        decoration: TextDecoration.lineThrough,
                                        color: ColorApp.dark500),
                                  ),
                                  Text(
                                    '₫ 200.000',
                                    style: StyleApp.textStyle700(
                                        color: ColorApp.darkGreen),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.watch_later_rounded,
                                    color: ColorApp.dark500,
                                    size: 18,
                                  ),
                                  Text(
                                    '90 phút',
                                    style: StyleApp.textStyle500(
                                        color: ColorApp.dark500),
                                  )
                                ],
                              )
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  ttdv = true;
                                  setState(() {});
                                },
                                child: Text(
                                  '${lang.thongTinDichVu}',
                                  style: StyleApp.textStyle700(
                                      color: ttdv == true
                                          ? ColorApp.bottomBar
                                          : ColorApp.dark500),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  ttdv = false;
                                  setState(() {});
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      '${lang.danhGia}',
                                      style: StyleApp.textStyle700(
                                          color: ttdv == false
                                              ? ColorApp.bottomBar
                                              : ColorApp.dark500),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: ColorApp.yellow,
                                      size: 18,
                                    ),
                                    Text(
                                      '4.7',
                                      style: StyleApp.textStyle500(
                                          color: ColorApp.yellow),
                                    ),
                                    Text(
                                      ' (86)',
                                      style: StyleApp.textStyle500(
                                          color: ColorApp.dark500),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox()
                            ],
                          ),
                          Divider(),
                          ttdv == true
                              ? Column(
                                  children: [
                                    InputText1(
                                      radius: 12,
                                      controller: dichVu,
                                      label: '${lang.chonDV}',
                                      readOnly: true,
                                      hasSuffix: true,
                                      onTap: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return StatefulBuilder(builder:
                                                  (BuildContext context,
                                                      StateSetter setState) {
                                                return Container(
                                                  height: Const.size(context)
                                                          .height *
                                                      0.8,
                                                  child: SingleChildScrollView(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Icon(
                                                                    Icons
                                                                        .clear),
                                                              ),
                                                              Text(
                                                                '${lang.dichvu}',
                                                                style: StyleApp
                                                                    .textStyle700(
                                                                        fontSize:
                                                                            18,
                                                                        color: ColorApp
                                                                            .dark),
                                                              ),
                                                              SizedBox()
                                                            ],
                                                          ),
                                                          Divider(),
                                                          ListView.builder(
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            5),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      color: ColorApp
                                                                          .greyF9),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.only(
                                                                        left: Const.size(context).width *
                                                                            0.04615384615),
                                                                    child:
                                                                        CheckboxListTile(
                                                                      checkboxShape:
                                                                          CircleBorder(),
                                                                      activeColor:
                                                                          Colors
                                                                              .green,
                                                                      controlAffinity:
                                                                          ListTileControlAffinity
                                                                              .trailing,
                                                                      contentPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      dense:
                                                                          true,
                                                                      title:
                                                                          Text(
                                                                        listFilter[index].name ??
                                                                            '',
                                                                        style: StyleApp
                                                                            .textStyle500(),
                                                                      ),
                                                                      value: listFilter[
                                                                              index]
                                                                          .value,
                                                                      onChanged:
                                                                          (value) {
                                                                        listFilter[index].value =
                                                                            value;
                                                                        listFilter2 =
                                                                            [];
                                                                        for (var item
                                                                            in listFilter) {
                                                                          if (item.value ==
                                                                              true) {
                                                                            listFilter2.add(item);
                                                                          }
                                                                        }
                                                                        setState(
                                                                            () {
                                                                          // if (multipleSelected.contains(checkListItems[index])) {
                                                                          //   multipleSelected.remove(checkListItems[index]);
                                                                          // } else {
                                                                          //   multipleSelected.add(checkListItems[index]);
                                                                          // }
                                                                        });
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                listFilter
                                                                    .length,
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
                                      suffix: Icon(
                                          Icons.keyboard_arrow_down_rounded),
                                    ),
                                    SizedBox(
                                        height: Const.size(context).width *
                                            0.0406451612),
                                    ReadMoreLess(
                                      customButtonBuilder: (bool isCollapsed,
                                          VoidCallback onPressed) {
                                        return isCollapsed
                                            ? GestureDetector(
                                                onTap: onPressed,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      gradient: ColorApp
                                                          .linearGradientMain),
                                                  width: double.infinity,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(vertical: 5),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              '${lang.xemThem}',
                                                              style: StyleApp
                                                                  .textStyle400(
                                                                      color: ColorApp
                                                                          .bottomBar),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .keyboard_arrow_down,
                                                              color: ColorApp
                                                                  .bottomBar,
                                                              size: 16,
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox()
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : GestureDetector(
                                                onTap: onPressed,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      gradient: ColorApp
                                                          .linearGradientMain),
                                                  width: double.infinity,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              '${lang.thuNho}',
                                                              style: StyleApp
                                                                  .textStyle400(
                                                                      color: ColorApp
                                                                          .bottomBar),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .keyboard_arrow_up_rounded,
                                                              color: ColorApp
                                                                  .bottomBar,
                                                              size: 16,
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox()
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                      },
                                      text: '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur et lobortis erat. Sed vulputate elit lacinia justo tincidunt varius. Nam convallis semper magna, a volutpat turpis feugiat sed. Morbi ac ligula suscipit, lobortis arcu at, ornare justo. Maecenas vestibulum, eros et imperdiet egestas, tellus enim porttitor risus, sit amet tincidunt est neque nec arcu. Pellentesque egestas dolor vitae nisl varius, ut hendrerit nisl auctor. Morbi eget ex sapien. Donec congue sagittis ante, ac fermentum felis molestie at. Integer pharetra nec est at blandit. Nullam vestibulum at est id sollicitudin. Etiam maximus ipsum orci, nec placerat ligula pharetra vel. Curabitur rutrum justo et mauris eleifend, in tristique dolor molestie. Nullam ut sem quis orci dictum vestibulum eu ac sem. Nam eu consectetur lacus. Nulla ut elit sed urna condimentum efficitur.
''',
                                    ),
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListView.builder(
                                      itemCount: constLength,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      height:
                                                          Const.size(context)
                                                                  .width *
                                                              0.09692307692,
                                                      width: Const.size(context)
                                                              .width *
                                                          0.09692307692,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      80)),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(80),
                                                        child: LoadImage(
                                                          url:
                                                              'https://pbs.twimg.com/media/Fr8SLFzaEAE_skC?format=jpg&name=large',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    flex: 10,
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
                                                            Text(
                                                              'Quỳnh Anh',
                                                              style: StyleApp
                                                                  .textStyle700(
                                                                      color: ColorApp
                                                                          .dark),
                                                            ),
                                                            Text(
                                                              '4 ngày trước',
                                                              style: StyleApp
                                                                  .textStyle400(
                                                                      color: ColorApp
                                                                          .dark500),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: Const.size(
                                                                      context)
                                                                  .width *
                                                              0.01692307692,
                                                        ),
                                                        Row(
                                                          children: [
                                                            ...List.generate(
                                                                5,
                                                                (index) => Icon(
                                                                      Icons
                                                                          .star,
                                                                      size: 18,
                                                                      color: ColorApp
                                                                          .yellow,
                                                                    )),
                                                            Text(
                                                              '${lang.dichvu}: ',
                                                              style: StyleApp
                                                                  .textStyle400(
                                                                      color: ColorApp
                                                                          .dark500),
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                'Dịch vụ: Kiểm soát dầu, thu gọn lỗ chân lôngìa ầ pgkr fdgokdfgm dfogkdfgm dfgpdfkg,df ògjfdkg',
                                                                style: StyleApp
                                                                    .textStyle400(
                                                                        color: ColorApp
                                                                            .bottomBar),
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: Const.size(
                                                                      context)
                                                                  .width *
                                                              0.01692307692,
                                                        ),
                                                        Text(
                                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
                                                          style: StyleApp
                                                              .textStyle400(
                                                                  color: ColorApp
                                                                      .dark500),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Divider()
                                          ],
                                        );
                                      },
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        constLength = 10;
                                        lang.xemThem1 = lang.daHet;
                                        setState(() {});
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(),
                                              Row(
                                                children: [
                                                  Text(
                                                    '${lang.xemThem1}',
                                                    style:
                                                        StyleApp.textStyle400(
                                                            color: ColorApp
                                                                .bottomBar),
                                                  ),
                                                  Icon(
                                                    Icons.keyboard_arrow_down,
                                                    size: 16,
                                                    color: ColorApp.bottomBar,
                                                  )
                                                ],
                                              ),
                                              SizedBox(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.066,
                                    )
                                  ],
                                ),
                          SizedBox(
                            height: Const.size(context).width * 0.03,
                          ),
                          Text(
                            '${lang.dvKhac}',
                            style: StyleApp.textStyle700(
                                color: ColorApp.dark, fontSize: 16),
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.03,
                          ),
                          ListView.builder(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.066,
                                top: 15),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Info_Service()));
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                              height:
                                                  Const.size(context).width *
                                                      0.17948717948,
                                              width: Const.size(context).width *
                                                  0.21025641025,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.asset(
                                                  'assets/images/exSpa.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              )),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left:
                                                    Const.size(context).width *
                                                        0.02948717948),
                                            height: Const.size(context).width *
                                                0.17948717948,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Chăm sóc da mặt',
                                                  style: StyleApp.textStyle700(
                                                      color: ColorApp.dark),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '₫ 400.000 ',
                                                      style: StyleApp.textStyle700(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          color:
                                                              ColorApp.dark500),
                                                    ),
                                                    Text(
                                                      '₫ 200.000',
                                                      style:
                                                          StyleApp.textStyle700(
                                                              color: ColorApp
                                                                  .darkGreen),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: ColorApp.yellow,
                                                      size: 18,
                                                    ),
                                                    Text(
                                                      ' 4.5',
                                                      style:
                                                          StyleApp.textStyle500(
                                                              color: ColorApp
                                                                  .dark500),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: Const.size(context).width *
                                                0.17948717948,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  Icons.favorite,
                                                  size: 18,
                                                  color: index % 2 == 1
                                                      ? ColorApp.yellow
                                                      : ColorApp.dark500,
                                                ),
                                                Container(
                                                    decoration: BoxDecoration(
                                                        color:
                                                            ColorApp.bottomBar,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10,
                                                          vertical: 5),
                                                      child: Text(
                                                        '${lang.chiTiet}',
                                                        style: StyleApp
                                                            .textStyle700(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Divider()
                                  ],
                                ),
                              );
                            },
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }
      return Scaffold();
    });
  }
}
