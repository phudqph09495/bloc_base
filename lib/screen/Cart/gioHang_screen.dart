import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:bloc_base/homePage.dart';
import 'package:bloc_base/screen/Cart/thanhToan_screen.dart';
import 'package:bloc_base/widget/item/input/text_filed2.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../bloc/language/bloc_lang.dart';
import '../../config/const.dart';
import '../../model/model_local.dart';
import '../../styles/init_style.dart';
import '../../widget/item/input/text_filed.dart';

class GioHangScreen extends StatefulWidget {
  const GioHangScreen({Key? key}) : super(key: key);

  @override
  State<GioHangScreen> createState() => _GioHangScreenState();
}

class _GioHangScreenState extends State<GioHangScreen> {
  List<ModelCart> list = [
    ModelCart(name: 'Chăm sóc da mặt', soLuong: 2, gia: 250000),
    ModelCart(name: 'Chăm sóc cơ thể', soLuong: 1, gia: 350000),
    ModelCart(name: 'Body Massage', soLuong: 3, gia: 420000),
  ];
 int choosen=0;
  int sum=0;
  bool showToast=false;
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
                      height: MediaQuery.of(context).size.height*0.25,
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
                                '${language.gioHang} (3)',
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
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(index: 0,)));
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
                height: MediaQuery.of(context).size.height*1.5,
                child: Container(
                  width: MediaQuery.of(context).size.width,
height: MediaQuery.of(context).size.height*1.5,
                  decoration: BoxDecoration(
                      color: ColorApp.whiteF0,

                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),

                  child: SingleChildScrollView(
                      child: SizedBox(
height: MediaQuery.of(context).size.height*3,
                        child: Column(
                    children: [
                        Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25)))),
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: Const.size(context).width *
                                                0.04615384615,
                                            left: Const.size(context).width *
                                                0.04615384615,
                                            right: Const.size(context).width *
                                                0.04615384615),
                                        child: Container(
                                          width: Const.size(context).width * 0.9,

                                          child: Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Checkbox(
                                                        shape: CircleBorder(),
                                                        activeColor:
                                                            ColorApp.bottomBar,
                                                        value: list[index].value,
                                                        onChanged: (value) {

                                                          setState(() {
                                                            list[index].value =
                                                                value;
                                                            choosen=0;sum=0;

                                                            for(int i=0;i<list.length;i++){
                                                            if(list[i].value==true){sum=sum+list[i].gia*list[i].soLuong;
                                                            choosen++;}
                                                            }

                                                          });

                                                        }),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Container(
                                                      width: Const.size(context)
                                                              .width *
                                                          0.17948717948,
                                                      height: Const.size(context)
                                                              .width *
                                                          0.17948717948,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(12.0),
                                                        child: Image.asset(

                                                          'assets/images/exSpa.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(),
                                                    flex: 1,
                                                  ),
                                                  Expanded(
                                                    flex: 14,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                                flex: 5,
                                                                child: Text(
                                                                  '${list[index].name}',
                                                                  style: StyleApp
                                                                      .textStyle700(
                                                                          fontSize:
                                                                              16,
                                                                          color: ColorApp
                                                                              .dark),
                                                                )),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        border: Border
                                                                            .all()),
                                                                child: Padding(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          vertical:
                                                                              4),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceAround,
                                                                    children: [
                                                                      InkWell(
                                                                          onTap:
                                                                              () {
showToast=false;
                                                                         setState(() {
                                                                           if (list[index].soLuong >
                                                                               0) {
                                                                             list[index].soLuong--;
                                                                             choosen=0;sum=0;

                                                                             for(int i=0;i<list.length;i++){
                                                                               if(list[i].value==true){sum=sum+list[i].gia*list[i].soLuong;
                                                                               choosen++;}
                                                                             }
                                                                           }
                                                                         });

                                                                          },
                                                                          child:
                                                                          FaIcon(
                                                                            FontAwesomeIcons
                                                                                .minus,
                                                                            size:
                                                                            14,
                                                                          )),

                                                                      Text(
                                                                        ' ${list[index].soLuong} ',
                                                                        style: StyleApp.textStyle500(
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                ColorApp.dark500),
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          setState(
                                                                                  () {
                                                                               if( list[index]
                                                                                   .soLuong<3){
                                                                                 list[index]
                                                                                     .soLuong++;
                                                                                 choosen=0;sum=0;

                                                                                 for(int i=0;i<list.length;i++){
                                                                                   if(list[i].value==true){sum=sum+list[i].gia*list[i].soLuong;
                                                                                   choosen++;}
                                                                                 }
                                                                               }else{
                                                                                 showToast=true;
                                                                               }
                                                                              });
                                                                        },
                                                                        child:
                                                                        Icon(
                                                                          Icons
                                                                              .add,
                                                                          size:
                                                                          14,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 7,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.home,
                                                              size: 16,
                                                              color: ColorApp
                                                                  .bottomBar,
                                                            ),
                                                            Text(
                                                              ' Sviet Beauty Spa',
                                                              style: StyleApp
                                                                  .textStyle700(
                                                                color: ColorApp
                                                                    .bottomBar,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 7,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.star,
                                                                  size: 16,
                                                                  color: ColorApp
                                                                      .yellow,
                                                                ),
                                                                Text(
                                                                  ' 4.7',
                                                                  style: StyleApp
                                                                      .textStyle700(
                                                                    color: ColorApp
                                                                        .yellow,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  ' (86)',
                                                                  style: StyleApp
                                                                      .textStyle500(
                                                                          color: ColorApp
                                                                              .dark500),
                                                                ),
                                                              ],
                                                            ),
                                                            InkWell(
                                                              onTap: (){
                                                                setState(() {
                                                                  list.removeAt(index);
                                                                  choosen=0;sum=0;

                                                                  for(int i=0;i<list.length;i++){
                                                                    if(list[i].value==true){sum=sum+list[i].gia*list[i].soLuong;
                                                                    choosen++;}
                                                                  }
                                                                });
                                                              },
                                                              child: Icon(
                                                                  Icons
                                                                      .delete_forever,
                                                                  color: ColorApp
                                                                      .pink),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Divider(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Transform.scale(
                                                          scale: 0.75,
                                                          child: SvgPicture.asset(
                                                            'assets/svg/notiIcon.svg',
                                                            color:
                                                                ColorApp.dark500,
                                                          )),
                                                      Text(
                                                        ' 4/6/2023 - 15:35',
                                                        style:
                                                            StyleApp.textStyle400(
                                                                color: ColorApp
                                                                    .dark500,
                                                                fontSize: 14),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .watch_later_outlined,
                                                        color: ColorApp.dark500,
                                                      ),
                                                      Text(
                                                        ' 70 phút',
                                                        style:
                                                            StyleApp.textStyle400(
                                                                color: ColorApp
                                                                    .dark500,
                                                                fontSize: 14),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    '${Const.ConvertPrice.format(list[index].gia * list[index].soLuong)} ₫',
                                                    style: StyleApp.textStyle700(
                                                        color: ColorApp.darkGreen,
                                                        fontSize: 16),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                height: 10,
                                              )
                                            ],
                                          ),

                                        ),
                                      ),
                                      Container(
                                        height: 5,
                                        color: ColorApp.whiteF0,
                                      )
                                    ],
                                  );
                                },
                                itemCount: list.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                              ),
           showToast?                   Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(decoration: BoxDecoration(
                                  color: ColorApp.pink.withOpacity(0.5),borderRadius: BorderRadius.circular(12)
                                ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.report_problem_outlined,color: ColorApp.pink,),
                                        Text(' ${language.canhBao}',style: StyleApp.textStyle500(color: ColorApp.pink),)
                                      ],
                                    ),
                                  ),
                                ),
                              ):SizedBox(),
                              Container(
                                height: 5,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                      child:   DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(15),
                          color: ColorApp.bottomBar,
                          dashPattern: const [5, 1],
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,borderRadius: BorderRadius.circular(15)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(3),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(
                                        Const.size(context)
                                            .width *
                                            0.03),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/svg/discount2.svg'),
                                        Text(
                                          '   ${language.nhapMagiamGia}',
                                          style: StyleApp
                                              .textStyle500(
                                              color: ColorApp
                                                  .dark500,
                                              fontSize: 13),
                                        ),
                                        SizedBox(),
                                      ],
                                    ),
                                  ),
                                  Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: ColorApp.bottomBar),
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal:Const.size(context).width *
                                          0.05277777777,vertical: Const.size(context).width *
                                          0.03277777777 ),
                                      child: Text(
                                        '${language.apDung}',
                                        style: StyleApp.textStyle700(
                                            color: Colors.white,
                                            fontSize: 13),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      ),
                      Container(width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text('${language.tongThanhToan}',style: StyleApp.textStyle600(color: ColorApp.dark,fontSize: 16),),
    Text('₫ 3.820.000',style: StyleApp.textStyle700(color: ColorApp.dark500,fontSize: 12,decoration: TextDecoration.lineThrough),)
  ],
),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Đã chọn ${choosen} dịch vụ, giá đã bao gồm thuế',style: StyleApp.textStyle400(color: ColorApp.dark500,fontSize: 14),),
                                  Text('₫ ${Const.ConvertPrice.format(sum)}',style: StyleApp.textStyle700(color: ColorApp.darkGreen,fontSize: 16,),)
                                ],
                              ),
                              SizedBox(height: 30,),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ThanhToanScreen()));
                                },
                                child: Container(
                                  height: MediaQuery.of(context).size.height * 0.065,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: ColorApp.orange,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: Const.size(context).width * 0.02615384615),
                                    child: Text(
                                      '${language.thanhToan.toUpperCase()}',
                                      style: StyleApp.textStyle700(color: ColorApp.dark),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )

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
