import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:bloc_base/homePage.dart';
import 'package:bloc_base/screen/Cart/thanhToan_screen.dart';
import 'package:bloc_base/widget/item/input/text_filed2.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:group_button/group_button.dart';

import '../../bloc/language/bloc_lang.dart';
import '../../config/const.dart';
import '../../model/model_local.dart';
import '../../styles/init_style.dart';
import '../../widget/item/input/text_filed.dart';

class YeuThichScreen extends StatefulWidget {
  const YeuThichScreen({Key? key}) : super(key: key);

  @override
  State<YeuThichScreen> createState() => _YeuThichScreenState();
}

class _YeuThichScreenState extends State<YeuThichScreen> {
  final controller = GroupButtonController();

  bool dv=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.selectIndex(0);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLang, StateBloc>(builder: (_, StateBloc state) {

      if (state is LoadSuccess) {
        Language language = state.data;
        return Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: 0,
                child: Stack(
                  children: [
                    Container(
                      color: ColorApp.darkGreen,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(),
                              Text(
                                '${language.yeuThich}',
                                style: StyleApp.textStyle700(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox()
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.04,
                      left: 10,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            child: FaIcon(
                              FontAwesomeIcons.arrowLeftLong,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.12,
                height: MediaQuery.of(context).size.height * 1.5,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1.5,
                  decoration: BoxDecoration(
                      color: ColorApp.whiteF0,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: SingleChildScrollView(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 3,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Container(
                            //     height: MediaQuery.of(context).size.height * 0.03,
                            //     decoration: BoxDecoration(
                            //         color: Colors.white,
                            //         borderRadius: BorderRadius.only(
                            //             topLeft: Radius.circular(25),
                            //             topRight: Radius.circular(25)))),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                  Const.size(context).width * 0.02179487179,
                                  horizontal:
                                  Const.size(context).width * 0.02615384615),
                              child: Column(
                                children: [
                                  Container(width: double.infinity,
                                    child: GroupButton(
                                      controller: controller,
                                      options: GroupButtonOptions(
                                        buttonWidth: Const.size(context).width*0.44,
                                          selectedColor:
                                          ColorApp.darkGreen,
                                          mainGroupAlignment: MainGroupAlignment.spaceBetween,
                                          unselectedTextStyle:
                                          StyleApp.textStyle500(
                                              color: ColorApp
                                                  .dark500),
                                          borderRadius:
                                          BorderRadius.circular(
                                              12)),
                                      isRadio: true,
                                      onSelected: (name, index,
                                          isSelected) {
                                        if(index==0){
                                          dv=true;
                                          controller.selectIndex(0);
                                        }else if(index==1){
                                          dv=false;
                                          controller.selectIndex(1);
                                        }
                                        print(index);
                                      setState(() {

                                      });


                                      },
                                      buttons: [
                                        "${language.spa}",
                                        "${language.dichvu}",

                                      ],
                                    ),
                                  ),
                               dv?
                               ListView.builder(
                                 padding: EdgeInsets.zero,
                                 itemBuilder: (context, index) {
                                   return InkWell(
                                     onTap: (){
                                     },
                                     child: Card(
                                       child: Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Row(
                                           children: [
                                             Expanded(
                                                 flex: 8,
                                                 child: Image.asset(
                                                     'assets/images/searchImgList.png')),
                                             Expanded(flex: 1, child: SizedBox()),
                                             Expanded(
                                                 flex: 20,
                                                 child: Column(
                                                   children: [
                                                     Row(crossAxisAlignment: CrossAxisAlignment.start,
                                                       mainAxisAlignment:
                                                       MainAxisAlignment.spaceBetween,
                                                       children: [
                                                         Text(
                                                           'Sorella Beauty Spa',
                                                           style: StyleApp.textStyle600(
                                                               color: ColorApp.dark),
                                                         ),
                                                         Icon(
                                                           Icons.clear,
                                                           color: ColorApp.dark500.withOpacity(0.7),
                                                         )
                                                       ],
                                                     ),
                                                     Text(
                                                       'Trung tâm chăm sóc sức khoẻ cộng đồng',
                                                       style: StyleApp.textStyle500(
                                                           color: ColorApp.dark500,
                                                           decoration:
                                                           TextDecoration.none),
                                                     ),
                                                     Row(
                                                       mainAxisAlignment:
                                                       MainAxisAlignment.spaceBetween,
                                                       children: [
                                                         Row(
                                                           children: [
                                                             Icon(
                                                               Icons.location_on,
                                                               color: ColorApp.bottomBar,
                                                             ),
                                                             Text(
                                                               ' 2.3 km',
                                                               style: StyleApp.textStyle500(
                                                                 color: ColorApp.bottomBar,
                                                               ),
                                                             ),
                                                           ],
                                                         ),
                                                   SizedBox()
                                                       ],
                                                     ),

                                                   ],
                                                 )),
                                           ],
                                         ),
                                       ),
                                     ),
                                   );
                                 },
                                 shrinkWrap: true,
                                 physics: NeverScrollableScrollPhysics(),
                                 itemCount: 5,
                               ):
                                  ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: (){
                                        },
                                        child: Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    flex: 8,
                                                    child: Image.asset(
                                                        'assets/images/searchImgList.png')),
                                                Expanded(flex: 1, child: SizedBox()),
                                                Expanded(
                                                    flex: 20,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Chăm sóc da mặt',
                                                              style: StyleApp.textStyle600(
                                                                  color: ColorApp.dark),
                                                            ),
                                                             Icon(
                                                              Icons.clear,
                                                              color: ColorApp.dark500.withOpacity(0.7),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'đ ${Const.ConvertPrice.format(1450000)} ',
                                                              style: StyleApp.textStyle700(
                                                                  color: ColorApp.dark500,
                                                                  decoration: TextDecoration
                                                                      .lineThrough),
                                                            ),
                                                            Text(
                                                              '${Const.ConvertPrice.format(1200000)} đ',
                                                              style: StyleApp.textStyle700(
                                                                  color: ColorApp.dark,
                                                                  decoration:
                                                                  TextDecoration.none),
                                                            )
                                                          ],
                                                        ),
                                                        Row(

                                                          mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.home,size: 16,
                                                                  color: ColorApp.darkGreen,
                                                                ),
                                                                Text(
                                                                  ' Sviet Beauty Spa',
                                                                  style: StyleApp.textStyle700(
                                                                    color: ColorApp.darkGreen,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.watch_later_rounded,
                                                                  color: ColorApp.dark500,
                                                                  size: 16,
                                                                ),
                                                                Text(
                                                                  ' 125 phút',
                                                                  style: StyleApp.textStyle700(
                                                                      color: ColorApp.dark500,
                                                                      fontSize: 12,
                                                                      decoration:
                                                                      TextDecoration.none),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.star,size: 16,
                                                                  color: ColorApp.yellow,
                                                                ),
                                                                Text(
                                                                  '4.7  ',
                                                                  style: StyleApp.textStyle700(
                                                                    color: ColorApp.yellow,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  '(86)',
                                                                  style: StyleApp.textStyle700(
                                                                    color: ColorApp.dark500,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.location_on,
                                                                  color: ColorApp.dark500,
                                                                  size: 18,
                                                                ),
                                                                Text(
                                                                  ' 2.3 km',
                                                                  style: StyleApp.textStyle700(
                                                                      color: ColorApp.dark500,
                                                                      fontSize: 12,
                                                                      decoration:
                                                                      TextDecoration.none),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: 6,
                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        );
      }
      return Scaffold();
    });
  }
}
