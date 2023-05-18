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

class LichSuScreen extends StatefulWidget {
  const LichSuScreen({Key? key}) : super(key: key);

  @override
  State<LichSuScreen> createState() => _LichSuScreenState();
}

class _LichSuScreenState extends State<LichSuScreen> {
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
                                '${language.lichSu}',
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

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
                                      buttonWidth: Const.size(context).width*0.28205128205,
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



                                  },
                                  buttons: [
                                    "Tất cả",
                                    "Đã đặt",
                                    "Đã huỷ",

                                  ],
                                ),
                              ),
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
