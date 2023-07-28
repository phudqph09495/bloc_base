import 'dart:async';
import 'dart:io';

import 'package:bloc_base/widget/item/input/text_filed.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../../../bloc/language/bloc_lang.dart';
import '../../../bloc/language/event_bloc2.dart';
import '../../../bloc/state_bloc.dart';
import '../../../config/const.dart';
import '../../../styles/colors.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/appBar.dart';
import '../../../widget/item/button.dart';
import '../../../widget/item/grid_view_custom.dart';

class DanhGiaDVSCreen extends StatefulWidget {
  const DanhGiaDVSCreen({super.key});

  @override
  State<DanhGiaDVSCreen> createState() => _DanhGiaDVSCreenState();
}

class _DanhGiaDVSCreenState extends State<DanhGiaDVSCreen> {
  List<XFile> imageFiles = [];
  final ImagePicker _picker = ImagePicker();
  StreamController imagesController = StreamController.broadcast();
  Stream get imageStream => imagesController.stream;
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<BlocLanguage, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              backgroundColor: ColorApp.darkGreen,
              appBar: AppBarWidget(title: language.danhGiaCuaToi),
              body: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: ColorApp.background),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(10),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                              BorderRadius.circular(5),
                              child: SizedBox(
                                width: Const.sizeWidth(context, 36),
                                height: Const.sizeHeight(context, 30),
                                child: Image.asset(
                                  'assets/images/exSpa.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Gap(Const.sizeWidth(context, 15)),
                            Text('Chăm sóc da mặt',style: StyleApp.textStyle600(color: ColorApp.dark252525),)
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Divider(
                            height: 1,
                            color: ColorApp.dark500,
                          ),
                        ),
                        Gap(5),

Center(child: Text(language.chatLuongDV,style: StyleApp.textStyle600(),)),
                        Gap(5),
                        Center(
                          child: RatingBar.builder(itemBuilder: (context, _) => Icon(
                            Icons.star,size: 20,
                            color: Colors.amber,
                          ), onRatingUpdate: (rating) {
                            print(rating);
                          },),
                        ),
                        Gap(20),
                        DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(15),
                            color: ColorApp.bottomBarABCA74,
                            dashPattern: const [5, 1],
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: ColorApp.whiteF0
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(),
                                    Row(
                                      children: [
                                        Text(language.themHinhAnh,style: StyleApp.textStyle600(color: ColorApp.bottomBarABCA74,fontSize: 16),),
                                        Gap(5),
                                        StreamBuilder(
                                          stream: imageStream,
                                          initialData: imageFiles,
                                          builder: (context, snapshot) {
                                            return buildImage();
                                          },
                                        ),

                                      ],
                                    ),   SizedBox(),
                                  ],
                                ),
                              ),
                            )),
                        Gap(10),
                        InputText1(label: language.danhGiaDichVu,maxLine: 10,colorBg: Colors.white,),
                        Gap(10),
                        Row(
                          children: [
                            Text(language.danhGia2,style: StyleApp.textStyle600(color: ColorApp.dark252525),),
                            Text(
                              ' Sviet Beauty Spa',
                              style: StyleApp.textStyle600(
                                fontSize: 13,
                                color: ColorApp.darkGreen,
                              ),
                            ),
                          ],
                        ),
                        Gap(1200),



                      ],
                    ),
                  ),
                ),
              ),
              bottomSheet:  Container(color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(height: Const.sizeHeight(context, 52),
                    child: ButtonWidget(
                      type: ButtonType.secondary,
                      text: language.guiDanhGia.toUpperCase(),
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ));
      }
      return const Scaffold();
    });  }

  Widget buildImage() {
    return GridViewCustom(
        itemCount: imageFiles.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        showFull: true,
        maxWight: 100,
        mainAxisExtent: 100,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        itemBuilder: (_, index) {
          return SizedBox(
            width: double.infinity,
            height: 100,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Image.file(
                      File(imageFiles[index].path),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 100,
                    ),
                  ),
                ),
                Positioned(
                  top: 3,
                  right: 3,
                  child: InkWell(
                    onTap: () {
                      imageFiles.removeAt(index);
                      imagesController.sink.add(imageFiles);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
