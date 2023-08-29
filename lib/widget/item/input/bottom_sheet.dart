import 'package:bloc_base/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../bloc/language/event_bloc2.dart';
import '../../../config/const.dart';
import '../../../model/model_local.dart';
import '../../../router/router.dart';
import '../../../styles/colors.dart';
import '../../../styles/styles.dart';
import '../button.dart';

class BottomSheetInforService {
  static Future<dynamic> addedToCartBottomSheet(
      BuildContext context, Language lang) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        ),
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
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
                      lang.daThemVaoGioHang,
                      style: StyleApp.textStyle700(
                          color: ColorApp.dark252525, fontSize: 20),
                    ),
                    SizedBox(height: Const.size(context).width * 0.11),
                    SvgPicture.asset('assets/svg/datLichTC.svg'),
                    SizedBox(height: Const.size(context).width * 0.08),
                    Text(
                      lang.banDaThem,
                      style: StyleApp.textStyle500(color: ColorApp.dark500),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: Const.size(context).width * 0.03),
                    Text(
                      lang.camOnBan,
                      style: StyleApp.textStyle500(color: ColorApp.dark500),
                    ),
                    SizedBox(height: Const.size(context).width * 0.18),
                    ButtonWidget(
                      text: lang.commomViewCart.toUpperCase(),
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouterName.gioHangScreen,
                          (Route<dynamic> route) => false,
                        );
                      },
                      type: ButtonType.secondary,
                    ),
                    SizedBox(height: Const.size(context).width * 0.03),
                    ButtonWidget(
                      text: lang.timDVKhac.toUpperCase(),
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouterName.myHomePage,arguments: 2,
                          (Route<dynamic> route) => false,
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  static Future<dynamic> purchaseBuyBottomSheet(
      BuildContext context, Language lang) {
    return showModalBottomSheet(
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))
        ),
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: Const.size(context).height * 0.8,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(15))
                      ),
                      padding: EdgeInsets.symmetric(vertical: Const.sizeHeight(context, 14), horizontal: Const.sizeWidth(context, 16)),
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
                            lang.muaGoi,
                            style: StyleApp.textStyle700(
                                fontSize: 18, color: ColorApp.dark252525),
                          ),
                          const SizedBox(width: 20,)
                        ],
                      ),
                    ),
                    const Divider(color: ColorApp.dark500),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          3, // The number of RadioListTiles you want to display
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical:Const.sizeHeight(context, 6), horizontal: Const.sizeWidth(context, 16)),
                          decoration: BoxDecoration(color: ColorApp.backgroundF5F6EE,
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(
                                Const.size(context).width * 0.05),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width:
                                            Const.size(context).width * 0.63,
                                        child: Text(
                                          'Combo Chăm Sóc Da Mặt + Gội Đầu Thảo Dược',
                                          style: StyleApp.textStyle700(
                                              color: ColorApp.dark252525,
                                              fontSize: 16),
                                        )),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: ColorApp.pinkF59398,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6, horizontal: 9),
                                        child: Text(
                                          '-78%',
                                          style: StyleApp.textStyle700(
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: Const.size(context).width * 0.023,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
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
                                        Transform.scale(
                                            scale: 0.8,
                                            child: SvgPicture.asset(
                                                'assets/svg/notiIcon.svg')),
                                        Text(
                                          '  6 buổi',
                                          style: StyleApp.textStyle700(
                                              color: ColorApp.darkGreen,
                                              fontSize: 15),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: Const.size(context).width * 0.023,
                                ),
                                Text(
                                  'Tấm Home Spa - Combo Chăm Sóc Da Mặt + Gội Đầu Thảo Dược. Voucher 550,000 VNĐ, Còn 119,000 VNĐ, Giảm 78%.',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.dark500),
                                ),
                                SizedBox(
                                  height: Const.size(context).width * 0.033,
                                ),
                                ButtonWidget(
                                  text: lang.muaGoi,
                                  onTap: () =>
                                      addedToCartBottomSheet(context, lang),
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
            );
          });
        });
  }

  static Future<dynamic> selecteRadioBottomSheet(
      BuildContext context,
      String titleBottomShet,
      List<ModelLocal2> list,
      int indexRadio,
      TextEditingController textEditingController,
      {double? height}) {
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
              height: height ?? MediaQuery.of(context).size.height * 0.75,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              )),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16, left: 16, right: 16, bottom: 5),
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
                            titleBottomShet,
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
                          horizontal: 18, vertical: 12),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const Gap(5),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorApp.greyF9,
                            ),
                            child: RadioListTile(
                              activeColor: ColorApp.darkGreen,
                              controlAffinity: ListTileControlAffinity.trailing,
                              title: Text(list[index].name ?? ""),
                              value: index,
                              groupValue: indexRadio,
                              onChanged: (int? value) {
                                textEditingController.text =
                                    list[index].name ?? "";
                                setStateBuilder(() {
                                  indexRadio = value!;
                                });
                                Future.delayed(
                                  const Duration(milliseconds: 200),
                                  () => Navigator.pop(context),
                                );
                              },
                            ),
                          );
                        },
                        itemCount: list.length,
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
}
