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
import 'package:group_button/group_button.dart';

import '../../bloc/language/bloc_lang.dart';
import '../../config/const.dart';
import '../../model/model_local.dart';
import '../../styles/init_style.dart';
import '../../widget/item/input/text_filed.dart';

class LichSuScreen extends StatefulWidget {
  const LichSuScreen({Key? key}) : super(key: key);

  @override
  State<LichSuScreen> createState() => _LichSuScreenState();
}

class _LichSuScreenState extends State<LichSuScreen> {
  final controller = GroupButtonController();

  bool dv = true;

  @override
  void initState() {
    super.initState();
    controller.selectIndex(0);
  }

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
                                language.lichSu,
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
                      color: ColorApp.whiteF0,
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
                                  Const.size(context).width * 0.02179487179,
                              horizontal:
                                  Const.size(context).width * 0.02615384615),
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: GroupButton(
                                  controller: controller,
                                  options: GroupButtonOptions(
                                      buttonWidth: Const.size(context).width *
                                          0.28205128205,
                                      selectedColor: ColorApp.darkGreen,
                                      mainGroupAlignment:
                                          MainGroupAlignment.spaceBetween,
                                      unselectedTextStyle:
                                          StyleApp.textStyle500(
                                              color: ColorApp.dark500),
                                      borderRadius: BorderRadius.circular(12)),
                                  isRadio: true,
                                  onSelected: (name, index, isSelected) {},
                                  buttons: const [
                                    "Tất cả",
                                    "Đã đặt",
                                    "Đã huỷ",
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Const.size(context).height * 10 / 844,
                              ),
                              SizedBox(
                                height: Const.size(context).height * 38 / 844,
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 14,
                                        child: InputText1(
                                          label: language.timKiem,
                                          hasLeading: true,
                                          iconPreFix: const Icon(
                                            Icons.search,
                                            color: ColorApp.bottomBar,
                                          ),
                                        )),
                                    const Expanded(
                                      flex: 1,
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                        flex: 14,
                                        child: InputText1(
                                          label: '30 ngày gần đây',
                                          hasSuffix: true,
                                          suffix: Transform.scale(
                                              scale: 0.5,
                                              child: SvgPicture.asset(
                                                  'assets/svg/notiIcon.svg')),
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Const.size(context).height * 20 / 844,
                              ),
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 8,
                                              child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    5),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    5)),
                                                    child: SizedBox(
                                                      width: Const.size(context)
                                                              .width *
                                                          0.45,
                                                      height:
                                                          Const.size(context)
                                                                  .height *
                                                              0.1,
                                                      child: Image.asset(
                                                        'assets/images/exSpa.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                      decoration: BoxDecoration(
                                                          color: index % 2 == 1
                                                              ? ColorApp
                                                                  .bottomBar
                                                              : ColorApp.pink,
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          5),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          5))),
                                                      child: Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            vertical: Const.size(
                                                                        context)
                                                                    .width *
                                                                0.0111111111111),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            const SizedBox(),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  index % 2 == 1
                                                                      ? 'Đã đặt'
                                                                      : 'Đã huỷ',
                                                                  style: StyleApp.textStyle600(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox()
                                                          ],
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ),
                                            const Expanded(
                                                flex: 1, child: SizedBox()),
                                            Expanded(
                                                flex: 20,
                                                child: SizedBox(
                                                  height: Const.size(context)
                                                          .height *
                                                      0.1,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Chăm sóc da mặt',
                                                        style: StyleApp
                                                            .textStyle600(
                                                                color: ColorApp
                                                                    .dark),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'đ ${Const.ConvertPrice.format(1450000)} ',
                                                            style: StyleApp.textStyle700(
                                                                color: ColorApp
                                                                    .dark500,
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough),
                                                          ),
                                                          Text(
                                                            '  ${Const.ConvertPrice.format(1200000)} đ',
                                                            style: StyleApp.textStyle700(
                                                                color: ColorApp
                                                                    .dark,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Transform.scale(
                                                                  scale: 0.7,
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
                                                          index % 2 == 1
                                                              ? Text(
                                                                  'Hoàn thành',
                                                                  style: StyleApp
                                                                      .textStyle600(
                                                                          color:
                                                                              ColorApp.bottomBar),
                                                                )
                                                              : Text(
                                                                  'Sắp tới',
                                                                  style: StyleApp
                                                                      .textStyle600(
                                                                          color:
                                                                              ColorApp.darkGreen),
                                                                )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 6,
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
      return const Scaffold();
    });
  }
}
