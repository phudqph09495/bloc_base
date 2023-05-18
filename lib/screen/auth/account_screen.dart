import 'package:bloc_base/bloc/language/bloc_lang.dart';
import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/screen/auth/caiDat_screen.dart';
import 'package:bloc_base/screen/auth/yeuThich_screen.dart';
import 'package:bloc_base/widget/drawler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../bloc/state_bloc.dart';
import '../../config/const.dart';
import '../../model/model_local.dart';
import '../../styles/init_style.dart';
import '../../widget/item/input/text_filed.dart';
import '../../widget/item/load_image.dart';
import '../home/notifi_screen.dart';
import 'package:group_button/group_button.dart';

import 'goi_daDat_screen.dart';
import 'history_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    double ffem = fem * 0.97;

    return Scaffold(
      drawer: ItemDrawer(),
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
                                      fontSize: 20, color: ColorApp.dark),
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
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child:
                                    SvgPicture.asset('assets/svg/Vector.svg'),
                              ),
                            ),

                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NotifyScreen()));
                              },
                              child: Container(
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
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
                                          width:
                                              Const.size(context).width * 0.03,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorApp.orange),
                                        ))
                                  ],
                                ),
                              ),
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
                                  height:
                                      Const.size(context).width * 0.17384615384,
                                  width:
                                      Const.size(context).width * 0.17384615384,
                                  fit: BoxFit.cover,
                                )),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: InkWell(
                                      child: Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
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
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '  Quỳnh Anh\n',
                                    style: StyleApp.textStyle700(
                                        color: ColorApp.dark),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: ColorApp.orange,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Thành viên vàng',
                                            style: StyleApp.textStyle600(
                                                color: ColorApp.dark),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 16,
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
                        SvgPicture.asset('assets/svg/pencil.svg'),
                      ],
                    ),
                  )),
                ],
              ),
              Expanded(
                  child: Container(
                color: ColorApp.whiteF0,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Const.size(context).width * 0.025,
                        vertical: Const.size(context).width * 0.025),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${lang.dichvu}',
                              style:
                                  StyleApp.textStyle700(color: ColorApp.dark),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>LichSuScreen()));
                              },
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/svg/history.svg'),
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
                            Container(
                              width: Const.size(context).width * 0.28205128205,
                              height: Const.size(context).width * 0.25076923076,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset('assets/svg/lichDaDat.svg'),
                                  Text(
                                    '${lang.lichDaDat}',
                                    style: StyleApp.textStyle600(
                                        color: ColorApp.dark),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>GoiDaDatScreen()));
                              },
                              child: Container(
                                width: Const.size(context).width * 0.28205128205,
                                height: Const.size(context).width * 0.25076923076,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset('assets/svg/lichDaDat.svg'),
                                    Text(
                                      '${lang.goiDaDat}',
                                      style: StyleApp.textStyle600(
                                          color: ColorApp.dark),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>YeuThichScreen()));
                              },
                              child: Container(
                                width: Const.size(context).width * 0.28205128205,
                                height: Const.size(context).width * 0.25076923076,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset('assets/svg/lichDaDat.svg'),
                                    Text(
                                      '${lang.yeuThich}',
                                      style: StyleApp.textStyle600(
                                          color: ColorApp.dark),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Const.size(context).width * 0.04,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.065,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: ColorApp.orange,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    Const.size(context).width * 0.02615384615),
                            child: Text(
                              '${lang.dangKyDoiTac.toUpperCase()}',
                              style:
                                  StyleApp.textStyle700(color: ColorApp.dark),
                            ),
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
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    Const.size(context).width * 0.04615384615,
                                vertical:
                                    Const.size(context).width * 0.07179487179),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${lang.taiKhoan}',
                                  style: StyleApp.textStyle700(
                                      color: ColorApp.dark, fontSize: 16),
                                ),
                                SizedBox(
                                  height:
                                      Const.size(context).width * 0.03179487179,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: ColorApp.whiteF0,borderRadius: BorderRadius.circular(12)
                                  ),
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
                                                'assets/svg/language.svg'),
                                            Text('  ${lang.ngonNgu}',style: StyleApp.textStyle500(color: ColorApp.black3F),)
                                          ],
                                        ),
                                        Text('${lang.string1}',style: StyleApp.textStyle500(color: ColorApp.black3F),)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 7,),
                                Container(
                                  decoration: BoxDecoration(
                                      color: ColorApp.whiteF0,borderRadius: BorderRadius.circular(12)
                                  ),
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
                                            Text('  ${lang.tinNhan}',style: StyleApp.textStyle500(color: ColorApp.black3F),)
                                          ],
                                        ),
Icon(Icons.arrow_circle_right_outlined,size: 18,color: ColorApp.darkGreen,)                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 7,),
                                Container(
                                  decoration: BoxDecoration(
                                      color: ColorApp.whiteF0,borderRadius: BorderRadius.circular(12)
                                  ),
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
                                                'assets/svg/star.svg'),
                                            Text('  ${lang.danhGiaCuaToi}',style: StyleApp.textStyle500(color: ColorApp.black3F),)
                                          ],
                                        ),
                                        Text('23',style: StyleApp.textStyle500(color: ColorApp.darkGreen),)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 7,),
                                Container(
                                  decoration: BoxDecoration(
                                      color: ColorApp.whiteF0,borderRadius: BorderRadius.circular(12)
                                  ),
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
                                                'assets/svg/coupon.svg'),
                                            Text('  ${lang.uuDai}',style: StyleApp.textStyle500(color: ColorApp.black3F),)
                                          ],
                                        ),
                                        Text('',style: StyleApp.textStyle500(color: ColorApp.black3F),)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Const.size(context).width * 0.08,
                                ),
                                Text(
                                  '${lang.thongTin}',
                                  style: StyleApp.textStyle700(
                                      color: ColorApp.dark, fontSize: 16),
                                ),
                                SizedBox(
                                  height:
                                  Const.size(context).width * 0.03179487179,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: ColorApp.whiteF0,borderRadius: BorderRadius.circular(12)
                                  ),
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
                                                'assets/svg/ttHt.svg'),
                                            Text('  ${lang.ttHT}',style: StyleApp.textStyle500(color: ColorApp.black3F),)
                                          ],
                                        ),
                                        Text('',style: StyleApp.textStyle500(color: ColorApp.black3F),)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 7,),
                                Container(
                                  decoration: BoxDecoration(
                                      color: ColorApp.whiteF0,borderRadius: BorderRadius.circular(12)
                                  ),
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
                                                'assets/svg/cauHoi.svg'),
                                            Text('  ${lang.cauHoiThuongGap}',style: StyleApp.textStyle500(color: ColorApp.black3F),)
                                          ],
                                        ),
                                        Text('',style: StyleApp.textStyle500(color: ColorApp.black3F),)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 7,),
                                Container(
                                  decoration: BoxDecoration(
                                      color: ColorApp.whiteF0,borderRadius: BorderRadius.circular(12)
                                  ),
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
                                                'assets/svg/gioiThieu.svg'),
                                            Text('  ${lang.gioiThieu}',style: StyleApp.textStyle500(color: ColorApp.black3F),)
                                          ],
                                        ),
                                        Text('',style: StyleApp.textStyle500(color: ColorApp.black3F),)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 7,),
                                Container(
                                  decoration: BoxDecoration(
                                      color: ColorApp.whiteF0,borderRadius: BorderRadius.circular(12)
                                  ),
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
                                                'assets/svg/dieuKhoan.svg'),
                                            Text('  ${lang.dieuKhoanSuDung}',style: StyleApp.textStyle500(color: ColorApp.black3F),)
                                          ],
                                        ),
                                        Text('',style: StyleApp.textStyle500(color: ColorApp.black3F),)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 7,),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CaiDatScreen()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: ColorApp.whiteF0,borderRadius: BorderRadius.circular(12)
                                    ),
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
                                                  'assets/svg/caiDat.svg'),
                                              Text('  ${lang.caiDat}',style: StyleApp.textStyle500(color: ColorApp.black3F),)
                                            ],
                                          ),
                                          Text('',style: StyleApp.textStyle500(color: ColorApp.black3F),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 7,),
                                Container(
                                  decoration: BoxDecoration(
                                      color: ColorApp.whiteF0,borderRadius: BorderRadius.circular(12)
                                  ),
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
                                                'assets/svg/dangXuat.svg'),
                                            Text('  ${lang.dangXuat}',style: StyleApp.textStyle500(color: ColorApp.black3F),)
                                          ],
                                        ),
                                        Text('',style: StyleApp.textStyle500(color: ColorApp.black3F),)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 7,),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ))
            ],
          );
        }
        return SizedBox();
      }),
    );
  }
}
