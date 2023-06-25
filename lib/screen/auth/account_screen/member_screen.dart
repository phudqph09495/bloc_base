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
    return Scaffold(
      drawer: const ItemDrawer(),
      body: BlocBuilder<BlocLanguage, StateBloc>(
          builder: (context, StateBloc state) {
        if (state is LoadSuccess) {
          Language lang = state.data;
          return Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/images/bgApp.png'),
                      Positioned(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        Const.size(context).width * 0.025),
                                child: Text(
                                  ' ${lang.xinChao},Quỳnh!',
                                  style: StyleApp.textStyle700(
                                      fontSize: 20, color: ColorApp.dark252525),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child:
                                    SvgPicture.asset('assets/svg/Vector.svg'),
                              ),
                            ),
                            const NotificationButton()
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: const [
                                ClipOval(
                                    child: LoadImage(
                                  url:
                                      'https://3.pik.vn/e1ec72b6-6b34-4e8b-89f2-ddd51e333d9d.jpg',
                                  height: 70,
                                  width: 70,
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
                                  Text(
                                    'Quỳnh Anh',
                                    style: StyleApp.textStyle700(
                                        color: ColorApp.dark252525),
                                  ),
                                  const Gap(6),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: ColorApp.orangeFFC94D,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 5),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Thành viên vàng',
                                            style: StyleApp.textStyle600(
                                                color: ColorApp.dark252525),
                                          ),
                                          const Gap(4),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            size: 10,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Gap(6),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 60,
                                        height: 5,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          child: LinearProgressIndicator(
                                            value: 0.9,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    ColorApp.bottomBarABCA74),
                                            backgroundColor: ColorApp.grey82,
                                          ),
                                        ),
                                      ),
                                      Gap(5),
                                      Text(
                                        '88 %',
                                        style: StyleApp.textStyle500(
                                            fontSize: 12,
                                            color: ColorApp.dark500),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, RouterName.profileScreen),
                            child: SvgPicture.asset('assets/svg/pencil.svg')),
                      ],
                    ),
                  )),
                ],
              ),
              Expanded(
                  child: Container(
                color: ColorApp.background,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(18),
                            InputText1(
                              colorBg: ColorApp.background,
                              radius: 12,
                              controller: uuDaiController,
                              label: 'Ưu đãi',
                              readOnly: true,
                              hasSuffix: true,
                              onTap: () {
                                BottomSheetInforService.selecteRadioBottomSheet(
                                    context,
                                    'Thành viên',
                                    listFilter,
                                    selectedIndex,
                                    uuDaiController);
                              },
                              suffix:
                                  const Icon(Icons.keyboard_arrow_down_rounded),
                            ),
                            const Gap(25),
                            Text(
                              ' ${lang.xinChao},Quỳnh!',
                              style: StyleApp.textStyle700(
                                  fontSize: 20, color: ColorApp.dark252525),
                            ),
                            const Gap(5),
                            RichText(
                              text: TextSpan(
                                  text:
                                      'Bạn đang là thành viên vàng ,bạn còn thiếu ',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.dark500),
                                  children: [
                                    TextSpan(
                                        text: 'đ 64.513 ',
                                        style: StyleApp.styleGilroy700(
                                            color: ColorApp.darkGreen,
                                            fontSize: 16)),
                                    TextSpan(
                                        text:
                                            'nữa để trờ thành thành viên Kim Cương ',
                                        style: StyleApp.textStyle500(
                                            color: ColorApp.dark500)),
                                  ]),
                            ),
                            const Gap(15),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorApp.backgroundF5F6EE),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
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
                                              fontSize: 14),
                                        ),
                                        Text(
                                          'Joy Kim Cương',
                                          style: StyleApp.textStyle600(
                                              color: ColorApp.dark252525,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      width: double.infinity,
                                      height: 5,
                                      child: const ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        child: LinearProgressIndicator(
                                          value: 0.7,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  ColorApp.bottomBarABCA74),
                                          backgroundColor: ColorApp.grey82,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '5000000 đ',
                                          style: StyleApp.textStyle600(
                                              fontSize: 16,
                                              color: ColorApp.bottomBarABCA74),
                                        ),
                                        Text(
                                          '10000000',
                                          style: StyleApp.textStyle600(
                                              fontSize: 16,
                                              color: ColorApp.bottomBarABCA74),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Gap(25),
                            Text(
                              'Ưu đãi thành viên mới ',
                              style: StyleApp.textStyle700(
                                  fontSize: 20, color: ColorApp.dark252525),
                            ),
                            const Gap(10),
                            const TextDescriptionWidget(
                                text:
                                    'Sử dụng 1 lần khéo dài 6 tháng kể từ lần đầu tiên '),
                            const Gap(30),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Expanded(
                                  flex: 3,
                                  child: TitleBroad(
                                    title: 'Số tiền tiêu dùng',
                                  ),
                                ),
                                Gap(5),
                                Expanded(
                                  flex: 4,
                                  child: TitleBroad(
                                    title: 'Doanh thu ban đầu ước tính',
                                  ),
                                ),
                                Gap(5),
                                Expanded(
                                  flex: 3,
                                  child: TitleBroad(
                                    title: 'Doanh thu còn lại',
                                  ),
                                )
                              ],
                            ),
                            const Gap(10),
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        '  ${Const.ConvertPrice.format(listNewMember[index].text1)} đ',
                                        style: StyleApp.textStyle500(
                                            color: ColorApp.dark500),
                                      ),
                                    ),
                                    Gap(5),
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        '  ${Const.ConvertPrice.format(listNewMember[index].text2)} đ',
                                        style: StyleApp.textStyle500(
                                            color: ColorApp.dark500),
                                      ),
                                    ),
                                    Gap(5),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        '  ${Const.ConvertPrice.format(listNewMember[index].text3)} đ',
                                        style: StyleApp.textStyle500(
                                            color: ColorApp.dark500),
                                      ),
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                color: ColorApp.dark500,
                              ),
                              itemCount: listNewMember.length,
                            ),
                            const Gap(20),
                            Text(
                              'Lưu ý :',
                              style: StyleApp.styleGilroy700(
                                  color: ColorApp.darkGreen, fontSize: 18),
                            ),
                            const TextDescriptionWidget(
                                text:
                                    'Voucher có hiệu lực 7 ngày kể từ ngày kích hoạt'),
                            const Gap(5),
                            const TextDescriptionWidget(
                                text:
                                    'Giới thiệu thêm thành viên mới sẽ được reset lại ưu đãi này khi thành viên mới được giới thiệu đạt mức tiêu dùng 2 triệu'),
                            Gap(40),
                            Text(
                              'Ưu đãi thành viên cũ ',
                              style: StyleApp.textStyle700(
                                  fontSize: 20, color: ColorApp.dark252525),
                            ),
                            Gap(10),
                            const TextDescriptionWidget(
                                text:
                                    'Chỉ áp dụng khi ưu đãi thành viên mới kết thúc, không áp dụng đồng thời'),
                            Gap(10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Expanded(
                                  flex: 3,
                                  child: TitleBroad(
                                    title: 'Hạng thành viên',
                                  ),
                                ),
                                Gap(5),
                                Expanded(
                                  flex: 4,
                                  child: TitleBroad(
                                    title:
                                        'Mức lên hạng (trong 365 ngày gần nhất)',
                                  ),
                                ),
                                Gap(5),
                                Expanded(
                                  flex: 3,
                                  child: TitleBroad(
                                    title: 'Doanh thu còn lại',
                                  ),
                                ),
                              ],
                            ),
                            const Gap(15),
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        listOldMember[index].text1,
                                        style: StyleApp.textStyle500(
                                            color: ColorApp.dark500),
                                      ),
                                    ),
                                    Gap(5),
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        '  ${Const.ConvertPrice.format(listOldMember[index].text2)} đ',
                                        style: StyleApp.textStyle500(
                                            color: ColorApp.dark500),
                                      ),
                                    ),
                                    Gap(5),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        '  ${Const.ConvertPrice.format(listOldMember[index].text3)} %',
                                        style: StyleApp.textStyle500(
                                            color: ColorApp.dark500),
                                      ),
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                color: ColorApp.dark500,
                              ),
                              itemCount: listOldMember.length,
                            ),
                            const Gap(15),
                            Text(
                              'Ưu đãi cho Member',
                              style: StyleApp.styleGilroy700(
                                  color: ColorApp.darkGreen, fontSize: 16),
                            ),
                            const Gap(15),
                            const TextDescriptionWidget(
                                text:
                                    'Khi review dịch vụ giảm giá 2% cho lần booking tiếp theo')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ))
            ],
          );
        }
        return const SizedBox();
      }),
    );
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
