import 'package:bloc_base/bloc/language/bloc_lang.dart';
import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/model/model_local.dart';
import 'package:bloc_base/router/router.dart';
import 'package:bloc_base/widget/drawler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../bloc/state_bloc.dart';
import '../../../config/const.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/appBar.dart';
import '../../../widget/item/input/bottom_sheet.dart';
import '../../../widget/item/input/text_filed.dart';
import '../../../widget/item/load_image.dart';
import '../../../widget/item/notification_widget.dart';

class MemberScreen extends StatefulWidget {
  const MemberScreen({Key? key}) : super(key: key);

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  var selected = true;

  List<InforCollum> listNewMember = [
    InforCollum(180000, 200000, 21000),
    InforCollum(220000, 340000, 23000),
    InforCollum(155000, 120000, 11000),
    InforCollum(327000, 190000, 14000),
    InforCollum(18200, 280000, 9000)
  ];
  List<InforCollum1> listOldMember = [
    InforCollum1('Joy Đồng', 2000000, 1),
    InforCollum1('Joy Bạc', 1200000, 1),
    InforCollum1('Joy Vàng', 1900000, 0),
    InforCollum1('Joy Kim Cương', 2800000, 3)
  ];
  final uuDaiController = TextEditingController();
  int selectedIndex = -1;
  List<ModelLocal2> listFilter = [
    ModelLocal2(id: '0', name: 'Thành viên Kim Cương'),
    ModelLocal2(id: '1', name: 'Thành viên vàng'),
    ModelLocal2(id: '2', name: 'Thành viên bạc'),
    ModelLocal2(id: '3', name: 'Thành viên thường')
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLanguage, StateBloc>(
        builder: (context, StateBloc state) {
      if (state is LoadSuccess) {
        Language lang = state.data;
        return Scaffold(
          backgroundColor: ColorApp.darkGreen,
          appBar: AppBarWidget(title: lang.levelMemBer),
          // drawer: const ItemDrawer(),
          body: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                color: ColorApp.background),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 20),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: const [
                                ClipOval(
                                    child: LoadImage(
                                  url:
                                      'https://3.pik.vn/e1ec72b6-6b34-4e8b-89f2-ddd51e333d9d.jpg',
                                  height: 90,
                                  width: 90,
                                  fit: BoxFit.cover,
                                )),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Quỳnh Anh',
                                        style: StyleApp.textStyle700(
                                            fontSize: 21,
                                            color: ColorApp.dark252525),
                                      ),
                                      const Gap(12),
                                      InkWell(
                                          onTap: () => Navigator.pushNamed(
                                              context,
                                              RouterName.profileScreen),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/svg/pencil.svg',
                                                width: 18,
                                              ),
                                              const Gap(5),
                                              Text(
                                                'Sửa hồ sơ',
                                                style: StyleApp.textStyle400(
                                                    color: ColorApp
                                                        .bottomBarABCA74,
                                                    fontSize: 17),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(22)),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 18),
                                          backgroundColor:
                                              ColorApp.orangeFFC94D),
                                      onPressed: () {},
                                      child: Row(
                                        children: [
                                          Text(
                                            'Joy Vàng ',
                                            style: StyleApp.textStyle600(
                                                color: ColorApp.background,
                                                fontSize: 16),
                                          ),
                                          const Icon(Icons.arrow_forward_ios,
                                              size: 13,
                                              color: ColorApp.background)
                                        ],
                                      )),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 115,
                                        height: 6,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          child: LinearProgressIndicator(
                                            value: 0.58,
                                            valueColor:
                                                const AlwaysStoppedAnimation<Color>(
                                                    ColorApp.bottomBarABCA74),
                                            backgroundColor: ColorApp.grey82
                                                .withOpacity(0.3),
                                          ),
                                        ),
                                      ),
                                      const Gap(5),
                                      Text(
                                        '58 %',
                                        style: StyleApp.textStyle500(
                                            fontSize: 15,
                                            color: ColorApp.dark500),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(18),
                            RichText(
                              text: TextSpan(
                                  text: ' ${lang.xinChao} ,',
                                  style: StyleApp.textStyle700(
                                      fontSize: 20,
                                      color: ColorApp.dark252525),
                                  children: [
                                    TextSpan(
                                      text: ' Quỳnh Anh ',
                                      style: StyleApp.textStyle700(
                                          fontSize: 20,
                                          color: ColorApp.bottomBarABCA74),
                                    ),
                                    TextSpan(
                                      text: '!',
                                      style: StyleApp.textStyle700(
                                          fontSize: 20,
                                          color: ColorApp.dark252525),
                                    ),
                                  ]),
                            ),
                            const Gap(8),
                            RichText(
                              text: TextSpan(
                                  text:
                                      'Bạn đang là thành viên vàng ,bạn còn thiếu ',
                                  style: StyleApp.textStyle500(
                                      fontSize: 15, color: ColorApp.dark500),
                                  children: [
                                    TextSpan(
                                        text: '₫ 6,453,000 ',
                                        style: StyleApp.styleGilroy700(
                                            color: ColorApp.darkGreen,
                                            fontSize: 16)),
                                    TextSpan(
                                        text:
                                            'để trở thành Joy Kim Cương.',
                                        style: StyleApp.textStyle500(
                                            fontSize: 15,
                                            color: ColorApp.dark500)),
                                  ]),
                            ),
                            const Gap(15),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: ColorApp.backgroundF6F6EF),
                              child: Padding(
                                padding: const EdgeInsets.all(18),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Joy Vàng',
                                          style: StyleApp.textStyle600(
                                              color: ColorApp.dark252525,
                                              fontSize: 15),
                                        ),
                                        Text(
                                          'Joy Kim Cương',
                                          style: StyleApp.textStyle600(
                                              color: ColorApp.dark252525,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      width: double.infinity,
                                      height: 7,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        child: LinearProgressIndicator(
                                          value: 0.5,
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                      Color>(
                                                  ColorApp.bottomBarABCA74),
                                          backgroundColor: ColorApp.grey82
                                              .withOpacity(0.3),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '5,000,000 ₫',
                                          style: StyleApp.textStyle700(
                                              fontSize: 16,
                                              color:
                                                  ColorApp.bottomBarABCA74),
                                        ),
                                        Text(
                                          '10,000,000 ₫',
                                          style: StyleApp.textStyle700(
                                              fontSize: 16,
                                              color:
                                                  ColorApp.bottomBarABCA74),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Gap(25),
                            RichText(
                              text: const TextSpan(
                                text: 'Bạn đang trong thời gian được hưởng ',
                                  style: TextStyle(color: ColorApp.dark500, fontSize: 14),
                                children: [
                                  TextSpan(text: ' ưu đãi thành viên mới ', style: TextStyle(color: ColorApp.darkGreen, fontWeight: FontWeight.bold, backgroundColor: ColorApp.backgroundF5F6EE,fontSize: 14)),
                                  TextSpan(text: ', hãy sử dụng thêm dịch vụ để nhận được thêm ưu đãi.',
                                    style: TextStyle(color: ColorApp.dark500,fontSize: 14),
                                  )
                                ]
                              ),
                            ),
                            const Gap(15),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 20),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    backgroundColor:
                                        ColorApp.bottomBarABCA74),
                                onPressed: () {
                                  Navigator.pushNamed(context,'/saleMenberScreen');
                                },
                                child: Text(
                                  'Tìm hiểu thêm',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.background,
                                      fontSize: 18),
                                )),
                            // selected == true
                            //     ? const SizedBox()
                            //     : Column(
                            //         crossAxisAlignment:
                            //             CrossAxisAlignment.start,
                            //         children: [
                            //           Text(
                            //             'Ưu đãi thành viên mới ',
                            //             style: StyleApp.textStyle700(
                            //                 fontSize: 20,
                            //                 color: ColorApp.dark252525),
                            //           ),
                            //           const Gap(10),
                            //           const TextDescriptionWidget(
                            //               text:
                            //                   'Sử dụng 1 lần khéo dài 6 tháng kể từ lần đầu tiên '),
                            //           const Gap(30),
                            //           Row(
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.start,
                            //             children: const [
                            //               Expanded(
                            //                 flex: 3,
                            //                 child: TitleBroad(
                            //                   title: 'Số tiền tiêu dùng',
                            //                 ),
                            //               ),
                            //               Gap(5),
                            //               Expanded(
                            //                 flex: 4,
                            //                 child: TitleBroad(
                            //                   title:
                            //                       'Doanh thu ban đầu ước tính',
                            //                 ),
                            //               ),
                            //               Gap(5),
                            //               Expanded(
                            //                 flex: 3,
                            //                 child: TitleBroad(
                            //                   title: 'Doanh thu còn lại',
                            //                 ),
                            //               )
                            //             ],
                            //           ),
                            //           const Gap(10),
                            //           ListView.separated(
                            //             physics:
                            //                 const NeverScrollableScrollPhysics(),
                            //             padding: EdgeInsets.zero,
                            //             shrinkWrap: true,
                            //             itemBuilder: (context, index) {
                            //               return Row(
                            //                 children: [
                            //                   Expanded(
                            //                     flex: 3,
                            //                     child: Text(
                            //                       '  ${Const.ConvertPrice.format(listNewMember[index].text1)} đ',
                            //                       style:
                            //                           StyleApp.textStyle500(
                            //                               color: ColorApp
                            //                                   .dark500),
                            //                     ),
                            //                   ),
                            //                   const Gap(5),
                            //                   Expanded(
                            //                     flex: 4,
                            //                     child: Text(
                            //                       '  ${Const.ConvertPrice.format(listNewMember[index].text2)} đ',
                            //                       style:
                            //                           StyleApp.textStyle500(
                            //                               color: ColorApp
                            //                                   .dark500),
                            //                     ),
                            //                   ),
                            //                   const Gap(5),
                            //                   Expanded(
                            //                     flex: 3,
                            //                     child: Text(
                            //                       '  ${Const.ConvertPrice.format(listNewMember[index].text3)} đ',
                            //                       style:
                            //                           StyleApp.textStyle500(
                            //                               color: ColorApp
                            //                                   .dark500),
                            //                     ),
                            //                   ),
                            //                 ],
                            //               );
                            //             },
                            //             separatorBuilder: (context, index) =>
                            //                 const Divider(
                            //               color: ColorApp.dark500,
                            //             ),
                            //             itemCount: listNewMember.length,
                            //           ),
                            //           const Gap(20),
                            //           Text(
                            //             'Lưu ý :',
                            //             style: StyleApp.styleGilroy700(
                            //                 color: ColorApp.darkGreen,
                            //                 fontSize: 18),
                            //           ),
                            //           const TextDescriptionWidget(
                            //               text:
                            //                   'Voucher có hiệu lực 7 ngày kể từ ngày kích hoạt'),
                            //           const Gap(5),
                            //           const TextDescriptionWidget(
                            //               text:
                            //                   'Giới thiệu thêm thành viên mới sẽ được reset lại ưu đãi này khi thành viên mới được giới thiệu đạt mức tiêu dùng 2 triệu'),
                            //           const Gap(40),
                            //           Text(
                            //             'Ưu đãi thành viên cũ ',
                            //             style: StyleApp.textStyle700(
                            //                 fontSize: 20,
                            //                 color: ColorApp.dark252525),
                            //           ),
                            //           const Gap(10),
                            //           const TextDescriptionWidget(
                            //               text:
                            //                   'Chỉ áp dụng khi ưu đãi thành viên mới kết thúc, không áp dụng đồng thời'),
                            //           const Gap(10),
                            //           Row(
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.start,
                            //             children: const [
                            //               Expanded(
                            //                 flex: 3,
                            //                 child: TitleBroad(
                            //                   title: 'Hạng thành viên',
                            //                 ),
                            //               ),
                            //               Gap(5),
                            //               Expanded(
                            //                 flex: 4,
                            //                 child: TitleBroad(
                            //                   title:
                            //                       'Mức lên hạng (trong 365 ngày gần nhất)',
                            //                 ),
                            //               ),
                            //               Gap(5),
                            //               Expanded(
                            //                 flex: 3,
                            //                 child: TitleBroad(
                            //                   title: 'Doanh thu còn lại',
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //           const Gap(15),
                            //           ListView.separated(
                            //             physics:
                            //                 const NeverScrollableScrollPhysics(),
                            //             padding: EdgeInsets.zero,
                            //             shrinkWrap: true,
                            //             itemBuilder: (context, index) {
                            //               return Row(
                            //                 children: [
                            //                   Expanded(
                            //                     flex: 3,
                            //                     child: Text(
                            //                       listOldMember[index].text1,
                            //                       style:
                            //                           StyleApp.textStyle500(
                            //                               color: ColorApp
                            //                                   .dark500),
                            //                     ),
                            //                   ),
                            //                   const Gap(5),
                            //                   Expanded(
                            //                     flex: 4,
                            //                     child: Text(
                            //                       '  ${Const.ConvertPrice.format(listOldMember[index].text2)} đ',
                            //                       style:
                            //                           StyleApp.textStyle500(
                            //                               color: ColorApp
                            //                                   .dark500),
                            //                     ),
                            //                   ),
                            //                   const Gap(5),
                            //                   Expanded(
                            //                     flex: 3,
                            //                     child: Text(
                            //                       '  ${Const.ConvertPrice.format(listOldMember[index].text3)} %',
                            //                       style:
                            //                           StyleApp.textStyle500(
                            //                               color: ColorApp
                            //                                   .dark500),
                            //                     ),
                            //                   ),
                            //                 ],
                            //               );
                            //             },
                            //             separatorBuilder: (context, index) =>
                            //                 const Divider(
                            //               color: ColorApp.dark500,
                            //             ),
                            //             itemCount: listOldMember.length,
                            //           ),
                            //           const Gap(15),
                            //           Text(
                            //             'Ưu đãi cho Member',
                            //             style: StyleApp.styleGilroy700(
                            //                 color: ColorApp.darkGreen,
                            //                 fontSize: 16),
                            //           ),
                            //           const Gap(15),
                            //           const TextDescriptionWidget(
                            //               text:
                            //                   'Khi review dịch vụ giảm giá 2% cho lần booking tiếp theo')
                            //         ],
                            //       )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
      return const SizedBox();
    });
  }
}

class TextDescriptionWidget extends StatelessWidget {
  const TextDescriptionWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: StyleApp.textStyle500(color: ColorApp.dark500),
    );
  }
}

class TitleBroad extends StatelessWidget {
  const TitleBroad({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: StyleApp.textStyle600(color: ColorApp.grey82),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class InforCollum {
  InforCollum(
    this.text1,
    this.text2,
    this.text3,
  );

  final int text1;
  final int text2;
  final int text3;
}

class InforCollum1 {
  InforCollum1(
    this.text1,
    this.text2,
    this.text3,
  );

  final String text1;
  final int text2;
  final int text3;
}

