import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/router/router.dart';
import 'package:bloc_base/widget/item/button.dart';
import 'package:bloc_base/widget/item/input/bottom_sheet.dart';
import 'package:bloc_base/widget/item/load_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import '../../../bloc/language/bloc_lang.dart';
import '../../../bloc/state_bloc.dart';
import '../../../config/const.dart';
import '../../../model/model_local.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/image_slide_common.dart';
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
    return BlocBuilder<BlocLanguage, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language lang = state.data;
        return Scaffold(
          bottomSheet: Padding(
            padding: EdgeInsets.only(
                left: Const.sizeWidth(context, 16),
              right: Const.sizeWidth(context, 16),
              bottom: Const.sizeHeight(context, 20),
              top:Const.sizeHeight(context, 5),
                ),
            child: ButtonWidget(
              text: lang.lienHe,
              onTap: () {},
              type: ButtonType.secondary,
            ),
          ),
          backgroundColor: ColorApp.backgroundF5F6EE,
          body: Column(
            children: [
              ImageSliderStyle(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    height: 1500,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Const.sizeWidth(context, 15),
                              vertical: Const.sizeHeight(context, 15)),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/logoSpaEX.png',
                                    height: Const.size(context).width * 0.135,
                                    width: Const.size(context).width * 0.135,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  const Gap(15),
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sorella Beauty Spa',
                                        style: StyleApp.textStyle700(
                                            fontSize: 18,
                                            color: ColorApp.dark252525),
                                      ),
                                      Gap(Const.sizeWidth(context, 11)),
                                      Text(
                                        'Trung tâm chăm sóc sức khoẻ cộng đồng',
                                        style: StyleApp.textStyle400(
                                            fontSize: 14,
                                            color: ColorApp.dark500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height:
                                  Const.size(context).width * 0.031794871794),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '  ₫ 1.150.000 - ₫ 4.550.000 ',
                                    style: StyleApp.textStyle700(
                                        fontSize: 15, color: ColorApp.darkGreen),
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.pushNamed(
                                        context, RouterName.rattingScreen),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: ColorApp.yellow,
                                          size: 18,
                                        ),
                                        Text(
                                          ' 4.7 ',
                                          style: StyleApp.textStyle700(
                                              fontSize: 15,
                                              color: ColorApp.yellow),
                                        ),
                                        Text(
                                          ' (86)',
                                          style: StyleApp.textStyle500(
                                              fontSize: 15,
                                              color: ColorApp.dark500),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: Const.size(context).width * 0.028),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: ColorApp.bottomBarABCA74
                                            .withOpacity(0.3),
                                        blurRadius: 4,
                                        spreadRadius: 1, //New
                                      ),
                                    ]),
                                child: InputText1(
                                  colorBg: ColorApp.background,
                                  borderColor: ColorApp.background,
                                  radius: 13,
                                  controller: chiNhanh,
                                  label: 'Chi nhánh 16A Lê Lợi - Lạng Sơn',
                                  readOnly: true,
                                  hasSuffix: true,
                                  onTap: () {
                                    BottomSheetInforService
                                        .selecteRadioBottomSheet(
                                        context,
                                        lang.chiNhanh,
                                        listFilter,
                                        selectedIndex,
                                        chiNhanh);
                                  },
                                  suffix: const Icon(
                                      Icons.keyboard_arrow_down_rounded),
                                ),
                              ),
                              SizedBox(
                                height: Const.size(context).width * 0.03,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: ColorApp.background,
                                    boxShadow: [
                                      BoxShadow(
                                        color: ColorApp.bottomBarABCA74
                                            .withOpacity(0.3),
                                        blurRadius: 4,
                                        spreadRadius: 1, //New
                                      ),
                                    ]),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                      Const.size(context).width * 0.004,
                                      vertical: Const.size(context).width * 0.045),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
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
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.symmetric(
                                                  vertical: BorderSide(
                                                      color: ColorApp
                                                          .bottomBarABCA74
                                                          .withOpacity(0.5)))),
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
                                                    color:
                                                    ColorApp.bottomBarABCA74),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
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
                                              '1.7 km',
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
                            ],
                          ),
                        ),
                        Expanded(
                          child: DefaultTabController(
                              initialIndex: 1,
                              length: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: Const.sizeHeight(context, 28),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: TabBar(
                                        onTap: (ind) {
                                        },
                                        indicatorWeight: 1,
                                        isScrollable: true,
                                        labelStyle: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700),
                                        indicatorColor: ColorApp.bottomBarABCA74,
                                        unselectedLabelStyle: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700),
                                        labelColor: ColorApp.bottomBarABCA74,
                                        unselectedLabelColor: ColorApp.dark252525,
                                        tabs: [
                                          Tab(text: lang.thongTin),
                                          Tab(text: lang.dichvu.toUpperCase()),
                                          Tab(text: lang.danhGia),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: TabBarView(children: [
                                        InforTab(lang: lang),
                                        ServiceTab(
                                            loaiDVController: loaiDVController,
                                            lang: lang,
                                            checkListItems: checkListItems,
                                            selectedIndexDV: selectedIndexDV),
                                        Container(
                                          color: ColorApp.background,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              ListView.builder(

                                                padding: const EdgeInsets.symmetric(
                                                    vertical: 15),
                                                itemCount: 3,
                                                // constLength,
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
                                                                          ' Kiểm soát dầu, thu gọn lỗ chân lôngìa ầ pgkr fdgokdfgm dfogkdfgm dfgpdfkg,df ògjfdkg',
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
                                                  // setState(() {});
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
                                      ]))
                                ],
                              )),
                        )
                      ],
                    ),
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

class ServiceTab extends StatelessWidget {
  const ServiceTab({
    super.key,
    required this.loaiDVController,
    required this.lang,
    required this.checkListItems,
    required this.selectedIndexDV,
  });

  final TextEditingController loaiDVController;
  final Language lang;
  final List<ModelLocal2> checkListItems;
  final int selectedIndexDV;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorApp.background,
      child: Column(
        children: [
          const SizedBox(
            height: 17,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Const.sizeWidth(context, 16)),
            child: InputText1(
              borderSize: 0.7,
              colorBg: ColorApp.background,
              borderColor: ColorApp.black,
              radius: 12,
              controller: loaiDVController,
              label: 'Chọn loại Dịch vụ',
              readOnly: true,
              hasSuffix: true,
              onTap: () {
                BottomSheetInforService.selecteRadioBottomSheet(
                  context,
                  lang.loaiDV,
                  checkListItems,
                  selectedIndexDV,
                  loaiDVController,
                );
              },
              suffix: const Icon(Icons.keyboard_arrow_down_rounded),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InfoService()));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 8, horizontal: Const.sizeWidth(context, 16)),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                  height:
                                      Const.size(context).width * 0.17948717948,
                                  width:
                                      Const.size(context).width * 0.21025641025,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
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
                                    left: Const.size(context).width *
                                        0.02948717948),
                                height:
                                    Const.size(context).width * 0.17948717948,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Chăm sóc da mặt',
                                      style: StyleApp.textStyle700(
                                          color: ColorApp.dark252525),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '₫ 400.000 ',
                                          style: StyleApp.textStyle700(
                                              decoration:
                                                  TextDecoration.lineThrough,
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
                                        const Icon(
                                          Icons.star,
                                          color: ColorApp.yellow,
                                          size: 18,
                                        ),
                                        Text(
                                          ' 4.7 ',
                                          style: StyleApp.textStyle700(
                                              fontSize: 15,
                                              color: ColorApp.yellow),
                                        ),
                                        Text(
                                          ' (86)',
                                          style: StyleApp.textStyle400(
                                              color: ColorApp.dark500,
                                              fontSize: 15),
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
                                height:
                                    Const.size(context).width * 0.17948717948,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      size: 18,
                                      color: index % 2 == 1
                                          ? ColorApp.yellow
                                          : ColorApp.dark500.withOpacity(0.3),
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            color: ColorApp.bottomBarABCA74,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  Const.sizeWidth(context, 12),
                                              vertical:
                                                  Const.sizeWidth(context, 6)),
                                          child: Text(
                                            lang.chiTiet,
                                            style: StyleApp.textStyle700(
                                                color: Colors.white),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              shrinkWrap: true,
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(color: ColorApp.dark500);
              },
            ),
          )
        ],
      ),
    );
  }
}

class InforTab extends StatelessWidget {
  const InforTab({
    super.key,
    required this.lang,
  });

  final Language lang;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: ColorApp.background,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.',
                style: StyleApp.textStyle400(color: ColorApp.dark252525),
              ),
              SizedBox(height: Const.size(context).width * 0.031794871794),
              Text(
                '${lang.diaChi} :',
                style: StyleApp.textStyle700(color: ColorApp.dark252525),
              ),
              SizedBox(height: Const.size(context).width * 0.011794871794),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: Const.size(context).width * 0.55,
                      child: Text(
                        '435a Đ. Tam Trinh, Hoàng Văn Thụ, Hoàng Mai, Hà Nội',
                        style: StyleApp.textStyle400(color: ColorApp.dark500),
                      )),
                  Container(
                    decoration: BoxDecoration(
                        color: ColorApp.darkGreen,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Const.size(context).width * 0.04032258064,
                          vertical: Const.size(context).width * 0.02032258064),
                      child: Row(
                        children: [
                          Text(
                            '${lang.chiDuong}    ',
                            style: StyleApp.textStyle700(color: Colors.white),
                          ),
                          const FaIcon(
                            FontAwesomeIcons.paperPlane,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: Const.size(context).width * 0.031794871794),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${lang.dienThoai} :',
                      style: StyleApp.textStyle700(color: ColorApp.dark252525),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${lang.website} :',
                      style: StyleApp.textStyle700(color: ColorApp.dark252525),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Const.size(context).width * 0.011794871794),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '09 345 456 36',
                      style: StyleApp.textStyle400(color: ColorApp.dark500),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'www.andevavn.vn',
                      style: StyleApp.textStyle400(color: ColorApp.dark500),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Const.size(context).width * 0.031794871794),
              Text(
                '${lang.gioHoatDOng} :',
                style: StyleApp.textStyle700(color: ColorApp.dark252525),
              ),
              SizedBox(height: Const.size(context).width * 0.031794871794),
              Text(
                '${lang.ngayThuong}: 8:00 - 17:00',
                style: StyleApp.textStyle400(color: ColorApp.dark500),
              ),
              SizedBox(height: Const.size(context).width * 0.011794871794),
              Text(
                '${lang.cuoiTuan}: 9:00 - 16:00',
                style: StyleApp.textStyle400(color: ColorApp.dark500),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.066,
              )
            ],
          ),
        ),
      ),
    );
  }
}
