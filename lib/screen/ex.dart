import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/const.dart';
import '../styles/init_style.dart';
import '../styles/utils.dart';
import '../widget/item/input/text_filed.dart';

class Scene extends StatelessWidget {
  const Scene({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    List<String> listSer = ['Triệt lông', ' Chăm Sóc Da Mặt', 'Massage', 'Tóc'];
    return Scaffold(
      body: Column(
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
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SvgPicture.asset('assets/svg/Vector.svg'),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: SvgPicture.asset('assets/svg/LogoApp.svg')),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Stack(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.notifications_none_outlined,
                                      color: ColorApp.dark252525,
                                      size: 25,
                                    ),
                                  ),
                                  Positioned(
                                      left: 3,
                                      top: 5,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                        width: Const.size(context).width * 0.03,
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
                  label: 'Tìm kiếm',
                  hasLeading: true,
                  iconPreFix:
                      const Icon(Icons.search, color: ColorApp.bottomBarABCA74),
                  hasSuffix: true,
                  suffix: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                        decoration: const BoxDecoration(
                            color: ColorApp.bottomBarABCA74,
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Transform.scale(
                              scale: 1,
                              child:
                                  SvgPicture.asset('assets/svg/locator.svg')),
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
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dịch vụ',
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/svg/serviceIcon$index.svg'),
                                        Text(
                                          listSer[index],
                                          style: StyleApp.textStyle600(
                                              color: ColorApp.dark252525),
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
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      // home2uyi (117:10394)
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xfff6f5ef),
                        borderRadius: BorderRadius.circular(40 * fem),
                      ),
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
                                          'KHÁM PHÁ GẦN BẠN',
                                          style: StyleApp.styleGilroy700(
                                              fontSize: 18),
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
                                      width: 98 * fem,
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
                                                      0.0120000002 * fem,
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Text('data')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
