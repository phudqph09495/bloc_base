import 'package:bloc_base/bloc/language/bloc_lang.dart';
import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/widget/item/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bloc/state_bloc.dart';
import '../../config/const.dart';
import '../../styles/init_style.dart';

class XacNhanScreen extends StatefulWidget {
  const XacNhanScreen({Key? key}) : super(key: key);

  @override
  State<XacNhanScreen> createState() => _XacNhanScreenState();
}

class _XacNhanScreenState extends State<XacNhanScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLang, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return Scaffold(
          backgroundColor: ColorApp.whiteF0,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Const.sizeHeight(context, 105),
                      ),
                      SvgPicture.asset('assets/svg/xacNhan.svg'),
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
                            horizontal: Const.sizeWidth(context, 18)),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            Const.sizeWidth(context, 16),
                                        vertical: Const.sizeHeight(context, 8)),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                                flex: 4,
                                                child: Text(
                                                  '2 x Chăm sóc da mặt',
                                                  style: StyleApp.textStyle600(
                                                      color: ColorApp.dark),
                                                )),
                                            Expanded(
                                                flex: 1,
                                                child: Text(
                                                  '₫ 500.000',
                                                  style: StyleApp.textStyle700(
                                                      color:
                                                          ColorApp.darkGreen),
                                                ))
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
                                              color: ColorApp.bottomBar,
                                            ),
                                            Text(
                                              'Sviet Beauty Spa',
                                              style: StyleApp.textStyle500(
                                                  color: ColorApp.bottomBar),
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
                                                    scale: 0.75,
                                                    child: SvgPicture.asset(
                                                      'assets/svg/notiIcon.svg',
                                                      color: ColorApp.dark500,
                                                    )),
                                                Text(
                                                  ' 4/6/2023 - 15:35',
                                                  style: StyleApp.textStyle400(
                                                      color: ColorApp.dark500,
                                                      fontSize: 14),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width:
                                                  Const.sizeWidth(context, 30),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.watch_later_outlined,
                                                  color: ColorApp.dark500,
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
                                        const Divider()
                                      ],
                                    ),
                                  );
                                },
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 3,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Const.sizeWidth(context, 16),
                                    vertical: Const.sizeHeight(context, 8)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Tổng',
                                      style: StyleApp.textStyle600(
                                          color: ColorApp.dark),
                                    ),
                                    Text(
                                      '₫ 500.000',
                                      style: StyleApp.textStyle700(
                                          color: ColorApp.darkGreen),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: Const.sizeHeight(context, 50),
                  left: Const.sizeWidth(context, 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ))
            ],
          ),
          bottomSheet: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Const.size(context).width * 0.01, vertical: 5),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
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
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      CustomToast.showToast(
                          context: context, msg: 'Đã bấm vào nút xác nhận');
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
                          style: StyleApp.textStyle700(color: ColorApp.dark),
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
