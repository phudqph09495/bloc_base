import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/widget/item/button.dart';
import 'package:bloc_base/widget/item/input/bottom_sheet.dart';
import 'package:bloc_base/widget/item/load_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../bloc/language/bloc_lang.dart';
import '../../../bloc/state_bloc.dart';
import '../../../config/const.dart';
import '../../../model/model_local.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/input/text_filed.dart';
import '../info_service/info_service.dart';

class InfoSpaScreen extends StatefulWidget {
  const InfoSpaScreen({Key? key}) : super(key: key);

  @override
  State<InfoSpaScreen> createState() => _InfoSpaScreenState();
}

class _InfoSpaScreenState extends State<InfoSpaScreen> {
  TextEditingController chiNhanh = TextEditingController();
  TextEditingController loaiDVController = TextEditingController();
  int selectedIndex = 0;
  int selectedIndexDV = 0;
  int constLength = 3;
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
  List<ModelLocal2> listFilter = [
    ModelLocal2(name: 'Chi nhánh 16A Lê Lợi - Lạng Sơn', id: 'filterIcon1.svg'),
    ModelLocal2(
        name:
            'Chi nhánh gì đó tên dài rất dài mà phải xuống dòng - Hoàn Kiếm - Hà Nội',
        id: 'filterIcon2.svg'),
    ModelLocal2(name: 'Chi nhánh 16A Lê Lợi - Lạng Sơn', id: 'filterIcon3.svg'),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLang, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language lang = state.data;
        return Scaffold(
          bottomSheet: SizedBox(
            height: 65,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
              child: ButtonWidget(
                text: lang.lienHe,
                onTap: () {},
                type: ButtonType.secondary,
              ),
            ),
          ),
          backgroundColor: const Color(0xffF5F6EE),
          body: Column(
            children: [
              Stack(
                children: [
                  ImageSlideshow(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.infinity,
                    indicatorColor: ColorApp.dark252525,
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
                    top: 25,
                    // Const.size(context).width * 0.08064516129,
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8),
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
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Icon(
                              Icons.favorite,
                              color: ColorApp.background,
                              size: 24,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.3),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/logoSpaEX.png',
                            height: Const.size(context).width * 0.11794871794,
                            width: Const.size(context).width * 0.11794871794,
                          ),
                          SizedBox(
                            width: Const.size(context).width * 0.6282051282,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sorella Beauty Spa',
                                  style: StyleApp.textStyle700(
                                      fontSize: 20, color: ColorApp.dark252525),
                                ),
                                SizedBox(
                                    height: Const.size(context).width *
                                        0.021794871794),
                                Text(
                                  'Trung tâm chăm sóc sức khoẻ cộng đồng',
                                  style: StyleApp.textStyle400(
                                      fontSize: 14, color: ColorApp.dark500),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(),
                        ],
                      ),
                      SizedBox(
                          height: Const.size(context).width * 0.031794871794),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '₫ 1.150.000 - ₫ 4.550.000 ',
                            style: StyleApp.textStyle700(
                                fontSize: 16, color: ColorApp.darkGreen),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: ColorApp.yellow,
                              ),
                              Text(
                                '4.7 ',
                                style: StyleApp.textStyle700(
                                    fontSize: 14, color: ColorApp.yellow),
                              ),
                              Text(
                                ' (86)',
                                style: StyleApp.textStyle500(
                                    fontSize: 14, color: ColorApp.dark500),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                          height: Const.size(context).width * 0.031794871794),
                      InputText1(
                        radius: 12,
                        controller: chiNhanh,
                        label: 'Chi nhánh 16A Lê Lợi - Lạng Sơn',
                        readOnly: true,
                        hasSuffix: true,
                        onTap: () {
                          BottomSheetInforService.selecteRadioBottomSheet(
                              context,
                              lang.chiNhanh,
                              listFilter,
                              selectedIndex,
                              chiNhanh);
                        },
                        suffix: const Icon(Icons.keyboard_arrow_down_rounded),
                      ),
                      SizedBox(
                          height: Const.size(context).width * 0.051794871794),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.black.withOpacity(0.2),
                                width: 0.5),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Const.size(context).width * 0.004,
                              vertical: Const.size(context).width * 0.03),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        Const.size(context).width * 0.1),
                                child: Column(
                                  children: [
                                    Text(
                                      lang.dichvu,
                                      style: StyleApp.textStyle500(
                                          color: ColorApp.dark500,
                                          fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '12',
                                      style: StyleApp.textStyle700(
                                          color: ColorApp.dark252525),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.symmetric(
                                        vertical: BorderSide(
                                            color: ColorApp.grey8B
                                                .withOpacity(0.5)))),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          Const.size(context).width * 0.09),
                                  child: Column(
                                    children: [
                                      Text(
                                        lang.trangThai,
                                        style: StyleApp.textStyle500(
                                            color: ColorApp.dark500,
                                            fontSize: 12),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Mở cửa',
                                        style: StyleApp.textStyle700(
                                            color: ColorApp.bottomBarABCA74),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        Const.size(context).width * 0.04),
                                child: Column(
                                  children: [
                                    Text(
                                      lang.khoangCach,
                                      style: StyleApp.textStyle500(
                                          color: ColorApp.dark500,
                                          fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '1.7km',
                                      style: StyleApp.textStyle700(
                                          color: ColorApp.dark252525),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: Const.size(context).width * 0.031794871794),
                      Expanded(
                        child: DefaultTabController(
                            initialIndex: 1,
                            length: 3,
                            child: Column(
                              children: [
                                TabBar(
                                  onTap: (ind) {
                                    print(ind);
                                  },
                                  isScrollable: true,
                                  labelStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                  indicatorColor: ColorApp.bottomBarABCA74,
                                  unselectedLabelStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                  labelColor: ColorApp.bottomBarABCA74,
                                  unselectedLabelColor: ColorApp.dark252525,
                                  tabs: [
                                    Tab(text: lang.thongTin),
                                    Tab(text: lang.dichvu.toUpperCase()),
                                    Tab(text: lang.danhGia),
                                  ],
                                ),
                                Expanded(
                                    child: TabBarView(children: [
                                  SingleChildScrollView(
                                    child: Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.',
                                              style: StyleApp.textStyle400(
                                                  color: ColorApp.dark252525),
                                            ),
                                            SizedBox(
                                                height:
                                                    Const.size(context).width *
                                                        0.031794871794),
                                            Text(
                                              '${lang.diaChi} :',
                                              style: StyleApp.textStyle700(
                                                  color: ColorApp.dark252525),
                                            ),
                                            SizedBox(
                                                height:
                                                    Const.size(context).width *
                                                        0.011794871794),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                    width: Const.size(context)
                                                            .width *
                                                        0.55,
                                                    child: Text(
                                                      '435a Đ. Tam Trinh, Hoàng Văn Thụ, Hoàng Mai, Hà Nội',
                                                      style:
                                                          StyleApp.textStyle400(
                                                              color: ColorApp
                                                                  .dark500),
                                                    )),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: ColorApp.darkGreen,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal:
                                                            Const.size(context)
                                                                    .width *
                                                                0.04032258064,
                                                        vertical:
                                                            Const.size(context)
                                                                    .width *
                                                                0.02032258064),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          '${lang.chiDuong}    ',
                                                          style: StyleApp
                                                              .textStyle700(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                        const FaIcon(
                                                          FontAwesomeIcons
                                                              .paperPlane,
                                                          color: Colors.white,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                                height:
                                                    Const.size(context).width *
                                                        0.031794871794),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    '${lang.dienThoai} :',
                                                    style:
                                                        StyleApp.textStyle700(
                                                            color: ColorApp
                                                                .dark252525),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    '${lang.website} :',
                                                    style:
                                                        StyleApp.textStyle700(
                                                            color: ColorApp
                                                                .dark252525),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                                height:
                                                    Const.size(context).width *
                                                        0.011794871794),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    '09 345 456 36',
                                                    style:
                                                        StyleApp.textStyle400(
                                                            color: ColorApp
                                                                .dark500),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    'www.andevavn.vn',
                                                    style:
                                                        StyleApp.textStyle400(
                                                            color: ColorApp
                                                                .dark500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                                height:
                                                    Const.size(context).width *
                                                        0.031794871794),
                                            Text(
                                              '${lang.gioHoatDOng} :',
                                              style: StyleApp.textStyle700(
                                                  color: ColorApp.dark252525),
                                            ),
                                            SizedBox(
                                                height:
                                                    Const.size(context).width *
                                                        0.031794871794),
                                            Text(
                                              '${lang.ngayThuong}: 8:00 - 17:00',
                                              style: StyleApp.textStyle400(
                                                  color: ColorApp.dark500),
                                            ),
                                            SizedBox(
                                                height:
                                                    Const.size(context).width *
                                                        0.011794871794),
                                            Text(
                                              '${lang.cuoiTuan}: 9:00 - 16:00',
                                              style: StyleApp.textStyle400(
                                                  color: ColorApp.dark500),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.066,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        //                     ServiceTypeTextFFWidget(
                                        //   text: lang.loaiDV,
                                        //   onTap: () {
                                        //     selecteServiceBottomSheet(context, lang);
                                        //   },
                                        // ),
                                        InputText1(
                                          colorBg: ColorApp.background,
                                          borderColor: ColorApp.background,
                                          radius: 12,
                                          controller: loaiDVController,
                                          label: 'Chọn loại Dịch vụ',
                                          readOnly: true,
                                          hasSuffix: true,
                                          onTap: () {
                                            BottomSheetInforService
                                                .selecteRadioBottomSheet(
                                              context,
                                              lang.loaiDV,
                                              checkListItems,
                                              selectedIndexDV,
                                              loaiDVController,
                                            );
                                          },
                                          suffix: const Icon(Icons
                                              .keyboard_arrow_down_rounded),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ListView.builder(
                                          padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.066,
                                              top: 15),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const InfoService()));
                                              },
                                              child: Column(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: SizedBox(
                                                            height: Const.size(
                                                                        context)
                                                                    .width *
                                                                0.17948717948,
                                                            width: Const.size(
                                                                        context)
                                                                    .width *
                                                                0.21025641025,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/exSpa.png',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            )),
                                                      ),
                                                      Expanded(
                                                        flex: 5,
                                                        child: Container(
                                                          margin: EdgeInsets.only(
                                                              left: Const.size(
                                                                          context)
                                                                      .width *
                                                                  0.02948717948),
                                                          height: Const.size(
                                                                      context)
                                                                  .width *
                                                              0.17948717948,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                'Chăm sóc da mặt',
                                                                style: StyleApp
                                                                    .textStyle700(
                                                                        color: ColorApp
                                                                            .dark252525),
                                                              ),
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
                                                                            color:
                                                                                ColorApp.darkGreen),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const Icon(
                                                                    Icons.star,
                                                                    color: ColorApp
                                                                        .yellow,
                                                                    size: 18,
                                                                  ),
                                                                  Text(
                                                                    ' 4.5',
                                                                    style: StyleApp
                                                                        .textStyle500(
                                                                            color:
                                                                                ColorApp.dark500),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: SizedBox(
                                                          height: Const.size(
                                                                      context)
                                                                  .width *
                                                              0.17948717948,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Icon(
                                                                Icons.favorite,
                                                                size: 18,
                                                                color: index %
                                                                            2 ==
                                                                        1
                                                                    ? ColorApp
                                                                        .yellow
                                                                    : ColorApp
                                                                        .dark500,
                                                              ),
                                                              Container(
                                                                  decoration: BoxDecoration(
                                                                      color: ColorApp
                                                                          .bottomBarABCA74,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            10,
                                                                        vertical:
                                                                            5),
                                                                    child: Text(
                                                                      lang.chiTiet,
                                                                      style: StyleApp.textStyle700(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ))
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const Divider()
                                                ],
                                              ),
                                            );
                                          },
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: 10,
                                        )
                                      ],
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: Container(
                                      color: Colors.white,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ListView.builder(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15),
                                            itemCount: constLength,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(
                                                            height: Const.size(
                                                                        context)
                                                                    .width *
                                                                0.09692307692,
                                                            width: Const.size(
                                                                        context)
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
                                                                      .circular(
                                                                          80),
                                                              child:
                                                                  const LoadImage(
                                                                url:
                                                                    'https://pbs.twimg.com/media/Fr8SLFzaEAE_skC?format=jpg&name=large',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
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
                                                                            color:
                                                                                ColorApp.dark252525),
                                                                  ),
                                                                  Text(
                                                                    '4 ngày trước',
                                                                    style: StyleApp
                                                                        .textStyle400(
                                                                            color:
                                                                                ColorApp.dark500),
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
                                                                  ...List
                                                                      .generate(
                                                                          5,
                                                                          (index) =>
                                                                              const Icon(
                                                                                Icons.star,
                                                                                size: 18,
                                                                                color: ColorApp.yellow,
                                                                              )),
                                                                  Text(
                                                                    '${lang.dichvu}: ',
                                                                    style: StyleApp
                                                                        .textStyle400(
                                                                            color:
                                                                                ColorApp.dark500),
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      'Dịch vụ: Kiểm soát dầu, thu gọn lỗ chân lôngìa ầ pgkr fdgokdfgm dfogkdfgm dfgpdfkg,df ògjfdkg',
                                                                      style: StyleApp.textStyle400(
                                                                          color:
                                                                              ColorApp.bottomBarABCA74),
                                                                      maxLines:
                                                                          1,
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
                                                  const Divider()
                                                ],
                                              );
                                            },
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              constLength = 10;
                                              lang.xemThem = 'Đã hết';
                                              setState(() {});
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              decoration: const BoxDecoration(),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const SizedBox(),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          lang.xemThem,
                                                          style: StyleApp
                                                              .textStyle400(
                                                                  color: ColorApp
                                                                      .bottomBarABCA74),
                                                        ),
                                                        const Icon(
                                                          Icons
                                                              .keyboard_arrow_down,
                                                          size: 16,
                                                          color: ColorApp
                                                              .bottomBarABCA74,
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.066,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ]))
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }
      return const Scaffold();
    });
  }
}
