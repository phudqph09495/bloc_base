import 'package:bloc_base/bloc/language/bloc_lang.dart';
import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../bloc/state_bloc.dart';
import '../../../config/const.dart';
import '../../../styles/init_style.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLang, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return Scaffold(
          backgroundColor: ColorApp.backgroundF5F6EE,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Const.sizeHeight(context, 105),
                  ),
                  Image.asset(
                    'assets/svg/image_qr_code_scan.png',
                    width: 140,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: Const.sizeHeight(context, 35),
                  ),
                  Text(
                    language.xacnhanBooking,
                    style: StyleApp.textStyle700(
                        color: ColorApp.darkGreen, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: Const.sizeWidth(context, 324),
                    child: Text(
                      language.vuiLongKT,
                      textAlign: TextAlign.center,
                      style: StyleApp.textStyle500(
                          color: ColorApp.black3F, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: Const.sizeHeight(context, 30),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Const.sizeWidth(context, 18),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorApp.background,
                      ),
                      child: Column(
                        children: [
                          ListView.separated(
                            separatorBuilder: (context, index) => const Divider(
                              height: 1,
                            ),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Const.sizeWidth(context, 16),
                                    vertical: Const.sizeWidth(context, 16)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          '2 x Chăm sóc da mặt',
                                          overflow: TextOverflow.ellipsis,
                                          style: StyleApp.textStyle600(
                                              color: ColorApp.dark252525),
                                        )),
                                        Text(
                                          '₫ 500.000',
                                          style: StyleApp.textStyle700(
                                              color: ColorApp.darkGreen),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: Const.sizeHeight(context, 8),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.home,
                                          size: 16,
                                          color: ColorApp.bottomBarABCA74,
                                        ),
                                        Text(
                                          'Sviet Beauty Spa',
                                          style: StyleApp.textStyle500(
                                              color: ColorApp.bottomBarABCA74),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: Const.sizeHeight(context, 8),
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Transform.scale(
                                                scale: 0.5,
                                                child: SvgPicture.asset(
                                                  'assets/svg/notiIcon.svg',
                                                )),
                                            Text(
                                              ' 4/6/2023 - 15:35',
                                              style: StyleApp.textStyle400(
                                                color: ColorApp.dark500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: Const.sizeWidth(context, 30),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.watch_later_outlined,
                                              color: ColorApp.dark500,
                                              size: 14,
                                            ),
                                            Text(
                                              ' 70 phút',
                                              style: StyleApp.textStyle400(
                                                  color: ColorApp.dark500,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 4,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Const.sizeWidth(context, 16),
                                vertical: Const.sizeHeight(context, 8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tổng',
                                  style: StyleApp.textStyle600(
                                      color: ColorApp.dark252525),
                                ),
                                Text(
                                  '₫ 500.000',
                                  style: StyleApp.textStyle700(
                                      color: ColorApp.darkGreen),
                                )
                              ],
                            ),
                          ),
                          const Gap(10),
                        ],
                      ),
                    ),
                  ),
                  const Gap(70),
                ],
              ),
            ),
          ),
          bottomSheet: Padding(
            padding: EdgeInsets.only(
                left: Const.size(context).width * 0.01,
                right: Const.size(context).width * 0.01,
                bottom: 5),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.065,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: ColorApp.dark500,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                Const.size(context).width * 0.02615384615),
                        child: Text(
                          language.huyBo.toUpperCase(),
                          style: StyleApp.textStyle700(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouterName.confirmSuccesScreen);
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
                          language.xacNhan.toUpperCase(),
                          style:
                              StyleApp.textStyle700(color: ColorApp.dark252525),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
      return const Scaffold();
    });
  }
}
