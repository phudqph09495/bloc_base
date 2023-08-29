import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:bloc_base/homepage.dart';
import 'package:bloc_base/router/router.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../bloc/language/bloc_lang.dart';
import '../../../config/const.dart';
import '../../../model/model_local.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/appbar.dart';
import '../../../widget/item/button.dart';

part 'cart_screen.extension.dart';

class GioHangScreen extends StatefulWidget {
  const GioHangScreen({Key? key}) : super(key: key);
  @override
  State<GioHangScreen> createState() => _GioHangScreenState();
}

class _GioHangScreenState extends State<GioHangScreen> {
  List<SpaService> listSpa = [
    SpaService(
      listService: [
        ModelCart(name: 'Chăm Sóc Da Mặt', soLuong: 2, gia: 250000),
        ModelCart(name: 'Chăm Sóc Cơ Thể', soLuong: 1, gia: 350000),
        ModelCart(name: 'Body Massage', soLuong: 3, gia: 420000),
      ],
      listPacket: [
        ModelCart(name: 'Chăm sóc da mặt toàn diện', soLuong: 2, gia: 250000),
        ModelCart(name: 'Chăm sóc cơ thể toàn diện', soLuong: 1, gia: 350000),
      ],
      nameSpa: 'Sorella Beauty Spa',
      indexMaximunPackget: [],
      indexMaximunService: [],
    ),
    SpaService(
      listService: [
        ModelCart(name: 'Chăm sóc Nail', soLuong: 2, gia: 75000),
        ModelCart(name: 'Chăm sóc tóc', soLuong: 1, gia: 250000),
        ModelCart(name: 'Body Massage', soLuong: 3, gia: 420000),
      ],
      listPacket: [
        ModelCart(name: 'Chăm sóc da mặt toàn diện', soLuong: 2, gia: 250000),
        ModelCart(name: 'Chăm sóc cơ thể toàn diện', soLuong: 1, gia: 350000),
      ],
      nameSpa: 'Andeva Spa',
      indexMaximunPackget: [],
      indexMaximunService: [],
    )
  ];
  int totalPrice = 0;
  int totalServiceSelect = 0;
  int warningPayment = 0;
  bool isWarningPayment = false;

  String dateTime =
      '${Const.formatTime(DateTime.now().millisecondsSinceEpoch, format: 'd/M/yyyy - hh:mm')}';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLanguage, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return Scaffold(
          backgroundColor: ColorApp.darkGreen,
          appBar: AppBarWidget(
            title: '${language.gioHang} (3)',
            onTap: () => Navigator.pushNamed(context, RouterName.myHomePage,arguments: 0)
          ),
          body: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                color: ColorApp.background),
            padding: const EdgeInsets.only(bottom: 50),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listSpa.length,
                    itemBuilder: (context, i) => Column(
                      children: [
                       const Gap(20),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 18,
                                height: 18,
                                child: Checkbox(
                                    side: MaterialStateBorderSide.resolveWith((Set<MaterialState> states) {
                                      if (states.contains(MaterialState.selected)) {
                                        return const BorderSide(width: 0.3, color: ColorApp.dark500);
                                      }
                                      return const BorderSide(width: 0.3, color: ColorApp.dark500);
                                    },),
                                    activeColor: ColorApp.background,
                                    shape: const CircleBorder(),
                                    checkColor: ColorApp.bottomBarABCA74,
                                    value: listSpa[i].isChoose,
                                    onChanged: (value) {
                                      setState(() {
                                        listSpa[i].isChoose = value!;
                                        tickAllService(listSpa[i]);
                                        tickAllPackget(listSpa[i]);

                                        //Tính tổng mỗi Listview
                                        if (listSpa[i].listService != null) {
                                          listSpa[i].sumPriceService = 0;
                                          listSpa[i].numberServiceHasPick = 0;
                                          listSpa[i].sumPriceService =
                                              calculatorPrice(
                                                  listSpa[i].listService!,
                                                  listSpa[i].sumPriceService);
                                          calculatorUserPick(
                                              listSpa[i].listService!,
                                              listSpa[i].numberServiceHasPick);
                                        }
                                        if (listSpa[i].listPacket != null) {
                                          listSpa[i].sumPricePackget = 0;
                                          listSpa[i].numberPackgetHasPick = 0;
                                          listSpa[i].sumPricePackget =
                                              calculatorPrice(
                                                  listSpa[i].listPacket!,
                                                  listSpa[i].sumPricePackget);
                                          calculatorUserPick(
                                              listSpa[i].listPacket!,
                                              listSpa[i].numberPackgetHasPick);
                                        }

                                        totalPrice = calculatorTotalPrice();
                                        totalServiceSelect =
                                            calculatorTotalSelect();
                                      });
                                    }),
                              ),
                              const Gap(10),
                              Text(listSpa[i].nameSpa,
                                  style: StyleApp.styleGilroy700(
                                    color: ColorApp.darkGreen,
                                    fontSize: 16,
                                  ))
                            ],
                          ),
                        ),
                        listSpa[i].listService != null
                            ? _buildListService(language, listSpa[i], listSpa)
                            : const SizedBox(),
                        const Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Divider(
                            height: 1,
                          ),
                        ),
                        listSpa[i].listPacket != null
                            ? _buildListPacket(language, listSpa[i], listSpa)
                            : const SizedBox(),
                        Container(
                          color: ColorApp.darkGreen,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tổng',
                                  style: StyleApp.textStyle600(
                                      fontSize: 18, color: ColorApp.background),
                                ),
                                Text(
                                  '₫ ${Const.ConvertPrice.format(listSpa[i].sumPriceService + listSpa[i].sumPricePackget)}',
                                  style: StyleApp.textStyle700(
                                    color: ColorApp.background,
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: ColorApp.backgroundF5F6EE,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(12),
                          color: ColorApp.bottomBarABCA74,
                          dashPattern: const [5, 4],
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/svg/discount2.svg'),
                                        Text(
                                          '   ${language.nhapMagiamGia}',
                                          style: StyleApp.textStyle500(
                                              color: ColorApp.dark500,
                                              fontSize: 13),
                                        ),
                                        const SizedBox(),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: ColorApp.bottomBarABCA74),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 17,
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        language.apDung,
                                        style: StyleApp.textStyle700(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      child: Column(
                        children: [
                          const Gap(15),
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
                          const Gap(6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Đã chọn $totalServiceSelect dịch vụ, giá đã bao gồm thuế',
                                style: StyleApp.textStyle400(
                                  color: ColorApp.dark500,
                                ),
                              ),
                              Text(
                                '₫ ${Const.ConvertPrice.format(totalPrice)}',
                                style: StyleApp.textStyle700(
                                  color: ColorApp.darkGreen,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          isWarningPayment
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: _WarningNumberService(
                                      language: language,
                                      title: language.plsJustChoiseOneServiec),
                                )
                              : const SizedBox.shrink(),
                          ButtonWidget(
                            text: language.thanhToan.toUpperCase(),
                            onTap: () {
                              warningPayment = 0;
                              isWarningPayment = false;
                              for (var spa in listSpa) {
                                if (spa.isChoose) {
                                  warningPayment++;
                                  print(warningPayment.toString());
                                }
                              }
                              if (warningPayment < 2) {
                                Navigator.pushNamed(
                                    context, RouterName.paymentScreen);
                              } else {
                                isWarningPayment = true;
                              }
                              setState(() {});
                            },
                            type: ButtonType.secondary,
                          ),
                          const SizedBox(
                            height: 75,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
      return const Scaffold();
    });
  }

  ListView _buildListService(
      Language language, SpaService spa, List<SpaService> listsSpaService) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        height: 1,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              SizedBox(
                width: Const.size(context).width * 0.9,
                // height: Const.size(context).height*0.25,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 18,
                            width: 18,
                            child: Checkbox(
                                side: MaterialStateBorderSide.resolveWith((Set<MaterialState> states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return const BorderSide(width: 0.3, color: ColorApp.dark500);
                                  }
                                  return const BorderSide(width: 0.3, color: ColorApp.dark500);
                                },),
                                activeColor: ColorApp.background,
                                shape: const CircleBorder(),
                                checkColor: ColorApp.bottomBarABCA74,
                                value: spa.listService![index].value,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      spa.listService![index].value = value;
                                      spa.numberServiceHasPick = 0;
                                      spa.sumPriceService = 0;
                                      //TODO
                                      totalPrice = calculatorTotalPrice();
                                      totalServiceSelect =
                                          calculatorTotalSelect();
                                      //TODO
                                      spa.sumPriceService = calculatorPrice(
                                          spa.listService!,
                                          spa.sumPriceService);
                                      spa.numberServiceHasPick =
                                          calculatorUserPick(spa.listService!,
                                              spa.numberServiceHasPick);
                                    },
                                  );
                                }),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, RouterName.infoService),
                            child: SizedBox(
                              width: Const.size(context).width * 0.17948717948,
                              height: Const.size(context).width * 0.17948717948,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.asset(
                                  'assets/images/exSpa.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: Const.sizeHeight(context, 70),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        spa.listService![index].name,
                                        style: StyleApp.textStyle600(
                                            fontSize: 16,
                                            color: ColorApp.dark252525),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.home,
                                            size: 16,
                                            color: ColorApp.bottomBarABCA74,
                                          ),
                                          Text(
                                            ' Sorella Beauty Spa',
                                            style: StyleApp.textStyle600(
                                              fontSize: 14,
                                              color: ColorApp.bottomBarABCA74,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                size: 16,
                                                color: ColorApp.yellow,
                                              ),
                                              Text(
                                                ' 4.7 ',
                                                style: StyleApp.textStyle700(
                                                  color: ColorApp.yellow,
                                                ),
                                              ),
                                              Text(
                                                ' (86)',
                                                style: StyleApp.textStyle500(
                                                    color: ColorApp.dark500),
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: Const.sizeWidth(context, 60),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(3),
                                            border: Border.all(
                                                width: 0.2,
                                                color: ColorApp.dark500)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                              vertical: 7),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    // showToastService = false;
                                                    setState(() {
                                                      if (spa
                                                          .listService![
                                                      index]
                                                          .soLuong >
                                                          0) {
                                                        spa.listService![index]
                                                            .soLuong--;
                                                        //TODO
                                                        totalPrice =
                                                            calculatorTotalPrice();
                                                        totalServiceSelect =
                                                            calculatorTotalSelect();
                                                        //TODO
                                                        spa.numberServiceHasPick =
                                                        0;
                                                        spa.sumPriceService = 0;
                                                        spa.indexMaximunService
                                                            .remove(index);

                                                        spa.sumPriceService =
                                                            calculatorPrice(
                                                                spa.listService!,
                                                                spa.sumPriceService);
                                                        spa.numberServiceHasPick =
                                                            calculatorUserPick(
                                                                spa.listService!,
                                                                spa.numberServiceHasPick);
                                                      }
                                                    });
                                                  },
                                                  child: Text(
                                                    String.fromCharCode(Icons.remove.codePoint),
                                                    style: TextStyle(
                                                      inherit: false,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w900,
                                                      color: ColorApp.darkGreen,
                                                      fontFamily: Icons.remove.fontFamily,
                                                    ),
                                                  ),),
                                              Text(
                                                ' ${spa.listService![index].soLuong} ',
                                                style: StyleApp.textStyle700(
                                                    fontSize: 15,
                                                    color: ColorApp.dark500),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  print(
                                                      spa.indexMaximunService);
                                                  setState(() {
                                                    if (spa.listService![index]
                                                        .soLuong <
                                                        3) {
                                                      spa.listService![index]
                                                          .soLuong++;
                                                      spa.numberServiceHasPick =
                                                      0;
                                                      spa.sumPriceService = 0;
                                                      //TODO
                                                      totalPrice =
                                                          calculatorTotalPrice();
                                                      totalServiceSelect =
                                                          calculatorTotalSelect();
                                                      //TODO
                                                      spa.sumPriceService =
                                                          calculatorPrice(
                                                              spa.listService!,
                                                              spa.sumPriceService);
                                                      spa.numberServiceHasPick =
                                                          calculatorUserPick(
                                                              spa.listService!,
                                                              spa.numberServiceHasPick);
                                                    } else {
                                                      // showToastService = true;
                                                      if (!spa
                                                          .indexMaximunService
                                                          .contains(index)) {
                                                        spa.indexMaximunService
                                                            .add(index);
                                                      }
                                                    }
                                                  });
                                                },
                                                // child: Icon(Icons.add, size: 16,),
                                                child: Text(
                                                  String.fromCharCode(Icons.add.codePoint),
                                                  style: TextStyle(
                                                    inherit: false,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w900,
                                                    color: ColorApp.darkGreen,
                                                    fontFamily: Icons.add.fontFamily,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            spa.listService!.removeAt(index);
                                            spa.numberServiceHasPick = 0;
                                            spa.sumPriceService = 0;
                                            // sum =
                                            //     calculatePrice(listService, sum);
                                            //TODO
                                            totalPrice = calculatorTotalPrice();
                                            totalServiceSelect =
                                                calculatorTotalSelect();
                                            //TODO
                                            spa.sumPriceService = calculatorPrice(
                                                spa.listService!,
                                                spa.sumPriceService);
                                            spa.numberServiceHasPick =
                                                calculatorUserPick(
                                                    spa.listService!,
                                                    spa.numberServiceHasPick);
                                          });
                                        },
                                        child: SvgPicture.asset(
                                          'assets/svg/deleteIcon.svg',
                                          color: ColorApp.pinkF59398,
                                          width: Const.sizeWidth(context, 16),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(35,10,0,10),
                      child: Divider(
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/notiIcon.svg',
                                  width: 18,
                                  height: 18,
                                  color: ColorApp.dark500,
                                ),
                                const Gap(5),
                                Text(
                                  dateTime,
                                  style: StyleApp.textStyle400(
                                    color: ColorApp.dark500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.watch_later_outlined,
                                color: ColorApp.dark500,
                                size: 16,
                              ),
                              Text(
                                ' 70 phút',
                                style: StyleApp.textStyle400(
                                  color: ColorApp.dark500,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '${Const.ConvertPrice.format(spa.listService![index].gia * spa.listService![index].soLuong)} ₫',
                            style: StyleApp.textStyle700(
                                color: ColorApp.darkGreen, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: (spa.indexMaximunService.contains(index))
                          ? _WarningNumberService(language: language)
                          : const SizedBox(),
                    ),
                  ],
                ),
              ),
              // const Divider(
              //   height: 1,
              //   thickness: 2,
              //   color: ColorApp.whiteF0,
              // ),
            ],
          ),
        );
      },
      itemCount: spa.listService!.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  ListView _buildListPacket(
      Language language, SpaService spa, List<SpaService> listsSpaService) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        height: 1,
      ),
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: spa.listPacket!.length,
      itemBuilder: (context, index) => Padding(
        padding:
            const EdgeInsets.only(left: 28, right: 16, top: 10, bottom: 15),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 18,
                  width: 18,
                  child: Checkbox(
                      side: MaterialStateBorderSide.resolveWith((Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return const BorderSide(width: 0.3, color: ColorApp.dark500);
                        }
                        return const BorderSide(width: 0.3, color: ColorApp.dark500);
                      },),
                      activeColor: ColorApp.background,
                      shape: const CircleBorder(),
                      checkColor: ColorApp.bottomBarABCA74,
                      value: spa.listPacket![index].value,
                      onChanged: (value) {
                        setState(
                          () {
                            spa.listPacket![index].value = value;
                            //TODO
                            totalPrice = calculatorTotalPrice();
                            totalServiceSelect = calculatorTotalSelect();
                            //TODO
                            spa.numberPackgetHasPick = 0;
                            spa.sumPricePackget = 0;
                            spa.sumPricePackget = calculatorPrice(
                                spa.listPacket!, spa.sumPricePackget);
                          },
                        );
                      }),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            spa.listPacket![index].name,
                            style: StyleApp.textStyle600(
                                fontSize: 16, color: ColorApp.dark252525),
                          ),
                          Container(
                            width: Const.sizeWidth(context, 60),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(3),
                                border: Border.all(
                                    width: 0.2,
                                    color: ColorApp.dark500)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (spa.listPacket![index].soLuong >
                                              0) {
                                            spa.listPacket![index].soLuong--;
                                            spa.numberPackgetHasPick = 0;
                                            spa.sumPricePackget = 0;
                                            spa.indexMaximunPackget
                                                .remove(index);
                                            spa.sumPricePackget =
                                                calculatorPrice(
                                                    spa.listPacket!,
                                                    spa.sumPricePackget);
                                            spa.numberPackgetHasPick =
                                                calculatorUserPick(
                                                    spa.listPacket!,
                                                    spa.numberPackgetHasPick);
                                            //TODO
                                            totalPrice =
                                                calculatorTotalPrice();
                                            totalServiceSelect =
                                                calculatorTotalSelect();
                                            //TODO
                                          }
                                        });
                                      },
                                      child: Text(
                                        String.fromCharCode(Icons.remove.codePoint),
                                        style: TextStyle(
                                          inherit: false,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900,
                                          color: ColorApp.darkGreen,
                                          fontFamily: Icons.remove.fontFamily,
                                        ),
                                      ),),
                                  Text(
                                    ' ${spa.listPacket![index].soLuong} ',
                                    style: StyleApp.textStyle700(
                                        fontSize: 15,
                                        color: ColorApp.dark500),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (spa.listPacket![index].soLuong <
                                            3) {
                                          spa.listPacket![index].soLuong++;
                                          spa.numberPackgetHasPick = 0;
                                          spa.sumPricePackget = 0;
                                          //TODO
                                          totalPrice = calculatorTotalPrice();
                                          totalServiceSelect =
                                              calculatorTotalSelect();
                                          //TODO
                                          spa.sumPricePackget =
                                              calculatorPrice(spa.listPacket!,
                                                  spa.sumPricePackget);
                                          spa.numberPackgetHasPick =
                                              calculatorUserPick(
                                                  spa.listPacket!,
                                                  spa.numberPackgetHasPick);
                                        } else {
                                          // showToastPackget = true;
                                          if (!spa.indexMaximunPackget
                                              .contains(index)) {
                                            spa.indexMaximunPackget
                                                .add(index);
                                          }
                                        }
                                      });
                                    },
                                    child: Text(
                                      String.fromCharCode(Icons.add.codePoint),
                                      style: TextStyle(
                                        inherit: false,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                        color: ColorApp.darkGreen,
                                        fontFamily: Icons.add.fontFamily,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.home,
                                size: 16,
                                color: ColorApp.bottomBarABCA74,
                              ),
                              Text(
                                ' Sorella Beauty Spa',
                                style: StyleApp.textStyle600(
                                  fontSize: 14,
                                  color: ColorApp.bottomBarABCA74,
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                spa.listPacket!.removeAt(index);
                                spa.numberPackgetHasPick = 0;
                                spa.sumPricePackget = 0;
                                //TODO
                                totalPrice = calculatorTotalPrice();
                                totalServiceSelect = calculatorTotalSelect();
                                //TODO
                                spa.sumPricePackget = calculatorPrice(
                                    spa.listPacket!, spa.sumPricePackget);
                                spa.numberPackgetHasPick = calculatorUserPick(
                                    spa.listPacket!, spa.numberPackgetHasPick);
                              });
                            },
                            child: SvgPicture.asset(
                              'assets/svg/deleteIcon.svg',
                              color: ColorApp.pinkF59398,
                              width: Const.sizeWidth(context, 16),
                            ),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Divider(
                          height: 1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svg/notiIcon.svg',
                                width: 18,
                                height: 18,
                                color: ColorApp.dark500,
                              ),
                              const Gap(5),
                              Text(
                                '6 buổi',
                                style: StyleApp.textStyle400(
                                  color: ColorApp.dark500,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '${Const.ConvertPrice.format(spa.listPacket![index].gia * spa.listPacket![index].soLuong)} ₫',
                            style: StyleApp.textStyle700(
                                color: ColorApp.darkGreen, fontSize: 15),
                          )
                        ],
                      ),
                      (spa.indexMaximunPackget.contains(index))
                          ? _WarningNumberService(language: language)
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _WarningNumberService extends StatelessWidget {
  const _WarningNumberService({
    required this.language,
    this.title,
  });

  final Language language;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 13),
      child: Container(
        decoration: BoxDecoration(
            color: ColorApp.pinkF59398.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.report_problem,
                color: ColorApp.pinkF59398,
                size: 18,
              ),
              const Gap(8),
              Expanded(
                child: Text(
                  title == null ? language.canhBao : title!,
                  overflow: TextOverflow.visible,
                  style: StyleApp.textStyle600(color: ColorApp.pinkF59398, fontSize: 14),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
