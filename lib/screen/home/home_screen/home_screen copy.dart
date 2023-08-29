import 'package:bloc_base/bloc/language/bloc_lang.dart';
import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/config/const.dart';
import 'package:bloc_base/widget/drawler.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../../bloc/state_bloc.dart';
import '../../../router/router.dart';
import '../../../styles/init_style.dart';
import '../../../styles/utils.dart';
import '../../../widget/item/input/text_filed.dart';

import '../../../widget/item/notification_widget.dart';
import 'widget/list_spa_more_screen.dart';

class HomeScreenTest extends StatefulWidget {
  const HomeScreenTest({Key? key}) : super(key: key);

  @override
  State<HomeScreenTest> createState() => _HomeScreenTestState();
}

class _HomeScreenTestState extends State<HomeScreenTest> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> listSer = ['Triệt lông', ' Chăm Sóc Da Mặt', 'Massage', 'Tóc'];
  bool showmore = false;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorApp.background,
        drawer: const ItemDrawer(),
        key: _scaffoldKey,
        body: BlocBuilder<BlocLanguage, StateBloc>(
          builder: (context, StateBloc state) {
            if (state is LoadSuccess) {
              Language language = state.data;
              return GestureDetector(
                  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        backgroundColor: ColorApp.backgroundF5F6EE,
                        elevation: 0,
                        flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          title: Image.asset(
                            'assets/images/logo_app.png',
                            height: Const.sizeHeight(context, 55),
                          ),
                          background: Image.asset(
                            'assets/images/background_appbar.png',
                            height: Const.sizeHeight(context, 200),
                            fit: BoxFit.fitHeight,
                          ),
                        ),

                        expandedHeight: Const.sizeHeight(context, 200),
                        floating: true,
                        pinned: true,

                        // flexibleSpace: Const.sizeHeight(context, 160),
                        leading: InkWell(
                          onTap: () {
                            _scaffoldKey.currentState!.openDrawer();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: SvgPicture.asset(
                              'assets/svg/Vector.svg',
                              height: Const.sizeHeight(context, 55),
                            ),
                          ),
                        ),
                        title: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: SvgPicture.asset('assets/svg/LogoApp.svg')),
                        actions: [
                          InkWell(
                            child: const Icon(
                              Icons.qr_code_scanner,
                              size: 25,
                            ),
                            onTap: () async {
                              var res = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SimpleBarcodeScannerPage(
                                      cancelButtonText: language.huyBo,
                                    ),
                                  ));
                              setState(() {
                                if (res is String) {
                                  Navigator.pushNamed(
                                      context, RouterName.confirmScreen);
                                }
                              });
                            },
                          ),
                          const NotificationButton(),
                        ],
                      ),
                      SliverToBoxAdapter(
                        child: Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18, right: 18, top: 25),
                                  child: _listService(language, context),
                                ),
                                _discoveryNearYou(fem, context, language, ffem),
                                // Image.asset('assets/images/bannerHome.png'),
                                ImageSlideshow(
                                  height:
                                      MediaQuery.of(context).size.height * 0.14,
                                  width: MediaQuery.of(context).size.width - 32,
                                  indicatorColor: ColorApp.bottomBarABCA74,
                                  isLoop: true,
                                  autoPlayInterval: 5000,
                                  children: List.generate(
                                      3,
                                      (index) => ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image.asset(
                                              'assets/images/bannerHome.png',
                                              fit: BoxFit.fitHeight,
                                            ),
                                          )),
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18,
                                      vertical: 18,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 232,
                                              child: Image.asset(
                                                'assets/images/bannerAds1.png',
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                            const Gap(12),
                                            Expanded(
                                              flex: 110,
                                              child: Image.asset(
                                                'assets/images/bannerAds2.png',
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                'assets/images/bannerAds3.png',
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                            const Gap(12),
                                            Expanded(
                                              child: Image.asset(
                                                'assets/images/bannerAds4.png',
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height:
                                              Const.size(context).width * 0.05,
                                        ),
                                        DottedBorder(
                                            borderType: BorderType.RRect,
                                            radius: const Radius.circular(15),
                                            color: ColorApp.pinkF59398,
                                            dashPattern: const [5, 1],
                                            child: Padding(
                                              padding: const EdgeInsets.all(3),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: Const.size(context)
                                                            .width *
                                                        0.6,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            ColorApp.pinkF59398,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12)),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(12),
                                                          child: SvgPicture.asset(
                                                              'assets/svg/discount.svg'),
                                                        ),
                                                        Text(
                                                          'Giảm giá 15% cho lần đầu \nđặt qua App',
                                                          style: StyleApp
                                                              .textStyle700(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 13),
                                                        ),
                                                        // const SizedBox(),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 16),
                                                    child: Text(
                                                      'Nhận Ngay',
                                                      style:
                                                          StyleApp.textStyle700(
                                                              color: ColorApp
                                                                  .pinkF59398,
                                                              fontSize: 13),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                        const SizedBox(
                                          height: 26,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              language.danhGiaCaoNhat,
                                              style: StyleApp.textStyle700(
                                                  color: ColorApp.dark252525,
                                                  fontSize: 18),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  showmore = true;
                                                });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    10 * fem,
                                                    6 * fem,
                                                    13 * fem,
                                                    4 * fem),
                                                width: 102 * fem,
                                                height: 27 * fem,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffffc94d),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7 * fem),
                                                ),
                                                child: SizedBox(
                                                  // group56G8 (157:9170)
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  child: Container(
                                                    // xemthmwnY (157:9174)
                                                    margin: EdgeInsets.fromLTRB(
                                                        0 * fem,
                                                        1 * fem,
                                                        0 * fem,
                                                        0 * fem),
                                                    child: Center(
                                                      child: Text('Xem Thêm',
                                                          style: StyleApp
                                                              .styleGilroy700(
                                                                  fontSize: 12,
                                                                  color: const Color(
                                                                      0xff252525))),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        showmore
                                            ? const MoreSpaScreen()
                                            : GridView.builder(
                                                padding: EdgeInsets.zero,
                                                gridDelegate:
                                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                                        maxCrossAxisExtent: 200,
                                                        crossAxisSpacing: 12,
                                                        mainAxisSpacing: 20),
                                                itemCount: 6,
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemBuilder:
                                                    (BuildContext ctx, index) {
                                                  return const IntroduceSpaWidget();
                                                }),
                                        SizedBox(
                                          height:
                                              Const.size(context).width * 0.2,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  SizedBox _discoveryNearYou(
      double fem, BuildContext context, Language language, double ffem) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              // autogroupkubnXVJ (WiaWecQA7afnEnGakiKuBN)
              width: double.infinity,
              height: 290 * fem,
              child: Stack(
                children: [
                  Positioned(
                    // group3JZE (157:9162)

                    child: Container(
                      width: 372 * fem,
                      height: 317 * fem,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/page-1/images/vector-1EY.png',
                          ),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: Const.size(context).width * 0.09),
                          child: SizedBox(
                            height: Const.size(context).width * 0.4,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, RouterName.infoSpaScreen);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                                size: 10,
                                              ),
                                              const Gap(3),
                                              Text(
                                                '2.3 km',
                                                style: StyleApp.textStyle600(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                          Image.asset(
                                            'assets/images/exKhamPha.png',
                                            width: Const.size(context).width *
                                                0.25,
                                            height: Const.size(context).width *
                                                0.22,
                                          ),
                                          SizedBox(
                                            width: Const.size(context).width *
                                                0.25,
                                            child: Text('Sorella Beauty ',
                                                style: StyleApp.textStyle600(
                                                    fontSize: 14,
                                                    color: Colors.white)),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: ColorApp.yellow,
                                                size: 16,
                                              ),
                                              const Gap(3),
                                              Text(
                                                '4.8',
                                                style: StyleApp.textStyle500(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: 10,
                                physics: const AlwaysScrollableScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // khmphgnbnJxY (157:9167)
                    left: 18 * fem,
                    top: 54 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 180 * fem,
                        height: 23 * fem,
                        child: Text(
                          language.khamPhaGanBan,
                          style: StyleApp.styleGilroy700(
                            fontSize: 18,
                            color: ColorApp.background,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // group6z4g (157:9168)
                    left: 256 * fem,
                    top: 50 * fem,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          10 * fem, 6 * fem, 13 * fem, 4 * fem),
                      width: 101 * fem,
                      height: 27 * fem,
                      decoration: BoxDecoration(
                        color: const Color(0xffffc94d),
                        borderRadius: BorderRadius.circular(7 * fem),
                      ),
                      child: SizedBox(
                        // group56G8 (157:9170)
                        width: double.infinity,
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // frame3BN (157:9171)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 5 * fem, 0 * fem),
                              width: 14 * fem,
                              height: 14 * fem,
                              child: Image.asset(
                                'assets/page-1/images/frame-LNU.png',
                                width: 14 * fem,
                                height: 14 * fem,
                              ),
                            ),
                            Container(
                              // xemthmwnY (157:9174)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 1 * fem, 0 * fem, 0 * fem),
                              child: Text(
                                'Xem Thêm',
                                style: StyleApp.styleGilroy700(
                                  fontSize: 12,
                                  color: const Color(0xff252525),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _listService(Language language, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          language.dichvu,
          style: StyleApp.textStyle700(fontSize: 18),
        ),
        SizedBox(
          height: Const.size(context).width * 0.05,
        ),
        SizedBox(
          height: Const.size(context).width * 0.29,
          child: ListView.separated(
            separatorBuilder: (context, index) => const Gap(10),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorApp.background),
                height: Const.size(context).width * 0.28,
                width: Const.size(context).width * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset('assets/svg/serviceIcon$index.svg'),
                    Text(
                      listSer[index],
                      style: StyleApp.textStyle600(color: ColorApp.dark252525),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              );
            },
            itemCount: listSer.length,
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
