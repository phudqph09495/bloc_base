import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/language/bloc_lang.dart';
import '../../bloc/language/event_bloc2.dart';
import '../../bloc/state_bloc.dart';
import '../../config/const.dart';
import '../../styles/init_style.dart';
import '../../widget/drawler.dart';
import '../../widget/item/input/text_filed.dart';
import '../search/info_spa_screen.dart';
import 'notifi_screen.dart';

class MoreSpaScreen extends StatefulWidget {
  const MoreSpaScreen({Key? key}) : super(key: key);

  @override
  State<MoreSpaScreen> createState() => _MoreSpaScreenState();
}

class _MoreSpaScreenState extends State<MoreSpaScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    double ffem = fem * 0.97;

    return   BlocBuilder<BlocLang, StateBloc>(builder: (context, StateBloc state) {
      if (state is LoadSuccess) {
        Language lang = state.data;
        return Column(
          children: [
            // Stack(
            //   alignment: Alignment.bottomCenter,
            //   children: [
            //     Stack(
            //       alignment: Alignment.center,
            //       children: [
            //         Image.asset('assets/images/bgApp.png'),
            //         Positioned(
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Expanded(
            //                 child: Padding(
            //                   padding: EdgeInsets.symmetric(
            //                       horizontal:
            //                       Const.size(context).width * 0.025),
            //                   child: InputText1(
            //                     label: '${lang.timKiem}',
            //                     hasLeading: true,
            //                     iconPreFix: Icon(Icons.search,
            //                         color: ColorApp.bottomBar),
            //                     hasSuffix: false,
            //                   ),
            //                 ),
            //               ),
            //               // Container(
            //               //     width: MediaQuery.of(context).size.width * 0.6,
            //               //     child: SvgPicture.asset('assets/svg/LogoApp.svg')),
            //               InkWell(
            //                 onTap: () {
            //                   _scaffoldKey.currentState!.openDrawer();
            //                 },
            //                 child: Padding(
            //                   padding: EdgeInsets.symmetric(horizontal: 10),
            //                   child:
            //                   SvgPicture.asset('assets/svg/Vector.svg'),
            //                 ),
            //               ),
            //
            //               InkWell(
            //                 onTap: () {
            //                   Navigator.push(
            //                       context,
            //                       MaterialPageRoute(
            //                           builder: (context) => NotifyScreen()));
            //                 },
            //                 child: Container(
            //                   child: Stack(
            //                     children: [
            //                       Padding(
            //                         padding: const EdgeInsets.all(3.0),
            //                         child: Icon(
            //                           Icons.notifications_none_outlined,
            //                           color: ColorApp.dark,
            //                           size: 25,
            //                         ),
            //                       ),
            //                       Positioned(
            //                           left: 3,
            //                           top: 5,
            //                           child: Container(
            //                             height: MediaQuery.of(context)
            //                                 .size
            //                                 .width *
            //                                 0.03,
            //                             width:
            //                             Const.size(context).width * 0.03,
            //                             decoration: BoxDecoration(
            //                                 shape: BoxShape.circle,
            //                                 color: ColorApp.orange),
            //                           ))
            //                     ],
            //                   ),
            //                 ),
            //               )
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //     Positioned(
            //         child: Padding(
            //           padding: EdgeInsets.symmetric(
            //               horizontal: Const.size(context).width * 0.025),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               InkWell(
            //
            //                 child: Container(
            //                   decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(20)),
            //                   width: Const.size(context).width * 0.43846153846,
            //                   child: Card(
            //                     shape: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.circular(20),
            //                       //set border radius more than 50% of height and width to make circle
            //                     ),
            //                     child: Padding(
            //                       padding: EdgeInsets.only(
            //                           top: Const.size(context).width *
            //                               0.04615384615,
            //                           bottom: Const.size(context).width *
            //                               0.04615384615,
            //                           right: Const.size(context).width *
            //                               0.07948717948,
            //                           left: Const.size(context).width *
            //                               0.04615384615),
            //                       child: Row(
            //                         mainAxisAlignment:
            //                         MainAxisAlignment.spaceBetween,
            //                         children: [
            //                           SvgPicture.asset(
            //                               'assets/svg/filterIcon.svg'),
            //                           Text(
            //                             '${lang.locKQ}',
            //                             style: StyleApp.textStyle700(),
            //                           )
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               Container(
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(20)),
            //                 width: Const.size(context).width * 0.43846153846,
            //                 child: Card(
            //                   shape: RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(20),
            //                     //set border radius more than 50% of height and width to make circle
            //                   ),
            //                   child: Padding(
            //                     padding: EdgeInsets.only(
            //                         top:
            //                         Const.size(context).width * 0.04615384615,
            //                         bottom:
            //                         Const.size(context).width * 0.04615384615,
            //                         left:
            //                         Const.size(context).width * 0.07948717948,
            //                         right: Const.size(context).width *
            //                             0.04615384615),
            //                     child: Row(
            //                       mainAxisAlignment:
            //                       MainAxisAlignment.spaceBetween,
            //                       children: [
            //                         Text(
            //                           '${lang.xemBanDo}',
            //                           style: StyleApp.textStyle700(),
            //                         ),
            //                         SvgPicture.asset('assets/svg/mapIcon.svg'),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         )),
            //   ],
            // ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Const.size(context).width * 0.025),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(

                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      width: Const.size(context).width * 0.43846153846,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          //set border radius more than 50% of height and width to make circle
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: Const.size(context).width *
                                  0.04615384615,
                              bottom: Const.size(context).width *
                                  0.04615384615,
                              right: Const.size(context).width *
                                  0.07948717948,
                              left: Const.size(context).width *
                                  0.04615384615),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                  'assets/svg/filterIcon.svg'),
                              Text(
                                '${lang.locKQ}',
                                style: StyleApp.textStyle700(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)),
                    width: Const.size(context).width * 0.43846153846,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        //set border radius more than 50% of height and width to make circle
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top:
                            Const.size(context).width * 0.04615384615,
                            bottom:
                            Const.size(context).width * 0.04615384615,
                            left:
                            Const.size(context).width * 0.07948717948,
                            right: Const.size(context).width *
                                0.04615384615),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${lang.xemBanDo}',
                              style: StyleApp.textStyle700(),
                            ),
                            SvgPicture.asset('assets/svg/mapIcon.svg'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate:
                const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: 50,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  InfoSpaScreen()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image.asset(
                                'assets/images/mostRate.png',width: Const.size(context).width*0.45,fit: BoxFit.fitHeight,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      color: ColorApp.dark
                                          .withOpacity(0.3),
                                      borderRadius:
                                      BorderRadius.only(
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
                                        SizedBox(),
                                        Row(
                                          children: [
                                            Icon(
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
                                        SizedBox()
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                          Text(
                            'Sorella Beauty',
                            style: StyleApp.textStyle600(
                                color: ColorApp.dark),
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                            children: [
                              SizedBox(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: ColorApp.yellow,
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
                                          color: Color(
                                              0xff717171))),
                                ],
                              ),
                              SizedBox(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: Const.size(context).width * 0.3,
            )
          ],
        );
      }
      return SizedBox();
    });
  }
}
