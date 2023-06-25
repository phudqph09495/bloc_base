import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:bloc_base/widget/item/input/text_filed2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../bloc/language/bloc_lang.dart';
import '../../../config/const.dart';
import '../../../router/router.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/appbar.dart';
import '../../../widget/item/button.dart';
import '../../../widget/item/input/text_filed.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedIndex = 0;
  bool? taoTKMoi = false;
  bool? isAcceptTerms = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLanguage, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return Scaffold(
          backgroundColor: ColorApp.darkGreen,
          appBar: AppBarWidget(
            isBack: true,
            title: language.thanhToan,
          ),
          // AppBar(
          //   centerTitle: true,
          //   leading: AppBarBackButton(
          //     onTap: () => Navigator.pop(context),
          //   ),
          //   title: Text(
          //     language.thanhToan,
          //     style: StyleApp.textStyle700(color: Colors.white, fontSize: 20),
          //   ),
          //   elevation: 0,
          //   backgroundColor: ColorApp.darkGreen,
          // ),
          body: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                color: ColorApp.whiteF0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: Const.size(context).width * 0.04615384615,
                                bottom:
                                    Const.size(context).width * 0.02615384615,
                                left: Const.size(context).width * 0.04615384615,
                                right:
                                    Const.size(context).width * 0.04615384615),
                            child: SizedBox(
                              width: Const.size(context).width * 0.9,
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 60,
                                        height: 60,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          child: Image.asset(
                                            'assets/images/exSpa.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const Gap(15),
                                      Expanded(
                                        // flex: 14,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              // flex: 3,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '2 x Chăm sóc da mặt',
                                                    style:
                                                        StyleApp.textStyle600(
                                                            fontSize: 16,
                                                            color: ColorApp
                                                                .dark252525),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Transform.scale(
                                                          scale: 0.75,
                                                          child:
                                                              SvgPicture.asset(
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
                                                                fontSize: 14),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              '₫ 500.000',
                                              textAlign: TextAlign.end,
                                              style: StyleApp.textStyle700(
                                                  fontSize: 16,
                                                  color: ColorApp.darkGreen),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 1,
                            color: ColorApp.whiteF0,
                          )
                        ],
                      );
                    },
                    shrinkWrap: true,
                    itemCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: Const.size(context).width * 0.04615384615,
                        bottom: Const.size(context).width * 0.02615384615,
                        left: Const.size(context).width * 0.04615384615,
                        right: Const.size(context).width * 0.04615384615),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          language.phuongThucThanhToan,
                          style: StyleApp.textStyle700(
                              color: ColorApp.dark252525, fontSize: 16),
                        ),
                        SizedBox(
                          height: Const.size(context).width * 0.04615384615,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorApp.backgroundF9F9F4,
                          ),
                          child: ExpansionTile(
                            childrenPadding: const EdgeInsets.symmetric(
                              horizontal: 18,
                            ),
                            expandedCrossAxisAlignment:
                                CrossAxisAlignment.start,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/svg/credit_card.svg'),
                                    Text(' ${language.theTinDung}'),
                                  ],
                                ),
                                SizedBox(
                                  width: 5,
                                  child: Radio<int>(
                                    value: 0,
                                    activeColor: ColorApp.darkGreen,
                                    groupValue: selectedIndex,
                                    onChanged: (int? value) {
                                      setState(() {
                                        selectedIndex = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Container(
                                  padding: EdgeInsets.zero,
                                  child: const Divider()),
                              const Gap(20),
                              Text(
                                language.hoTen,
                                style: StyleApp.textStyle700(
                                    color: ColorApp.dark252525),
                              ),
                              const Gap(10),
                              const _TextInputInfor(),
                              const Gap(20),
                              Text(
                                language.soThe,
                                style: StyleApp.textStyle700(
                                    color: ColorApp.dark252525),
                              ),
                              const Gap(10),
                              const _TextInputInfor(),
                              const Gap(20),
                              Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        language.ngayHetHan,
                                        style: StyleApp.textStyle700(
                                            color: ColorApp.dark252525),
                                      ),
                                      SizedBox(
                                        height: Const.size(context).width *
                                            0.02615384615,
                                      ),
                                      _TextInputInfor(
                                        label: 'MM/YY',
                                        inputformater: [
                                          NoSpaceFormatter(),
                                          ExpiryDateFormatter(),
                                        ],
                                        textInputType: TextInputType.number,
                                      )
                                      // TextCreditCard(
                                      //   label: 'MM/YY',
                                      //   inputformater: [
                                      //     NoSpaceFormatter(),
                                      //     ExpiryDateFormatter(),
                                      //   ],
                                      //   textInputType: TextInputType.number,
                                      // )
                                      // InputText1(
                                      //   keyboardType: TextInputType.number,
                                      //   inputformater: [
                                      // NoSpaceFormatter(),
                                      // ExpiryDateFormatter(),
                                      //   ],
                                      //   label: 'MM/YY',
                                      //   radius: 10,
                                      // ),
                                    ],
                                  )),
                                  const Gap(10),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'CVV',
                                        style: StyleApp.textStyle700(
                                            color: ColorApp.dark252525),
                                      ),
                                      SizedBox(
                                        height: Const.size(context).width *
                                            0.02615384615,
                                      ),
                                      _TextInputInfor(),
                                    ],
                                  ))
                                ],
                              ),
                              const Gap(20)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorApp.backgroundF9F9F4,
                          ),
                          child: ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/svg/logo_momo.svg'),
                                    Text(' ${language.viMomo}'),
                                  ],
                                ),
                                SizedBox(
                                  width: 5,
                                  child: Radio<int>(
                                    value: 1,
                                    activeColor: ColorApp.darkGreen,
                                    groupValue: selectedIndex,
                                    onChanged: (int? value) {
                                      setState(() {
                                        selectedIndex = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            children: const [
                              Text('data'),
                              Text('data2'),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorApp.backgroundF9F9F4,
                          ),
                          child: ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/svg/ttDiem.svg'),
                                    Text(' ${language.thanhToanBangDiem}'),
                                  ],
                                ),
                                SizedBox(
                                  width: 5,
                                  child: Radio<int>(
                                    value: 2,
                                    activeColor: ColorApp.darkGreen,
                                    groupValue: selectedIndex,
                                    onChanged: (int? value) {
                                      setState(() {
                                        selectedIndex = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            children: const [
                              Text('data'),
                              Text('data2'),
                            ],
                          ),
                        ),
                        const Gap(30),
                        Text(
                          language.thongtinLienHe,
                          style: StyleApp.textStyle700(
                              color: ColorApp.dark252525, fontSize: 16),
                        ),
                        const Gap(15),
                        _TextInputInfor(widgetLabel: language.hoTen),
                        const Gap(8),
                        const _TextInputInfor(widgetLabel: 'Email'),
                        const Gap(8),
                        _TextInputInfor(widgetLabel: language.soDienThoai),
                        const Gap(15),
                        Row(
                          children: [
                            SizedBox(
                              width: 24.0,
                              height: 24.0,
                              child: Checkbox(
                                  side:
                                      const BorderSide(color: ColorApp.black3F),
                                  shape: const CircleBorder(),
                                  activeColor: ColorApp.bottomBarABCA74,
                                  value: taoTKMoi,
                                  onChanged: (value) {
                                    setState(() {
                                      taoTKMoi = value;
                                    });
                                  }),
                            ),
                            Text(
                              ' ${language.taoTaiKhoanMoi}',
                              style: StyleApp.textStyle500(
                                  color: ColorApp.dark500),
                            )
                          ],
                        ),
                        const Gap(20),
                        _TextInputInfor(
                          widgetLabel: language.matKhau,
                          hasPass: true,
                          obscureText: true,
                        ),
                        const Gap(8),
                        _TextInputInfor(
                          widgetLabel: language.xacNhanMatKhau,
                          hasPass: true,
                          obscureText: true,
                        ),
                        const Gap(30),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  language.tongThanhToan,
                                  style: StyleApp.textStyle600(
                                      color: ColorApp.dark252525, fontSize: 16),
                                ),
                                Text(
                                  '₫ 3.820.000',
                                  style: StyleApp.textStyle700(
                                      color: ColorApp.dark500,
                                      fontSize: 12,
                                      decoration: TextDecoration.lineThrough),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Đã chọn 3 dịch vụ, giá đã bao gồm thuế',
                                  style: StyleApp.textStyle400(
                                      color: ColorApp.dark500, fontSize: 14),
                                ),
                                Text(
                                  '₫ ${Const.ConvertPrice.format(2500000)}',
                                  style: StyleApp.textStyle700(
                                    color: ColorApp.darkGreen,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                            const Gap(30),
                            Row(
                              children: [
                                SizedBox(
                                  width: 24.0,
                                  height: 24.0,
                                  child: Checkbox(
                                      side: const BorderSide(
                                          color: ColorApp.black3F),
                                      shape: const CircleBorder(),
                                      activeColor: ColorApp.bottomBarABCA74,
                                      value: isAcceptTerms,
                                      onChanged: (value) {
                                        setState(() {
                                          isAcceptTerms = value;
                                        });
                                      }),
                                ),
                                Text(
                                  ' ${language.acceptTermsAndConditions}',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.dark500),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ButtonWidget(
                              text: language.thanhToan.toUpperCase(),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouterName.successScreen);
                              },
                              type: ButtonType.secondary,
                            )
                          ],
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
    });
  }
}

class _TextInputInfor extends StatelessWidget {
  const _TextInputInfor({
    this.widgetLabel,
    this.hasPass = false,
    this.obscureText = false,
    this.label = '',
    this.textInputType,
    this.inputformater,
  });

  final String? widgetLabel;
  final bool hasPass;
  final bool obscureText;
  final String label;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputformater;

  @override
  Widget build(BuildContext context) {
    return InputText2(
      inputformater: inputformater,
      keyboardType: textInputType,
      hasPass: hasPass,
      obscureText: obscureText,
      borderColor: ColorApp.background,
      colorBg: ColorApp.borderEAEAEA,
      widgetLabel: widgetLabel == null
          ? null
          : Row(
              children: [
                Text(
                  widgetLabel!,
                  style: StyleApp.textStyle500(color: ColorApp.dark500),
                ),
                Text(
                  '*',
                  style: StyleApp.textStyle500(color: Colors.red),
                ),
              ],
            ),
      label: label,
      radius: 10,
    );
  }
}
