import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import '../../../bloc/language/bloc_lang.dart';
import '../../../config/const.dart';
import '../../../model/model_local.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/appbar.dart';
import '../../../widget/item/button.dart';
import '../../../widget/item/input/bottom_sheet.dart';
import '../../../widget/item/input/text_filed.dart';

class BookedPackageScreen extends StatefulWidget {
  const BookedPackageScreen({Key? key}) : super(key: key);

  @override
  State<BookedPackageScreen> createState() => _BookedPackageScreenState();
}

class _BookedPackageScreenState extends State<BookedPackageScreen> {
  int selectedIndex = 0;
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
  TextEditingController ngayController = TextEditingController();
  TextEditingController gioController = TextEditingController();
  TextEditingController brachController = TextEditingController();
  List<String> items = [
    'Chi nhánh 16A Lê Lợi - Lạng Sơn',
    'Chi nhánh gì đó tên dài rất dài mà phải xuống dòng - Hoàn Kiếm - Hà Nội',
    'Chi nhánh 16B Lê Lợi - Lạng Sơn'
  ];
  String? selectedDV;
  String? selectedCN;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLanguage, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: Scaffold(
            backgroundColor: ColorApp.darkGreen,
            appBar: AppBarWidget(title: language.goiDaDat),
            body: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.separated(
                      separatorBuilder: (context, index) => const Gap(5),
                      padding:
                          const EdgeInsets.only(top: 18, left: 18, right: 18),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: ColorApp.backgroundF5F6EE,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: Const.size(context).width * 0.75,
                                      child: Text(
                                        'Combo Chăm Sóc Da Mặt + Gội Đầu Thảo Dược',
                                        style: StyleApp.textStyle600(
                                            color: ColorApp.dark252525,
                                            fontSize: 16),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      '₫ ${Const.ConvertPrice.format(1200000)}',
                                      style: StyleApp.textStyle700(
                                          color: ColorApp.bottomBarABCA74,
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
                                                  color: ColorApp.darkGreen),
                                            ),
                                            SizedBox(
                                              width: Const.size(context).width *
                                                  0.03846153846,
                                            ),
                                            Text(
                                              'Còn lại: 3 buổi',
                                              style: StyleApp.textStyle500(
                                                  color: ColorApp.darkGreen),
                                            )
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {
                                            _bookingCalendaBottomSheet(
                                                context, language);
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: index % 2 == 1
                                                    ? ColorApp.bottomBarABCA74
                                                    : ColorApp.yellow,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: Const.size(context)
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
                                                style: StyleApp.textStyle700(
                                                    color: Colors.white),
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
                          ],
                        );
                      },
                      shrinkWrap: true,
                      itemCount: 10,
                      physics: const ScrollPhysics(),
                    ),
                    const Gap(20)
                  ],
                ),
              ),
            ),
          ),
        );
      }
      return const Scaffold();
    });
  }

  Future<dynamic> _bookingCalendaBottomSheet(
      BuildContext context, Language language) {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), topLeft: Radius.circular(12)),
        ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState1) {
            return Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12))),
              height: Const.size(context).height * 0.82231852654,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            language.datLich,
                            style: StyleApp.textStyle700(
                                fontSize: 18, color: ColorApp.dark252525),
                          ),
                          const SizedBox()
                        ],
                      ),
                      const Divider(),
                      SizedBox(
                        height: Const.size(context).width * 0.0241025641,
                      ),
                      Text(
                        language.chiNhanh,
                        style:
                            StyleApp.textStyle700(color: ColorApp.dark252525),
                      ),
                      SizedBox(
                        height: Const.size(context).width * 0.0241025641,
                      ),
                      InputText1(
                        borderColor: ColorApp.backgroundF9F9F4,
                        colorBg: ColorApp.backgroundF9F9F4,
                        radius: 12,
                        controller: brachController,
                        label: language.chonChiNhanh,
                        readOnly: true,
                        hasSuffix: true,
                        onTap: () {
                          BottomSheetInforService.selecteRadioBottomSheet(
                              context,
                              language.chiNhanh,
                              listFilter,
                              selectedIndex,
                              brachController);
                        },
                        suffix: const Icon(Icons.keyboard_arrow_down_rounded),
                      ),
                      // InkWell(
                      //   onTap: () =>
                      //       BottomSheetInforService.selecteRadioBottomSheet(
                      //           context,
                      //           language.chiNhanh,
                      //           listFilter,
                      //           selectedIndex,
                      //           brachController),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(15),
                      //       color: ColorApp.backgroundF9F9F4,
                      //     ),
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(14),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Expanded(
                      //               child: Text(
                      //             language.chonChiNhanh,
                      //             style: StyleApp.textStyle500(
                      //               fontSize: 14,
                      //               color: ColorApp.dark500,
                      //             ),
                      //           )),
                      //           const Icon(Icons.keyboard_arrow_down_rounded)
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: Const.size(context).width * 0.0541025641,
                      ),
                      Text(
                        language.dichvu,
                        style:
                            StyleApp.textStyle700(color: ColorApp.dark252525),
                      ),
                      SizedBox(
                        height: Const.size(context).width * 0.0241025641,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 5,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: ColorApp.backgroundF9F9F4,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                  for (var item in listFilter) {
                                                    if (listFilter2[index]
                                                            .name ==
                                                        item.name) {
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
                                itemCount: listFilter2.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                              )),
                          Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  _serviceBottomSheet(
                                      context, language, setState1);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child:
                                      Icon(Icons.keyboard_arrow_down_rounded),
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: Const.size(context).width * 0.0541025641,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 10,
                              child: Text(
                                language.ngayThucHien,
                                style: StyleApp.textStyle700(
                                    color: ColorApp.dark500),
                              )),
                          const Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                              flex: 10,
                              child: Text(
                                language.gioGoiY,
                                style: StyleApp.textStyle700(
                                    color: ColorApp.dark500),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: Const.size(context).width * 0.0241025641,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: InputText1(
                            onTap: () {
                              // DatePicker.showDatePicker(context,
                              //     currentTime: DateTime.now(),
                              //     locale: language.codeNow == 'en'
                              //         ? LocaleType.en
                              //         : LocaleType.vi, onConfirm: (date) {
                              //   ngayController.text = Const.formatTime(
                              //     date.millisecondsSinceEpoch,
                              //     format: 'dd/MM/yyyy',
                              //   );
                              // });
                            },
                            controller: ngayController,
                            label:
                                '${Const.formatTime(DateTime.now().millisecondsSinceEpoch, format: 'dd/MM/yyyy')}',
                            colorBg: ColorApp.backgroundF9F9F4,
                            borderColor: ColorApp.backgroundF9F9F4,
                            radius: 12,
                            readOnly: true,
                          )),
                          const Gap(10),
                          Expanded(
                              child: InputText1(
                            onTap: () {
                              // DatePicker.showTimePicker(context,
                              //     currentTime: DateTime.now(),
                              //     locale: language.codeNow == 'en'
                              //         ? LocaleType.en
                              //         : LocaleType.vi, onConfirm: (date) {
                              //   gioController.text = Const.formatTime(
                              //     date.millisecondsSinceEpoch,
                              //     format: 'HH:mm',
                              //   );
                              // }, showSecondsColumn: false);
                            },
                            controller: gioController,
                            label:
                                '${Const.formatTime(DateTime.now().millisecondsSinceEpoch, format: 'HH:mm')}',
                            borderColor: ColorApp.backgroundF9F9F4,
                            colorBg: ColorApp.backgroundF9F9F4,
                            radius: 12,
                            readOnly: true,
                          ))
                        ],
                      ),
                      SizedBox(
                        height: Const.size(context).width * 0.0541025641,
                      ),
                      Text(
                        language.yeuCauDacBiet,
                        style:
                            StyleApp.textStyle700(color: ColorApp.dark252525),
                      ),
                      SizedBox(
                        height: Const.size(context).width * 0.0241025641,
                      ),
                      InputText1(
                        label: '',
                        maxLine: 5,
                        borderColor: ColorApp.backgroundF9F9F4,
                        colorBg: ColorApp.backgroundF9F9F4,
                      ),
                      SizedBox(
                        height: Const.size(context).width * 0.0541025641,
                      ),
                      DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(15),
                          color: ColorApp.bottomBarABCA74,
                          dashPattern: const [5, 1],
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(
                                      Const.size(context).width * 0.03),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/svg/discount2.svg'),
                                      Text(
                                        '   ${language.maGiamGia}',
                                        style: StyleApp.textStyle700(
                                            color: ColorApp.dark500,
                                            fontSize: 13),
                                      ),
                                      const SizedBox(),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: Const.size(context).width *
                                          0.05277777777),
                                  child: const FaIcon(
                                    FontAwesomeIcons.arrowRightLong,
                                    size: 16,
                                    color: ColorApp.bottomBarABCA74,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                          height: Const.size(context).width * 0.0541025641),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                language.tongThanhToan,
                                style: StyleApp.textStyle500(
                                    color: ColorApp.dark500),
                              ),
                              Text(
                                '₫ 400.000',
                                style: StyleApp.textStyle700(
                                    color: ColorApp.darkGreen),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              _addedCartBottomSheet(context, language);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: ColorApp.yellow,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical:
                                      Const.size(context).width * 0.04615384615,
                                  horizontal:
                                      Const.size(context).width * 0.08615384615,
                                ),
                                child: Text(
                                  language.datLich.toUpperCase(),
                                  style: StyleApp.textStyle700(
                                      color: ColorApp.dark252525),
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
  }

  Future<dynamic> selectBranchBottomSheet(
      BuildContext context, Language language) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setStateBuilder) => Container(
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              )),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.clear),
                          ),
                          Text(
                            language.chiNhanh,
                            style: StyleApp.textStyle700(
                                fontSize: 18, color: ColorApp.dark252525),
                          ),
                          const Gap(15),
                        ],
                      ),
                    ),
                    const Divider(thickness: 1),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 15),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const Gap(5),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorApp.text,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(items[index]),
                                  ),
                                  SizedBox(
                                    width: 16,
                                    child: Radio<int>(
                                      value: index,
                                      activeColor: ColorApp.darkGreen,
                                      groupValue: selectedIndex,
                                      onChanged: (int? value) {
                                        setStateBuilder(() {
                                          selectedIndex = value!;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: items.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<dynamic> _serviceBottomSheet(
      BuildContext context, Language language, StateSetter setState1) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState2) {
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
                            style: StyleApp.textStyle700(
                                fontSize: 18, color: ColorApp.dark252525),
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
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: ColorApp.text),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: Const.size(context).width *
                                        0.04615384615),
                                child: CheckboxListTile(
                                  checkboxShape: const CircleBorder(),
                                  activeColor: Colors.green,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
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
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  Future<dynamic> _addedCartBottomSheet(
      BuildContext context, Language language) {
    return showModalBottomSheet(
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
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.clear),
                        ),
                      ],
                    ),
                    SizedBox(height: Const.size(context).width * 0.1),
                    Text(
                      language.daThemVaoGioHang,
                      style: StyleApp.textStyle700(
                          color: ColorApp.dark252525, fontSize: 20),
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
                    ButtonWidget(
                      type: ButtonType.secondary,
                      text: language.thanhToan.toUpperCase(),
                      onTap: () {},
                    ),
                    const Gap(12),
                    ButtonWidget(
                      text: language.timDVKhac.toUpperCase(),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
