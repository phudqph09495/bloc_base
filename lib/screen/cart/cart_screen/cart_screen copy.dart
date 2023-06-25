// import 'package:bloc_base/bloc/language/event_bloc2.dart';
// import 'package:bloc_base/bloc/state_bloc.dart';
// import 'package:bloc_base/homepage.dart';
// import 'package:bloc_base/router/router.dart';

// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:gap/gap.dart';

// import '../../../bloc/language/bloc_lang.dart';
// import '../../../config/const.dart';
// import '../../../model/model_local.dart';
// import '../../../styles/init_style.dart';
// import '../../../widget/item/appbar.dart';
// import '../../../widget/item/button.dart';
// import '../../../widget/item/input/text_filed.dart';
// part 'cart_screen.extension.dart';

// class GioHangScreen extends StatefulWidget {
//   const GioHangScreen({Key? key}) : super(key: key);

//   @override
//   State<GioHangScreen> createState() => _GioHangScreenState();
// }

// class _GioHangScreenState extends State<GioHangScreen> {
//   List<SpaService> spaService = [
//     SpaService(
//       listService: [
//         ModelCart(name: 'Chăm sóc da mặt', soLuong: 2, gia: 250000),
//         ModelCart(name: 'Chăm sóc cơ thể', soLuong: 1, gia: 350000),
//         ModelCart(name: 'Body Massage', soLuong: 3, gia: 420000),
//       ],
//       listPacket: [
//         ModelCart(name: 'Chăm sóc da mặt toàn diện', soLuong: 2, gia: 250000),
//         ModelCart(name: 'Chăm sóc cơ thể toàn diện', soLuong: 1, gia: 350000),
//       ],
//       nameSpa: 'Sorella Beauty Spa',
//     ),
//     SpaService(
//       listService: [
//         ModelCart(name: 'Chăm sóc Nail', soLuong: 2, gia: 75000),
//         ModelCart(name: 'Chăm sóc tóc', soLuong: 1, gia: 250000),
//         ModelCart(name: 'Body Massage', soLuong: 3, gia: 420000),
//       ],
//       listPacket: [
//         ModelCart(name: 'Chăm sóc da mặt toàn diện', soLuong: 2, gia: 250000),
//         ModelCart(name: 'Chăm sóc cơ thể toàn diện', soLuong: 1, gia: 350000),
//       ],
//       nameSpa: 'Andeva Spa',
//     )
//   ];
//   // List<ModelCart> listService = [
//   //   ModelCart(name: 'Chăm sóc da mặt', soLuong: 2, gia: 250000),
//   //   ModelCart(name: 'Chăm sóc cơ thể', soLuong: 1, gia: 350000),
//   //   ModelCart(name: 'Body Massage', soLuong: 3, gia: 420000),
//   // ];
//   // List<ModelCart> listPacket = [
//   //   ModelCart(name: 'Chăm sóc da mặt toàn diện', soLuong: 2, gia: 250000),
//   //   ModelCart(name: 'Chăm sóc cơ thể toàn diện', soLuong: 1, gia: 350000),
//   // ];
//   int numberServiceHasPick = 0;
//   int numberPackgetHasPick = 0;
//   int sumPriceService = 0;
//   int sumPricePackget = 0;
//   // bool showToastService = false;
//   // bool showToastPackget = false;
//   bool isChoose = false;
//   int indexMaximun1 = -1;
//   List<int> indexMaximunService = [-1];
//   List<int> indexMaximunPackget = [];
//   String dateTime =
//       '${Const.formatTime(DateTime.now().millisecondsSinceEpoch)}';

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<BlocLang, StateBloc>(builder: (_, StateBloc state) {
//       if (state is LoadSuccess) {
//         Language language = state.data;
//         return Scaffold(
//           backgroundColor: ColorApp.darkGreen,
//           appBar: AppBarWidget(
//             title: '${language.gioHang} (3)',
//             onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => MyHomePage(
//                           index: 0,
//                         ))),
//           ),
//           body: Container(
//             decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(25),
//                     topRight: Radius.circular(25)),
//                 color: ColorApp.background),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ListView.builder(
//                     physics: const NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: spaService.length,
//                     itemBuilder: (context, index) => Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 20),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               SizedBox(
//                                 width: 18,
//                                 height: 18,
//                                 child: Checkbox(
//                                     shape: const CircleBorder(),
//                                     activeColor: ColorApp.bottomBarABCA74,
//                                     value: isChoose,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         isChoose = value!;
//                                       });
//                                     }),
//                               ),
//                               const Gap(10),
//                               Text(spaService[index].nameSpa,
//                                   style: StyleApp.styleGilroy700(
//                                     color: ColorApp.darkGreen,
//                                     fontSize: 16,
//                                   ))
//                             ],
//                           ),
//                         ),
//                         spaService[index].listService != null
//                             ? _buildListService(
//                                 language, spaService[index].listService!)
//                             : const SizedBox.shrink(),
//                         const Padding(
//                           padding: EdgeInsets.only(right: 16),
//                           child: Divider(
//                             height: 1,
//                           ),
//                         ),
//                         spaService[index].listPacket != null
//                             ? _buildListPacket(
//                                 language,
//                                 spaService[index].listPacket!,
//                               )
//                             : const SizedBox.shrink(),
//                         Container(
//                           color: ColorApp.darkGreen,
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 16, vertical: 14),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'Tổng',
//                                   style: StyleApp.textStyle600(
//                                       fontSize: 16, color: ColorApp.background),
//                                 ),
//                                 Text(
//                                   '₫ ${Const.ConvertPrice.format(sumPriceService + sumPricePackget)}',
//                                   style: StyleApp.textStyle700(
//                                     color: ColorApp.background,
//                                     fontSize: 16,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   const Gap(15),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 12),
//                     child: DottedBorder(
//                         borderType: BorderType.RRect,
//                         radius: const Radius.circular(15),
//                         color: ColorApp.bottomBarABCA74,
//                         dashPattern: const [5, 1],
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(15)),
//                           child: Padding(
//                             padding: const EdgeInsets.all(3),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(5),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       SvgPicture.asset(
//                                           'assets/svg/discount2.svg'),
//                                       Text(
//                                         '   ${language.nhapMagiamGia}',
//                                         style: StyleApp.textStyle500(
//                                             color: ColorApp.dark500,
//                                             fontSize: 13),
//                                       ),
//                                       const SizedBox(),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(15),
//                                       color: ColorApp.bottomBarABCA74),
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                       horizontal: 17,
//                                       vertical: 10,
//                                     ),
//                                     child: Text(
//                                       language.apDung,
//                                       style: StyleApp.textStyle700(
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )),
//                   ),
//                   Container(
//                     width: double.infinity,
//                     color: Colors.white,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 8, horizontal: 16),
//                       child: Column(
//                         children: [
//                           const Gap(15),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 language.tongThanhToan,
//                                 style: StyleApp.textStyle600(
//                                     color: ColorApp.dark252525, fontSize: 16),
//                               ),
//                               Text(
//                                 '₫ 3.820.000',
//                                 style: StyleApp.textStyle700(
//                                     color: ColorApp.dark500,
//                                     fontSize: 12,
//                                     decoration: TextDecoration.lineThrough),
//                               )
//                             ],
//                           ),
//                           const Gap(6),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Đã chọn ${numberServiceHasPick + numberPackgetHasPick} dịch vụ, giá đã bao gồm thuế',
//                                 style: StyleApp.textStyle400(
//                                   color: ColorApp.dark500,
//                                 ),
//                               ),
//                               Text(
//                                 '₫ ${Const.ConvertPrice.format(sumPriceService + sumPricePackget)}',
//                                 style: StyleApp.textStyle700(
//                                   color: ColorApp.darkGreen,
//                                   fontSize: 16,
//                                 ),
//                               )
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           ButtonWidget(
//                             text: language.thanhToan.toUpperCase(),
//                             onTap: () {
//                               Navigator.pushNamed(
//                                   context, RouterName.paymentScreen);
//                             },
//                             type: ButtonType.secondary,
//                           ),
//                           const SizedBox(
//                             height: 75,
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       }
//       return const Scaffold();
//     });
//   }

//   ListView _buildListService(Language language, List<ModelCart> listService) {
//     return ListView.separated(
//       separatorBuilder: (context, index) => const Divider(
//         height: 1,
//       ),
//       padding: EdgeInsets.zero,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.only(bottom: 15),
//           child: Column(
//             children: [
//               SizedBox(
//                 width: Const.size(context).width * 0.9,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10, left: 10),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             height: 18,
//                             width: 18,
//                             child: Checkbox(
//                                 shape: const CircleBorder(),
//                                 activeColor: ColorApp.bottomBarABCA74,
//                                 value: listService[index].value,
//                                 onChanged: (value) {
//                                   setState(
//                                     () {
//                                       listService[index].value = value;
//                                       numberServiceHasPick = 0;
//                                       sumPriceService = 0;
//                                       for (int i = 0;
//                                           i < listService.length;
//                                           i++) {
//                                         if (listService[i].value == true) {
//                                           sumPriceService = sumPriceService +
//                                               listService[i].gia *
//                                                   listService[i].soLuong;
//                                           numberServiceHasPick++;
//                                         }
//                                       }
//                                     },
//                                   );
//                                 }),
//                           ),
//                           const SizedBox(
//                             width: 12,
//                           ),
//                           SizedBox(
//                             width: Const.size(context).width * 0.17948717948,
//                             height: Const.size(context).width * 0.17948717948,
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(12.0),
//                               child: Image.asset(
//                                 'assets/images/exSpa.png',
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 15,
//                           ),
//                           Expanded(
//                             flex: 14,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Expanded(
//                                         flex: 5,
//                                         child: Text(
//                                           listService[index].name,
//                                           style: StyleApp.textStyle700(
//                                               fontSize: 16,
//                                               color: ColorApp.dark252525),
//                                         )),
//                                     Expanded(
//                                       flex: 2,
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                             border: Border.all(
//                                                 color: ColorApp.background)),
//                                         child: Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               vertical: 4),
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceAround,
//                                             children: [
//                                               InkWell(
//                                                   onTap: () {
//                                                     // showToastService = false;
//                                                     setState(() {
//                                                       if (listService[index]
//                                                               .soLuong >
//                                                           0) {
//                                                         listService[index]
//                                                             .soLuong--;
//                                                         numberServiceHasPick =
//                                                             0;
//                                                         sumPriceService = 0;
//                                                         indexMaximunService
//                                                             .remove(index);
//                                                         for (int i = 0;
//                                                             i <
//                                                                 listService
//                                                                     .length;
//                                                             i++) {
//                                                           if (listService[i]
//                                                                   .value ==
//                                                               true) {
//                                                             sumPriceService =
//                                                                 sumPriceService +
//                                                                     listService[i]
//                                                                             .gia *
//                                                                         listService[i]
//                                                                             .soLuong;
//                                                             numberServiceHasPick++;
//                                                           }
//                                                         }
//                                                       }
//                                                     });
//                                                   },
//                                                   child: const Icon(
//                                                     Icons.remove,
//                                                     size: 12,
//                                                     color: ColorApp.darkGreen,
//                                                   )),
//                                               Text(
//                                                 ' ${listService[index].soLuong} ',
//                                                 style: StyleApp.textStyle500(
//                                                     fontSize: 16,
//                                                     color: ColorApp.dark500),
//                                               ),
//                                               InkWell(
//                                                 onTap: () {
//                                                   print(indexMaximunService);
//                                                   setState(() {
//                                                     if (listService[index]
//                                                             .soLuong <
//                                                         3) {
//                                                       listService[index]
//                                                           .soLuong++;
//                                                       numberServiceHasPick = 0;
//                                                       sumPriceService = 0;

//                                                       for (int i = 0;
//                                                           i <
//                                                               listService
//                                                                   .length;
//                                                           i++) {
//                                                         if (listService[i]
//                                                                 .value ==
//                                                             true) {
//                                                           sumPriceService =
//                                                               sumPriceService +
//                                                                   listService[i]
//                                                                           .gia *
//                                                                       listService[
//                                                                               i]
//                                                                           .soLuong;
//                                                           numberServiceHasPick++;
//                                                         }
//                                                       }
//                                                     } else {
//                                                       // showToastService = true;
//                                                       if (!indexMaximunService
//                                                           .contains(index)) {
//                                                         indexMaximunService
//                                                             .add(index);
//                                                       }
//                                                     }
//                                                   });
//                                                 },
//                                                 child: const Icon(
//                                                   Icons.add,
//                                                   size: 12,
//                                                   color: ColorApp.darkGreen,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     const Icon(
//                                       Icons.home,
//                                       size: 16,
//                                       color: ColorApp.bottomBarABCA74,
//                                     ),
//                                     Text(
//                                       ' Sviet Beauty Spa',
//                                       style: StyleApp.textStyle700(
//                                         color: ColorApp.bottomBarABCA74,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         const Icon(
//                                           Icons.star,
//                                           size: 16,
//                                           color: ColorApp.yellow,
//                                         ),
//                                         Text(
//                                           ' 4.7 ',
//                                           style: StyleApp.textStyle700(
//                                             color: ColorApp.yellow,
//                                           ),
//                                         ),
//                                         Text(
//                                           ' (86)',
//                                           style: StyleApp.textStyle500(
//                                               color: ColorApp.dark500),
//                                         ),
//                                       ],
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         setState(() {
//                                           listService.removeAt(index);
//                                           numberServiceHasPick = 0;
//                                           sumPriceService = 0;
//                                           // sum =
//                                           //     calculatePrice(listService, sum);
//                                           for (int i = 0;
//                                               i < listService.length;
//                                               i++) {
//                                             if (listService[i].value == true) {
//                                               sumPriceService =
//                                                   sumPriceService +
//                                                       listService[i].gia *
//                                                           listService[i]
//                                                               .soLuong;
//                                               numberServiceHasPick++;
//                                             }
//                                           }
//                                         });
//                                       },
//                                       child: const Icon(Icons.delete_forever,
//                                           color: ColorApp.pink),
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 35),
//                       child: Divider(),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 35),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               DatePicker.showDateTimePicker(context,
//                                   currentTime: DateTime.now(),
//                                   locale: language.codeNow == 'en'
//                                       ? LocaleType.en
//                                       : LocaleType.vi, onConfirm: (date) {
//                                 dateTime =
//                                     '${Const.formatTime(date.millisecondsSinceEpoch)}';
//                                 setState(() {});
//                               });
//                             },
//                             child: Row(
//                               children: [
//                                 SvgPicture.asset(
//                                   'assets/svg/notiIcon.svg',
//                                   width: 18,
//                                   height: 18,
//                                   color: ColorApp.dark500,
//                                 ),
//                                 const Gap(5),
//                                 Text(
//                                   dateTime,
//                                   style: StyleApp.textStyle400(
//                                     color: ColorApp.dark500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.watch_later_outlined,
//                                 color: ColorApp.dark500,
//                                 size: 16,
//                               ),
//                               Text(
//                                 ' 70 phút',
//                                 style: StyleApp.textStyle400(
//                                   color: ColorApp.dark500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Text(
//                             '${Const.ConvertPrice.format(listService[index].gia * listService[index].soLuong)} ₫',
//                             style: StyleApp.textStyle700(
//                                 color: ColorApp.darkGreen, fontSize: 16),
//                           )
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 33),
//                       child: (indexMaximunService.contains(index))
//                           ? _WarningNumberService(language: language)
//                           : const SizedBox(),
//                     ),
//                   ],
//                 ),
//               ),
//               // const Divider(
//               //   height: 1,
//               //   thickness: 2,
//               //   color: ColorApp.whiteF0,
//               // ),
//             ],
//           ),
//         );
//       },
//       itemCount: listService.length,
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//     );
//   }

//   ListView _buildListPacket(Language language, List<ModelCart> listPacket) {
//     return ListView.separated(
//       separatorBuilder: (context, index) => const Divider(
//         height: 1,
//       ),
//       padding: EdgeInsets.zero,
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: listPacket.length,
//       itemBuilder: (context, index) => Padding(
//         padding:
//             const EdgeInsets.only(left: 28, right: 16, top: 10, bottom: 15),
//         child: Column(
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 18,
//                   width: 18,
//                   child: Checkbox(
//                       shape: const CircleBorder(),
//                       activeColor: ColorApp.bottomBarABCA74,
//                       value: listPacket[index].value,
//                       onChanged: (value) {
//                         setState(
//                           () {
//                             listPacket[index].value = value;
//                             numberPackgetHasPick = 0;
//                             sumPricePackget = 0;
//                             sumPricePackget =
//                                 calculatePrice(listPacket, sumPricePackget);
//                           },
//                         );
//                       }),
//                 ),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 Expanded(
//                   // flex: 14,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                               flex: 4,
//                               child: Text(
//                                 listPacket[index].name,
//                                 style: StyleApp.textStyle700(
//                                     fontSize: 16, color: ColorApp.dark252525),
//                               )),
//                           Expanded(
//                             flex: 1,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   border:
//                                       Border.all(color: ColorApp.background)),
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 4),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     InkWell(
//                                         onTap: () {
//                                           setState(() {
//                                             if (listPacket[index].soLuong > 0) {
//                                               listPacket[index].soLuong--;
//                                               numberPackgetHasPick = 0;
//                                               sumPricePackget = 0;
//                                               indexMaximunPackget.remove(index);
//                                               sumPricePackget = calculatePrice(
//                                                   listPacket, sumPricePackget);
//                                               numberPackgetHasPick =
//                                                   calculateUserPickService(
//                                                       listPacket,
//                                                       numberPackgetHasPick);
//                                             }
//                                           });
//                                         },
//                                         child: const Icon(
//                                           Icons.remove,
//                                           size: 12,
//                                           color: ColorApp.darkGreen,
//                                         )),
//                                     Text(
//                                       ' ${listPacket[index].soLuong} ',
//                                       style: StyleApp.textStyle500(
//                                           fontSize: 16,
//                                           color: ColorApp.dark500),
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         setState(() {
//                                           if (listPacket[index].soLuong < 3) {
//                                             listPacket[index].soLuong++;
//                                             numberPackgetHasPick = 0;
//                                             sumPricePackget = 0;
//                                             sumPricePackget = calculatePrice(
//                                                 listPacket, sumPricePackget);
//                                             numberPackgetHasPick =
//                                                 calculateUserPickService(
//                                                     listPacket,
//                                                     numberPackgetHasPick);
//                                           } else {
//                                             // showToastPackget = true;
//                                             if (!indexMaximunPackget
//                                                 .contains(index)) {
//                                               indexMaximunPackget.add(index);
//                                             }
//                                           }
//                                         });
//                                       },
//                                       child: const Icon(
//                                         Icons.add,
//                                         size: 12,
//                                         color: ColorApp.darkGreen,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       const Gap(10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.home,
//                                 size: 16,
//                                 color: ColorApp.bottomBarABCA74,
//                               ),
//                               Text(
//                                 ' Sviet Beauty Spa',
//                                 style: StyleApp.textStyle700(
//                                   color: ColorApp.bottomBarABCA74,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           InkWell(
//                             onTap: () {
//                               setState(() {
//                                 listPacket.removeAt(index);
//                                 numberPackgetHasPick = 0;
//                                 sumPricePackget = 0;
//                                 sumPricePackget =
//                                     calculatePrice(listPacket, sumPricePackget);
//                                 numberPackgetHasPick = calculateUserPickService(
//                                     listPacket, numberPackgetHasPick);
//                               });
//                             },
//                             child: const Icon(Icons.delete_forever,
//                                 color: ColorApp.pink),
//                           )
//                         ],
//                       ),
//                       const Gap(10),
//                       const Divider(
//                         height: 1,
//                       ),
//                       const Gap(10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               SvgPicture.asset(
//                                 'assets/svg/notiIcon.svg',
//                                 width: 18,
//                                 height: 18,
//                                 color: ColorApp.dark500,
//                               ),
//                               const Gap(5),
//                               Text(
//                                 '6 buổi',
//                                 style: StyleApp.textStyle400(
//                                   color: ColorApp.dark500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Text(
//                             '${Const.ConvertPrice.format(listPacket[index].gia * listPacket[index].soLuong)} ₫',
//                             style: StyleApp.textStyle700(
//                                 color: ColorApp.darkGreen, fontSize: 16),
//                           )
//                         ],
//                       ),
//                       (indexMaximunPackget.contains(index))
//                           ? _WarningNumberService(language: language)
//                           : const SizedBox.shrink(),
//                     ],
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _WarningNumberService extends StatelessWidget {
//   const _WarningNumberService({
//     required this.language,
//   });

//   final Language language;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10),
//       child: Container(
//         decoration: BoxDecoration(
//             color: ColorApp.pink.withOpacity(0.5),
//             borderRadius: BorderRadius.circular(12)),
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Row(
//             children: [
//               const Icon(
//                 Icons.report_problem_outlined,
//                 color: ColorApp.pink,
//                 size: 14,
//               ),
//               const Gap(8),
//               Expanded(
//                 child: Text(
//                   language.canhBao,
//                   overflow: TextOverflow.ellipsis,
//                   style: StyleApp.textStyle500(color: ColorApp.pink),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
