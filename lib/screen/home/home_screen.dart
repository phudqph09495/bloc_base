import 'package:bloc_base/bloc/language/bloc_lang.dart';
import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/config/const.dart';
import 'package:bloc_base/widget/drawler.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../bloc/state_bloc.dart';
import '../../router/router.dart';
import '../../styles/init_style.dart';
import '../../styles/utils.dart';
import '../../widget/item/appBar.dart';
import '../../widget/item/input/text_filed.dart';
import '../Cart/xacNhanScreen.dart';
import '../ex.dart';
import '../search/info_spa_screen.dart';
import 'list_spa_more_screen.dart';
import 'notifi_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> listSer = ['Triệt lông', ' Chăm Sóc Da Mặt', 'Massage', 'Tóc'];
  bool showmore = false;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      drawer: ItemDrawer(),
      key: _scaffoldKey,
      body: BlocBuilder<BlocLang, StateBloc>(
        builder: (context, StateBloc state) {
          if (state is LoadSuccess) {
            Language language = state.data;
            return Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/images/bgApp.png',
                          fit: BoxFit.fitHeight,
                          width: double.infinity,
                        ),
                        Positioned(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  _scaffoldKey.currentState!.openDrawer();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child:
                                      SvgPicture.asset('assets/svg/Vector.svg'),
                                ),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: SvgPicture.asset(
                                      'assets/svg/LogoApp.svg')),
                              Row(
                                children: [
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
                                          Navigator.pushNamed(context,
                                              RouterName.xacNhanScreen);
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           const XacNhanScreen()),
                                          // );
                                        }
                                      });
                                    },
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, RouterName.notifyScreen);
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             const NotifyScreen()));
                                    },
                                    child: Stack(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(3.0),
                                          child: Icon(
                                            Icons.notifications_none_outlined,
                                            color: ColorApp.dark,
                                            size: 25,
                                          ),
                                        ),
                                        Positioned(
                                            left: 3,
                                            top: 5,
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03,
                                              width: Const.size(context).width *
                                                  0.03,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: ColorApp.orange),
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                        child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Const.size(context).width * 0.025),
                      child: InputText1(
                        label: language.timKiem,
                        hasLeading: true,
                        iconPreFix:
                            const Icon(Icons.search, color: ColorApp.bottomBar),
                        hasSuffix: true,
                        suffix: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                              width: Const.size(context).width * 0.1,
                              decoration: const BoxDecoration(
                                  color: ColorApp.bottomBar,
                                  shape: BoxShape.circle),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    SvgPicture.asset('assets/svg/locator.svg'),
                              )),
                        ),
                      ),
                    )),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Const.size(context).width * 0.025,
                              vertical: Const.size(context).width * 0.06),
                          child: _listService(language, context),
                        ),
                        Container(
                            color: Colors.blue,
                            child: _discoveryNearYou(
                                fem, context, language, ffem)),
                        // Image.asset('assets/images/bannerHome.png'),
                        Container(
                          color: Colors.red,
                          child: ImageSlideshow(
                            height: MediaQuery.of(context).size.height * 0.2,
                            indicatorColor: ColorApp.bottomBar,
                            isLoop: true,
                            autoPlayInterval: 2000,
                            children: List.generate(
                                3,
                                (index) => Image.asset(
                                    'assets/images/bannerHome.png')),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Const.size(context).width * 0.025,
                                vertical: Const.size(context).width * 0.03),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset('assets/images/bannerAds1.png'),
                                    Image.asset('assets/images/bannerAds2.png'),
                                  ],
                                ),
                                SizedBox(
                                  height: Const.size(context).width * 0.06,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset('assets/images/bannerAds3.png'),
                                    Image.asset('assets/images/bannerAds4.png'),
                                  ],
                                ),
                                SizedBox(
                                  height: Const.size(context).width * 0.05,
                                ),
                                DottedBorder(
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(15),
                                    color: ColorApp.pink,
                                    dashPattern: const [5, 1],
                                    child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: Const.size(context).width *
                                                0.688888,
                                            decoration: BoxDecoration(
                                                color: ColorApp.pink,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      Const.size(context)
                                                              .width *
                                                          0.01,
                                                  vertical: Const.size(context)
                                                          .width *
                                                      0.03),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/svg/discount.svg'),
                                                  Text(
                                                    'Giảm giá 15% cho lần đầu đặt qua App',
                                                    style:
                                                        StyleApp.textStyle700(
                                                            color: Colors.white,
                                                            fontSize: 13),
                                                  ),
                                                  const SizedBox(),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right:
                                                    Const.size(context).width *
                                                        0.03277777777),
                                            child: Text(
                                              'Nhận Ngay',
                                              style: StyleApp.textStyle700(
                                                  color: ColorApp.pink,
                                                  fontSize: 13),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: Const.size(context).width * 0.05,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      language.danhGiaCaoNhat,
                                      style: StyleApp.textStyle700(
                                          color: ColorApp.dark, fontSize: 18),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          showmore = true;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(10 * fem,
                                            6 * fem, 13 * fem, 4 * fem),
                                        width: 102 * fem,
                                        height: 27 * fem,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffffc94d),
                                          borderRadius:
                                              BorderRadius.circular(7 * fem),
                                        ),
                                        child: SizedBox(
                                          // group56G8 (157:9170)
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                // frame3BN (157:9171)
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem,
                                                    0 * fem,
                                                    5 * fem,
                                                    0 * fem),
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
                                                    0 * fem,
                                                    1 * fem,
                                                    0 * fem,
                                                    0 * fem),
                                                child: Text(
                                                  'Xem Thêm',
                                                  style: safeGoogleFont(
                                                    'SVN-Gilroy',
                                                    fontSize: 12 * ffem,
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.2575 * ffem / fem,
                                                    letterSpacing:
                                                        0.0120000001 * fem,
                                                    color:
                                                        const Color(0xff252525),
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
                                SizedBox(
                                  height: Const.size(context).width * 0.02,
                                ),
                                showmore
                                    ? const MoreSpaScreen()
                                    : GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent: 200,
                                                crossAxisSpacing: 20,
                                                mainAxisSpacing: 20),
                                        itemCount: 6,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (BuildContext ctx, index) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  RouterName.infoSpaScreen);
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             const InfoSpaScreen()));
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Stack(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/mostRate.png',
                                                        width:
                                                            Const.size(context)
                                                                    .width *
                                                                0.45,
                                                        fit: BoxFit.fitHeight,
                                                      ),
                                                      Container(
                                                          decoration: BoxDecoration(
                                                              color: ColorApp.dark
                                                                  .withOpacity(
                                                                      0.3),
                                                              borderRadius: const BorderRadius
                                                                      .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          15),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          15))),
                                                          child: Padding(
                                                            padding: EdgeInsets.symmetric(
                                                                vertical: Const.size(
                                                                            context)
                                                                        .width *
                                                                    0.0111111111111),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                const SizedBox(),
                                                                Row(
                                                                  children: [
                                                                    const Icon(
                                                                      Icons
                                                                          .location_on,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 15,
                                                                    ),
                                                                    Text(
                                                                      '2.3 km',
                                                                      style: StyleApp.textStyle600(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox()
                                                              ],
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                  Text(
                                                    'Sorella Beauty',
                                                    style:
                                                        StyleApp.textStyle600(
                                                            color:
                                                                ColorApp.dark),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const SizedBox(),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.star,
                                                            color:
                                                                ColorApp.yellow,
                                                          ),
                                                          Text(
                                                            '4.7',
                                                            style: StyleApp
                                                                .textStyle700(
                                                                    color: ColorApp
                                                                        .yellow),
                                                          ),
                                                          Text(' (98)',
                                                              style: StyleApp
                                                                  .textStyle700(
                                                                      color: const Color(
                                                                          0xff717171))),
                                                        ],
                                                      ),
                                                      const SizedBox(),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                SizedBox(
                                  height: Const.size(context).width * 0.3,
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
          return const SizedBox();
        },
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
              height: 317 * fem,
              child: Stack(
                children: [
                  // SvgPicture.asset(
                  //   'assets/svg/map.svg',
                  // ),
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
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RouterName.infoSpaScreen);
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder:
                                    //             (context) =>
                                    //                 const InfoSpaScreen()));
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
                                            ),
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
                                          width:
                                              Const.size(context).width * 0.25,
                                          height:
                                              Const.size(context).width * 0.22,
                                        ),
                                        SizedBox(
                                          width:
                                              Const.size(context).width * 0.25,
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
                                            Text(
                                              '4.8',
                                              style: StyleApp.textStyle600(
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
                  Positioned(
                    // khmphgnbnJxY (157:9167)
                    left: 18 * fem,
                    top: 54 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 156 * fem,
                        height: 23 * fem,
                        child: Text(
                          language.khamPhaGanBan,
                          style: safeGoogleFont(
                            'SVN-Gilroy',
                            fontSize: 18 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.2575 * ffem / fem,
                            letterSpacing: 0.0180000003 * fem,
                            color: const Color(0xffffffff),
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
                                style: safeGoogleFont(
                                  'SVN-Gilroy',
                                  fontSize: 12 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2575 * ffem / fem,
                                  letterSpacing: 0.012 * fem,
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
          child: ListView.builder(
            itemBuilder: (context, index) {
              return SizedBox(
                height: Const.size(context).width * 0.28,
                width: Const.size(context).width * 0.25,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset('assets/svg/serviceIcon$index.svg'),
                      Text(
                        listSer[index],
                        style: StyleApp.textStyle600(color: ColorApp.dark),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
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
