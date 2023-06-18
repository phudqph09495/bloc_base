import 'package:bloc_base/bloc/language/bloc_lang.dart';
import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/router/router.dart';

import 'package:bloc_base/widget/drawler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../bloc/state_bloc.dart';
import '../../../config/const.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/button.dart';
import '../../../widget/item/load_image.dart';
import '../../../widget/item/notification_widget.dart';

import '../history_screen/history_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ItemDrawer(),
      key: _scaffoldKey,
      body:
          BlocBuilder<BlocLang, StateBloc>(builder: (context, StateBloc state) {
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
                            // Container(
                            //     width: MediaQuery.of(context).size.width * 0.6,
                            //     child: SvgPicture.asset('assets/svg/LogoApp.svg')),
                            InkWell(
                              onTap: () {
                                _scaffoldKey.currentState!.openDrawer();
                              },
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
                              children: [
                                ClipOval(
                                    child: LoadImage(
                                  url:
                                      'https://3.pik.vn/e1ec72b6-6b34-4e8b-89f2-ddd51e333d9d.jpg',
                                  height: 70,
                                  width: 70,
                                  fit: BoxFit.cover,
                                )),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: InkWell(
                                      child: Container(
                                          height: 25,
                                          width: 25,
                                          decoration: const BoxDecoration(
                                              color: ColorApp.orange,
                                              shape: BoxShape.circle),
                                          child: const Icon(
                                            Icons.camera_alt,
                                            size: 16,
                                            color: Colors.white,
                                          )),
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
                                        color: ColorApp.orange,
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
                                  )
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
                color: ColorApp.whiteF0,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  lang.lichSu,
                                  style: StyleApp.textStyle700(
                                      color: ColorApp.dark252525),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HistoryScreen()));
                                  },
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/svg/history.svg'),
                                      Text(
                                        ' ${lang.xemLichSu}',
                                        style: StyleApp.textStyle400(
                                            color: ColorApp.dark500),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Const.size(context).width * 0.025,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _SquareButton(
                                  text: lang.lichDaDat,
                                  imageUrl: 'assets/svg/lichDaDat.svg',
                                  onTap: () => Navigator.pushNamed(
                                      context, RouterName.historyScreen),
                                ),
                                _SquareButton(
                                  text: lang.goiDaDat,
                                  imageUrl: 'assets/svg/goiDaDat.svg',
                                  onTap: () => Navigator.pushNamed(
                                      context, RouterName.bookedPackageScreen),
                                ),
                                _SquareButton(
                                  text: lang.yeuThich,
                                  imageUrl: 'assets/svg/heart.svg',
                                  onTap: () => Navigator.pushNamed(
                                      context, RouterName.favouriteScreen),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Const.size(context).width * 0.04,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Const.size(context).width * 0.08,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 28),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                lang.taiKhoan,
                                style: StyleApp.textStyle700(
                                    color: ColorApp.dark252525, fontSize: 16),
                              ),
                              SizedBox(
                                height:
                                    Const.size(context).width * 0.03179487179,
                              ),
                              _SettingOption(
                                text: lang.ngonNgu,
                                preLinkUrl: "assets/svg/language.svg",
                                subText: lang.string1,
                                onTap: () {},
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: ColorApp.whiteF0,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Const.size(context).width *
                                          0.03846153846,
                                      vertical: Const.size(context).width *
                                          0.03076923076),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/svg/tinNhan.svg'),
                                          Text(
                                            '  ${lang.tinNhan}',
                                            style: StyleApp.textStyle500(
                                                color: ColorApp.black3F),
                                          )
                                        ],
                                      ),
                                      const Icon(
                                        Icons.arrow_circle_right_outlined,
                                        size: 18,
                                        color: ColorApp.darkGreen,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              _SettingOption(
                                text: lang.danhGiaCuaToi,
                                subText: "23",
                                preLinkUrl: 'assets/svg/star.svg',
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => SimpleDialog(
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30.0))),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 12),
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const Gap(40),
                                                  SvgPicture.asset(
                                                      'assets/svg/LogoApp.svg'),
                                                  const Gap(40),
                                                  Text(
                                                    textAlign: TextAlign.center,
                                                    lang.tksForUseMyService,
                                                    style:
                                                        StyleApp.styleGilroy700(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  const Gap(10),
                                                  Text(
                                                    textAlign: TextAlign.center,
                                                    lang.plsRattingForHelpUs,
                                                    style:
                                                        StyleApp.textStyle500(),
                                                  ),
                                                  const Gap(30),
                                                  const Divider(),
                                                  RatingBar.builder(
                                                    glowColor: Colors.red,
                                                    initialRating: 0,
                                                    minRating: 1,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 4.0),
                                                    itemBuilder: (context, _) =>
                                                        const Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                    onRatingUpdate: (rating) {},
                                                  ),
                                                  const Divider(),
                                                  const Gap(25),
                                                  InkWell(
                                                    onTap: () =>
                                                        Navigator.pop(context),
                                                    child: Text(
                                                      lang.later.toUpperCase(),
                                                      style: StyleApp
                                                          .styleGilroy700(),
                                                    ),
                                                  ),
                                                  const Gap(30)
                                                ],
                                              ),
                                            ],
                                          ));
                                },
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              _SettingOption(
                                text: lang.uuDai,
                                preLinkUrl: 'assets/svg/coupon.svg',
                                onTap: () {},
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              _SettingOption(
                                text: lang.matKhau,
                                preLinkUrl: 'assets/svg/matKhau.svg',
                                onTap: () {},
                              ),
                              const Gap(10),
                              ButtonWidget(
                                type: ButtonType.secondary,
                                text: lang.dangKyDoiTac.toUpperCase(),
                                onTap: () => Navigator.pushNamed(
                                    context, RouterName.registerMemberScreen),
                              ),
                              SizedBox(
                                height: Const.size(context).width * 0.08,
                              ),
                              Text(
                                lang.thongTin,
                                style: StyleApp.textStyle700(
                                    color: ColorApp.dark252525, fontSize: 16),
                              ),
                              SizedBox(
                                height:
                                    Const.size(context).width * 0.03179487179,
                              ),
                              _SettingOption(
                                text: lang.ttHT,
                                preLinkUrl: 'assets/svg/ttHt.svg',
                                onTap: () {},
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              _SettingOption(
                                text: lang.cauHoiThuongGap,
                                preLinkUrl: 'assets/svg/cauHoi.svg',
                                onTap: () {
                                  Navigator.pushNamed(context,
                                      RouterName.frequentlyQuestionScreen);
                                },
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              _SettingOption(
                                text: lang.gioiThieu,
                                preLinkUrl: 'assets/svg/gioiThieu.svg',
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouterName.introduceScreen);
                                },
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              _SettingOption(
                                text: lang.dieuKhoanSuDung,
                                preLinkUrl: 'assets/svg/dieuKhoanSuDung.svg',
                                onTap: () {},
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              _SettingOption(
                                text: lang.caiDat,
                                preLinkUrl: 'assets/svg/caiDat.svg',
                                onTap: () {},
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              _SettingOption(
                                text: lang.dangXuat,
                                preLinkUrl: 'assets/svg/dangXuat.svg',
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouterName.noConnectScreen);
                                },
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              SizedBox(
                                height: Const.size(context).width * 0.2,
                              ),
                            ],
                          ),
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

class _SquareButton extends StatelessWidget {
  const _SquareButton({
    required this.text,
    required this.imageUrl,
    required this.onTap,
  });

  final String text;
  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Const.size(context).width * 0.28205128205,
        height: Const.size(context).width * 0.25076923076,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(imageUrl),
            Text(
              text,
              style: StyleApp.textStyle600(color: ColorApp.dark252525),
            )
          ],
        ),
      ),
    );
  }
}

class _SettingOption extends StatelessWidget {
  const _SettingOption({
    required this.text,
    this.subText,
    required this.preLinkUrl,
    required this.onTap,
  });

  final String text;
  final String? subText;
  final String preLinkUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: ColorApp.whiteF0, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 13,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset(preLinkUrl),
                    const Gap(12),
                    Text(
                      text,
                      // '  ${lang.ngonNgu}',
                      style: StyleApp.textStyle500(color: ColorApp.black3F),
                    )
                  ],
                ),
              ),
              subText != null
                  ? Text(
                      subText!,
                      style: StyleApp.textStyle500(color: ColorApp.black3F),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}