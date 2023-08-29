import 'package:bloc_base/bloc/language/bloc_lang.dart';
import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:bloc_base/widget/item/appbar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:group_button/group_button.dart';

import '../../../config/const.dart';
import '../../../model/model_local.dart';
import '../../../styles/colors.dart';
import '../../../styles/styles.dart';

class SaleMenberScreen extends StatefulWidget {
  const SaleMenberScreen({super.key});

  @override
  State<SaleMenberScreen> createState() => _SaleMenberScreenState();
}

class _SaleMenberScreenState extends State<SaleMenberScreen> {
  final controller = GroupButtonController();
  List<SaleModel> listSale = [
    SaleModel('Hạng thành viên', 'Mức lên hạng (trong 365 ngày gần nhất)', '% giảm giá'),
    SaleModel('Joy Đồng', '0₫', '0%'),
    SaleModel('Joy Bạc', '2,000,000 ₫', '1%'),
    SaleModel('Joy Vàng', '5,000,000 ₫', '2%'),
    SaleModel(' Joy Kim Cương', '10,000,000 ₫', '3%'),
  ];

  int indexSelected = 0;

  String header =
      'Trong vòng 6 tháng từ khi  khách hàng tạo  tài  khoản, bạn Joy mới sẽ nhận được một voucher theo mức tiêu dùng.';

  String noteContent = '''- Voucher có hiệu lực 7 ngày từ khi khách lấy voucher
  
- Khi khách hàng chọn nhận voucher ưu đãi sẽ kết thúc, thay vào đó là ưu đãi theo từng hạng thành viên

- Giới thiệu thêm thành viên mới ưu đãi này sẽ được bắt đầu được mở lại khi thành viên mới được giới thiệu đạt mức tiêu dùng 2 triệu''';

  String saleContent =
      '''Ưu đãi bạn thân sẽ được áp dụng khi ưu đãi bạn mới kết thúc. Xếp hạng Joy sẽ phụ thuộc vào mức tiêu dùng của bạn Joy trong 365 ngày gần nhất.''';

  String saleOther =
      'Trong vòng 6 tháng từ khi khách hàng tạo tài khoản, bạn Joy mới sẽ nhận được một voucher theo mức tiêu dùng.';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.selectIndex(indexSelected);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLanguage, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: ColorApp.darkGreen,
            appBar: AppBarWidget(title: language.uuDai),
            body: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: ColorApp.background,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(20),
                      GroupButton(
                          controller: controller,
                          options: GroupButtonOptions(
                              unselectedBorderColor: ColorApp.borderEAEAEA,
                              selectedBorderColor: Colors.transparent,
                              buttonWidth: Const.size(context).width * 0.43,
                              selectedColor: ColorApp.bottomBarABCA74,
                              mainGroupAlignment:
                                  MainGroupAlignment.spaceBetween,
                              unselectedTextStyle: StyleApp.textStyle500(
                                  color: ColorApp.dark500),
                              borderRadius: BorderRadius.circular(12)),
                          isRadio: true,
                          onSelected: (name, index, isSelected) {
                            if (index == 0) {
                              indexSelected = 0;
                            } else if (index == 1) {
                              indexSelected = 1;
                            }
                            setState(() {});
                          },
                          buttons: [
                            (language.uuDaiThanhVien),
                            (language.uuDaiKhac)
                          ]),
                      indexSelected == 0
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Gap(25),
                                Text(
                                  language.uuDaiThanhVienMoi,
                                  style: StyleApp.styleGilroy700(
                                      fontSize: 25, color: ColorApp.dark252525),
                                ),
                                const Gap(10),
                                Text(
                                  header,
                                  style: StyleApp.textStyle400(
                                      color: ColorApp.dark500, fontSize: 17),
                                ),
                                Gap(15),
                                Stack(
                                  children: [
                                    SizedBox(
                                        width: double.infinity,
                                        height: Const.sizeHeight(context, 70),
                                        child: SvgPicture.asset(
                                          'assets/svg/saleBackgroudGreen.svg',
                                        )),
                                    SizedBox(
                                      width: double.infinity,
                                      height: Const.sizeHeight(context, 70),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '1.000.000 đ',
                                              style: StyleApp.textStyle700(
                                                  color: ColorApp.background,
                                                  fontSize: 19),
                                            ),
                                            ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  elevation: 1,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20,
                                                      vertical: 5),
                                                  backgroundColor:
                                                      ColorApp.yellow,
                                                ),
                                                child: Text(
                                                  language.nhanNgay,
                                                  style: StyleApp.textStyle600(
                                                      color: ColorApp.black,
                                                      fontSize: 16),
                                                ))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Stack(
                                  children: [
                                    SizedBox(
                                        width: double.infinity,
                                        height: Const.sizeHeight(context, 70),
                                        child: SvgPicture.asset(
                                          'assets/svg/saleBackgroudGrey.svg',
                                          color: Colors.grey.withOpacity(0.7),
                                        )),
                                    SizedBox(
                                      width: double.infinity,
                                      height: Const.sizeHeight(context, 70),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '2.000.000 đ',
                                              style: StyleApp.textStyle700(
                                                  color: ColorApp.background,
                                                  fontSize: 19),
                                            ),
                                            ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20,
                                                        vertical: 5),
                                                    backgroundColor:
                                                        Colors.yellow.shade100),
                                                child: Text(
                                                  language.nhanNgay,
                                                  style: StyleApp.textStyle600(
                                                      color: ColorApp.dark500,
                                                      fontSize: 16),
                                                )),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const Gap(15),
                                Text(
                                  ' * Lưu ý :',
                                  style: StyleApp.textStyle700(
                                      color: ColorApp.darkGreen, fontSize: 18),
                                ),
                                const Gap(10),
                                Text(
                                  noteContent,
                                  style: StyleApp.textStyle400(
                                      fontSize: 16, color: ColorApp.dark500),
                                ),
                                Gap(30),
                                Text(
                                  "Ưu Đãi Bạn Thân",
                                  style: StyleApp.textStyle700(
                                      color: ColorApp.black, fontSize: 25),
                                ),
                                const Gap(12),
                                Text(saleContent,
                                    style: StyleApp.textStyle400(
                                        fontSize: 16, color: ColorApp.dark500)),
                                const Gap(15),
                                Container(
                                  height: 240,
                                  child: ListView.separated(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        if (index == 0) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 3),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      listSale[0].level,
                                                      style:
                                                          StyleApp.textStyle600(
                                                              fontSize: 16,
                                                              color: ColorApp
                                                                  .dark500),
                                                    )),
                                                Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      listSale[0].value,
                                                      style:
                                                          StyleApp.textStyle600(
                                                              fontSize: 16,
                                                              color: ColorApp
                                                                  .dark500),
                                                    )),
                                                Expanded(
                                                    child: Text(
                                                  listSale[0].percent,
                                                  style: StyleApp.textStyle600(
                                                      fontSize: 15,
                                                      color: ColorApp.dark500),
                                                ))
                                              ],
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 3, vertical: 12),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      listSale[index].level,
                                                      style:
                                                          StyleApp.textStyle400(
                                                              fontSize: 14,
                                                              color: ColorApp
                                                                  .dark500),
                                                    )),
                                                Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      listSale[index].value,
                                                      style:
                                                          StyleApp.textStyle400(
                                                              fontSize: 14,
                                                              color: ColorApp
                                                                  .dark500),
                                                    )),
                                                Expanded(
                                                    child: Text(
                                                  listSale[index].percent,
                                                  style: StyleApp.textStyle400(
                                                      fontSize: 14,
                                                      color: ColorApp.dark500),
                                                )),
                                              ],
                                            ),
                                          );
                                        }
                                      },
                                      separatorBuilder: (context, index) {
                                        if (index == 0) {
                                          return const SizedBox();
                                        }
                                        return const Divider(
                                          height: 1,
                                          color: ColorApp.dark500,
                                        );
                                      },
                                      itemCount: listSale.length),
                                ),
                                const Gap(15),
                                Text(
                                  "Ưu Đãi Cho Review",
                                  style: StyleApp.textStyle700(
                                      color: ColorApp.black, fontSize: 25),
                                ),
                                const Gap(12),
                                Text(
                                    'Khi review dịch vụ giảm giá 2% cho lần booking tiếp theo',
                                    style: StyleApp.textStyle400(
                                        fontSize: 16, color: ColorApp.dark500)),
                               const Gap(30),
                              ],
                            )
                          : Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Gap(25),
                                Text(
                                  language.uuDaiKhac,
                                  style: StyleApp.styleGilroy700(
                                      fontSize: 25, color: ColorApp.dark252525),
                                ),
                                const Gap(10),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    saleOther,
                                    style: StyleApp.textStyle400(
                                        color: ColorApp.dark500, fontSize: 17),
                                  ),
                                ),
                                 const Gap(15),
                                Container(
                                  height: Const.sizeHeight(context, 2000),
                                  child: GridView.builder(
                                    itemCount: 12,
                                    physics: const NeverScrollableScrollPhysics(),
                                      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: Const.sizeWidth(context, 10),
                                          crossAxisCount: 2,
                                          crossAxisSpacing: Const.sizeWidth(context, 6),
                                          childAspectRatio: 1.23
                                      ),
                                      itemBuilder: (context, index){
                                      return GestureDetector(
                                        onTap: null,
                                        child: DottedBorder(
                                          dashPattern: const [4, 4, 4, 4],
                                          strokeCap: StrokeCap.square,
                                          strokeWidth: 1.2,
                                          color: ColorApp.darkGreen,
                                          borderType: BorderType.RRect,
                                          radius: const Radius.circular(15),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              color: ColorApp.backgroundF5F6EE,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 4),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text('Có hiệu lực đến', style: StyleApp.textStyle500(color: ColorApp.black,fontSize: Const.sizeWidth(context, 16)),),
                                                          const Gap(6),
                                                          Text('21/7/2023', style: StyleApp.textStyle700(fontSize: Const.sizeWidth(context, 16)),)
                                                        ],
                                                      ),
                                                      Container(
                                                        height: Const.sizeWidth(context, 65),
                                                        width: Const.sizeWidth(context, 50),
                                                        decoration: const BoxDecoration(
                                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
                                                          color: ColorApp.darkGreen
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            Text('Ưu đãi', style: StyleApp.textStyle400(color: ColorApp.background,fontSize: Const.sizeWidth(context, 12)),),
                                                            Text('-20%' ,style: StyleApp.textStyle700(color: ColorApp.background, fontSize: Const.sizeWidth(context, 16)),)
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    padding: EdgeInsets.only(bottom: 5),
                                                    child: ElevatedButton(
                                                        onPressed: () {},
                                                        style: ElevatedButton.styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  15)),
                                                          elevation: 1,
                                                          padding: const EdgeInsets
                                                              .symmetric(
                                                              horizontal: 20,
                                                              vertical: 5),
                                                          backgroundColor:
                                                          ColorApp.yellow,
                                                        ),
                                                        child: Text(
                                                          language.nhanNgay,
                                                          style: StyleApp.textStyle600(
                                                              color: ColorApp.black,
                                                              fontSize: 16),
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                  }),
                                )
                              ],
                            )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
      return const Scaffold();
    });
  }
}
