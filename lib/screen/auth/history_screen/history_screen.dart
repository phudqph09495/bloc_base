import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:group_button/group_button.dart';
import '../../../bloc/language/bloc_lang.dart';
import '../../../config/const.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/appbar.dart';
import '../../../widget/item/input/text_filed.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final groupButtonController = GroupButtonController();

  bool dv = true;

  @override
  void initState() {
    super.initState();
    groupButtonController.selectIndex(0);
  }

  @override
  void dispose() {
    groupButtonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLanguage, StateBloc>(
      builder: (_, StateBloc state) {
        if (state is LoadSuccess) {
          Language language = state.data;
          return Scaffold(
            backgroundColor: ColorApp.darkGreen,
            appBar: AppBarWidget(
              title: language.yeuThich,
            ),
            body: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  color: ColorApp.backgroundF5F6EE),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: GroupButton(
                              controller: groupButtonController,
                              options: GroupButtonOptions(
                                  buttonWidth:
                                      (MediaQuery.of(context).size.width -
                                              16 * 2 -
                                              12 * 3) /
                                          3,
                                  selectedColor: ColorApp.bottomBarABCA74,
                                  mainGroupAlignment:
                                      MainGroupAlignment.spaceBetween,
                                  unselectedTextStyle: StyleApp.textStyle500(
                                      color: ColorApp.dark500),
                                  borderRadius: BorderRadius.circular(12)),
                              isRadio: true,
                              onSelected: (name, index, isSelected) {},
                              buttons: const ["Tất cả", "Đã đặt", "Đã huỷ"],
                            ),
                          ),
                          const Gap(10),
                          SizedBox(
                            height: 38,
                            child: Row(
                              children: [
                                Expanded(
                                    child: InputText1(
                                  colorBg: ColorApp.background,
                                  borderColor: ColorApp.borderEAEAEA,
                                  radius: 10,
                                  label: language.timKiem,
                                  hasLeading: true,
                                  iconPreFix: const Icon(
                                    Icons.search,
                                    color: ColorApp.bottomBarABCA74,
                                  ),
                                )),
                                const Gap(10),
                                Expanded(
                                    child: InputText1(
                                  colorBg: ColorApp.background,
                                  borderColor: ColorApp.borderEAEAEA,
                                  radius: 10,
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
                          const Gap(20),
                          ListView.separated(
                            separatorBuilder: (context, index) => const Gap(8),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorApp.background),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 8,
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: SizedBox(
                                                  width: Const.size(context)
                                                          .width *
                                                      0.45,
                                                  height: Const.size(context)
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
                                                              .bottomBarABCA74
                                                          : ColorApp.pinkF59398,
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .only(
                                                              bottomLeft: Radius
                                                                  .circular(5),
                                                              bottomRight:
                                                                  Radius
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
                                                              style: StyleApp
                                                                  .textStyle600(
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
                                        const Gap(10),
                                        Expanded(
                                            flex: 20,
                                            child: SizedBox(
                                              height:
                                                  Const.size(context).height *
                                                      0.1,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Chăm sóc da mặt',
                                                    style:
                                                        StyleApp.textStyle600(
                                                            color: ColorApp
                                                                .dark252525),
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
                                                                    .lineThrough,
                                                            fontSize: 12),
                                                      ),
                                                      Text(
                                                        '  ${Const.ConvertPrice.format(1200000)} đ',
                                                        style: StyleApp
                                                            .textStyle700(
                                                          color: ColorApp
                                                              .dark252525,
                                                        ),
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
                                                              child: SvgPicture
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
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      index % 2 == 1
                                                          ? Text(
                                                              'Hoàn thành',
                                                              style: StyleApp
                                                                  .textStyle600(
                                                                      color: ColorApp
                                                                          .bottomBarABCA74),
                                                            )
                                                          : Text(
                                                              'Sắp tới',
                                                              style: StyleApp
                                                                  .textStyle600(
                                                                      color: ColorApp
                                                                          .darkGreen),
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
              ),
            ),
          );
        }
        return const Scaffold();
      },
    );
  }
}
