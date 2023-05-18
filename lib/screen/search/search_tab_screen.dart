import 'package:bloc_base/bloc/language/bloc_lang.dart';
import 'package:bloc_base/bloc/language/event_bloc2.dart';
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
import '../home/notifi_screen.dart';
import 'package:group_button/group_button.dart';

import 'info_spa_screen.dart';

class SearchTabScreen extends StatefulWidget {
  const SearchTabScreen({Key? key}) : super(key: key);

  @override
  State<SearchTabScreen> createState() => _SearchTabScreenState();
}

class _SearchTabScreenState extends State<SearchTabScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController gio = TextEditingController();
  int selectedIndex = 0;
  bool chooseList = true;
  List<ModelLocal2> listFilter = [
    ModelLocal2(name: 'Đánh giá tốt nhất', id: 'filterIcon1.svg'),
    ModelLocal2(name: 'Giá thấp nhất', id: 'filterIcon2.svg'),
    ModelLocal2(name: 'Khoảng cách ngắn nhất', id: 'filterIcon3.svg'),
    ModelLocal2(name: 'Danh sách yêu thích', id: 'filterIcon4.svg')
  ];
  List<ModelLocal2> checkListItems = [
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Trị liệu thâm nám',
      id: '2',
    ),
    ModelLocal2(
      name: 'Liệu trình tắm trắng',
      id: '3',
    ),
    ModelLocal2(
      name: 'Liệu trình giảm cân',
      id: '4',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
  ];
  double fromPrice = 10000;
  double toPrice = 1000000;
  bool checkedValue = true;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    double ffem = fem * 0.97;
    RangeValues range = RangeValues(fromPrice, toPrice);
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
                                child: InputText1(
                                  label: '${lang.timKiem}',
                                  hasLeading: true,
                                  iconPreFix: Icon(Icons.search,
                                      color: ColorApp.bottomBar),
                                  hasSuffix: false,
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
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setState0) {
                                  return Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: Const.size(context).width *
                                              0.24358974359,
                                          color: ColorApp.darkGreen,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    Const.size(context).width *
                                                        0.04615384615),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Icon(
                                                    Icons.clear,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  '${lang.locKQ}',
                                                  style: StyleApp.textStyle700(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  '${lang.boLoc}',
                                                  style: StyleApp.textStyle700(
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            child: SingleChildScrollView(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    Const.size(context).width *
                                                        0.04615384615,
                                                vertical:
                                                    Const.size(context).width *
                                                        0.04615384615),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${lang.dichvu} :',
                                                  style: StyleApp.textStyle700(
                                                      color: ColorApp.dark),
                                                ),
                                                SizedBox(
                                                  height: Const.size(context)
                                                          .width *
                                                      0.03846153846,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    showModalBottomSheet(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return StatefulBuilder(
                                                              builder: (BuildContext
                                                                      context,
                                                                  StateSetter
                                                                      setState1) {
                                                            return Container(
                                                              height: Const.size(
                                                                          context)
                                                                      .height *
                                                                  0.8,
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Icon(Icons.clear),
                                                                          ),
                                                                          Text(
                                                                            '${lang.loaiDV}',
                                                                            style:
                                                                                StyleApp.textStyle700(fontSize: 18, color: ColorApp.dark),
                                                                          ),
                                                                          SizedBox()
                                                                        ],
                                                                      ),
                                                                      Divider(),
                                                                      ListView
                                                                          .builder(
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          return Padding(
                                                                            padding:
                                                                                EdgeInsets.only(bottom: 5),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: ColorApp.greyF9),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.only(left: Const.size(context).width * 0.04615384615),
                                                                                child: CheckboxListTile(
                                                                                  checkboxShape: CircleBorder(),
                                                                                  activeColor: Colors.green,
                                                                                  controlAffinity: ListTileControlAffinity.trailing,
                                                                                  contentPadding: EdgeInsets.zero,
                                                                                  dense: true,
                                                                                  title: Text(
                                                                                    checkListItems[index].name ?? '',
                                                                                    style: StyleApp.textStyle500(),
                                                                                  ),
                                                                                  value: checkListItems[index].value,
                                                                                  onChanged: (value) {
                                                                                    setState1(() {
                                                                                      checkListItems[index].value = value;
                                                                                      // if (multipleSelected.contains(checkListItems[index])) {
                                                                                      //   multipleSelected.remove(checkListItems[index]);
                                                                                      // } else {
                                                                                      //   multipleSelected.add(checkListItems[index]);
                                                                                      // }
                                                                                    });
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                        shrinkWrap:
                                                                            true,
                                                                        physics:
                                                                            NeverScrollableScrollPhysics(),
                                                                        itemCount:
                                                                            checkListItems.length,
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          });
                                                        });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: ColorApp
                                                                .border),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12)),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          Const.size(context)
                                                                  .width *
                                                              0.03846153846),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            '${lang.loaiDV}',
                                                            style: StyleApp
                                                                .textStyle500(
                                                                    color: ColorApp
                                                                        .dark500),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            size: 16,
                                                            color:
                                                                ColorApp.dark,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: Const.size(context)
                                                          .width *
                                                      0.03846153846,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              ColorApp.border),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                        Const.size(context)
                                                                .width *
                                                            0.03846153846),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          '${lang.loaiDV}',
                                                          style: StyleApp
                                                              .textStyle500(
                                                                  color: ColorApp
                                                                      .dark500),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          size: 16,
                                                          color: ColorApp.dark,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: Const.size(context)
                                                          .width *
                                                      0.03846153846,
                                                ),
                                                Text(
                                                  '${lang.gia} :',
                                                  style: StyleApp.textStyle700(
                                                      color: ColorApp.dark),
                                                ),
                                                SizedBox(
                                                  height: Const.size(context)
                                                          .width *
                                                      0.01846153846,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '${lang.giaTu} ',
                                                      style:
                                                          StyleApp.textStyle400(
                                                              color: ColorApp
                                                                  .dark),
                                                    ),
                                                    Text(
                                                      '${Const.ConvertPrice.format(fromPrice.round())} đ',
                                                      style:
                                                          StyleApp.textStyle700(
                                                              color: ColorApp
                                                                  .dark),
                                                    ),
                                                    Text(
                                                      '${lang.den} ',
                                                      style:
                                                          StyleApp.textStyle400(
                                                              color: ColorApp
                                                                  .dark),
                                                    ),
                                                    Text(
                                                      '${Const.ConvertPrice.format(toPrice.round())} đ',
                                                      style:
                                                          StyleApp.textStyle700(
                                                              color: ColorApp
                                                                  .dark),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Const.size(context)
                                                          .width *
                                                      0.01846153846,
                                                ),
                                                RangeSlider(
                                                    inactiveColor:
                                                        ColorApp.bottomBar,
                                                    activeColor:
                                                        ColorApp.darkGreen,
                                                    values: RangeValues(
                                                        fromPrice, toPrice),
                                                    min: 0,
                                                    labels: RangeLabels(
                                                        range.start
                                                            .round()
                                                            .toString(),
                                                        range.end
                                                            .round()
                                                            .toString()),
                                                    max: 10000000,
                                                    onChanged: (value) {
                                                      setState0(() {
                                                        fromPrice = value.start;
                                                        toPrice = value.end;
                                                      });
                                                    }),
                                                SizedBox(
                                                  height: Const.size(context)
                                                          .width *
                                                      0.03846153846,
                                                ),
                                                Text(
                                                  '${lang.phamVi} :',
                                                  style: StyleApp.textStyle700(
                                                      color: ColorApp.dark),
                                                ),
                                                SizedBox(
                                                  height: Const.size(context)
                                                          .width *
                                                      0.01846153846,
                                                ),
                                                GroupButton(
                                                  options: GroupButtonOptions(
                                                      selectedColor:
                                                          ColorApp.darkGreen,
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
                                                    print(name);
                                                    print(
                                                        '$index button is selected');
                                                  },
                                                  buttons: [
                                                    "3 km",
                                                    "5 km",
                                                    "8 km",
                                                    "10 km",
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Const.size(context)
                                                          .width *
                                                      0.03846153846,
                                                ),
                                                Row(
                                                  children: [
                                                    Checkbox(
                                                        shape: CircleBorder(),
                                                        activeColor:
                                                            Colors.green,
                                                        value: checkedValue,
                                                        onChanged: (val) {
                                                          setState0(() {
                                                            checkedValue = val!;
                                                          });
                                                        }),
                                                    Text(
                                                      '${lang.chiSpaTrong}',
                                                      style:
                                                          StyleApp.textStyle600(
                                                              color: ColorApp
                                                                  .dark500),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Const.size(context)
                                                          .width *
                                                      0.03846153846,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 6,
                                                      child: InputText1(
                                                        controller: gio,
                                                        onTap: () {
                                                          DatePicker
                                                              .showDatePicker(
                                                                  context,
                                                                  currentTime:
                                                                      DateTime
                                                                          .now(),
                                                                  locale:
                                                                      LocaleType
                                                                          .vi,
                                                                  onConfirm:
                                                                      (date) {
                                                            gio.text = Const.formatTime(
                                                                date
                                                                    .millisecondsSinceEpoch,
                                                                format:
                                                                    'dd/MM/yyyy');
                                                          });
                                                        },
                                                        label: Const.formatTime(
                                                            DateTime.now()
                                                                .millisecondsSinceEpoch,
                                                            format:
                                                                'dd/MM/yyyy'),
                                                        hasSuffix: true,
                                                        readOnly: true,
                                                        colorBg:
                                                            ColorApp.greyF9,
                                                        suffix: Transform.scale(
                                                            scale: 0.5,
                                                            child: SvgPicture.asset(
                                                                'assets/svg/notiIcon.svg')),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 5,
                                                      child: SizedBox(),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Const.size(context)
                                                          .width *
                                                      0.03846153846,
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: ColorApp.greyF6,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10),
                                                    child: Text(
                                                      '${lang.sapXepTheo} :',
                                                      style:
                                                          StyleApp.textStyle700(
                                                              color: ColorApp
                                                                  .dark),
                                                    ),
                                                  ),
                                                ),
                                                ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount: listFilter
                                                      .length, // The number of RadioListTiles you want to display
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Column(
                                                      children: [
                                                        RadioListTile<int>(
                                                          controlAffinity:
                                                              ListTileControlAffinity
                                                                  .trailing,
                                                          contentPadding:
                                                              EdgeInsets.zero,
                                                          title: Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                'assets/svg/${listFilter[index].id}',
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                '${listFilter[index].name}',
                                                                style: StyleApp
                                                                    .textStyle600(
                                                                        color: ColorApp
                                                                            .dark500),
                                                              ),
                                                            ],
                                                          ),
                                                          value: index,
                                                          activeColor: ColorApp
                                                              .darkGreen,
                                                          groupValue:
                                                              selectedIndex,
                                                          onChanged:
                                                              (int? value) {
                                                            setState0(() {
                                                              selectedIndex =
                                                                  value!;
                                                            });
                                                          },
                                                        ),
                                                        Divider()
                                                      ],
                                                    );
                                                  },
                                                ),
                                                SizedBox(
                                                  height: Const.size(context)
                                                          .width *
                                                      0.03846153846,
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: ColorApp.greyF6,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10),
                                                    child: Text(
                                                      '${lang.hienThi}',
                                                      style:
                                                          StyleApp.textStyle700(
                                                              color: ColorApp
                                                                  .dark),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: Const.size(context)
                                                          .width *
                                                      0.01846153846,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 10,
                                                      child: InkWell(
                                                        onTap: (){
                                                          setState0((){
                                                            chooseList=true;
                                                          });
                                                          setState(() {

                                                          });
                                                        },
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            border:
                                                            Border.all(color: ColorApp.dark500,width: 0.2),
                                                            color: chooseList==true?ColorApp.darkGreen:Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              ),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical: 10),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                              children: [
                                                                SvgPicture.asset(
                                                                    'assets/svg/listIcon.svg',color: chooseList==true?Colors.white:ColorApp.darkGreen,),
                                                                Text(
                                                                  '${lang.danhSach}',
                                                                  style: StyleApp
                                                                      .textStyle600(color:chooseList==true?Colors.white:ColorApp.darkGreen),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(),
                                                    ),
                                                    Expanded(
                                                      flex: 10,
                                                      child: InkWell(
                                                        onTap: (){
                                                          setState0((){
                                                            chooseList=false;
                                                          });

setState(() {

});
                                                        },
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color: chooseList==false?ColorApp.darkGreen:Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            border:
                                                            Border.all(color: ColorApp.dark500,width: 0.2),),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical: 10),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                              children: [
                                                                SvgPicture.asset(
                                                                    'assets/svg/gridIcon.svg',color: chooseList==false?Colors.white:ColorApp.darkGreen,),
                                                                Text(
                                                                  '${lang.luoi}',
                                                                  style: StyleApp
                                                                      .textStyle600(color:chooseList==false?Colors.white:ColorApp.darkGreen),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Const.size(context)
                                                      .width *
                                                      0.04846153846,
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color:ColorApp.yellow,
                                                    borderRadius: BorderRadius.circular(20)
                                                  ),
                                                  child: Padding(
                                                    padding:  EdgeInsets.symmetric(vertical: Const.size(context).width*0.04615384615),
                                                    child: Text('${lang.apDung}',style: StyleApp.textStyle700(color: ColorApp.dark),),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ))
                                      ],
                                    ),
                                  );
                                });
                              },
                            );
                          },
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
                  )),
                ],
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                  chooseList?  ListView.builder(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoSpaScreen()));
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: Image.asset(
                                          'assets/images/searchImgList.png')),
                                  Expanded(flex: 1, child: SizedBox()),
                                  Expanded(
                                      flex: 10,
                                      child: Column(
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
                                              index % 2 == 1
                                                  ? Stack(
                                                      children: [
                                                        Icon(Icons.favorite,
                                                            color: Colors.white),
                                                        Icon(
                                                            Icons.favorite_border,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.1)),
                                                      ],
                                                    )
                                                  : Icon(
                                                      Icons.favorite,
                                                      color: ColorApp.yellow,
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
                                                    size: 18,
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
                      itemCount: 5,
                    ):
                    GridView.builder(
                        padding: EdgeInsets.symmetric(
                            horizontal: Const.size(context).width * 0.01),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 0.7,
                            crossAxisSpacing:
                                Const.size(context).width * 0.0100444444,
                            mainAxisSpacing: 20),
                        itemCount: 10,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoSpaScreen()));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                //set border radius more than 50% of height and width to make circle
                              ),
                              child: Container(

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Const.size(context).width *
                                          0.02564102564),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Stack(
                                        children: [
                                          Image.asset(
                                            'assets/images/searchImgGrid.png',
                                            fit: BoxFit.cover,
                                            height: Const.size(context).width *
                                                0.26923076923,
                                            width: Const.size(context).width *
                                                0.38717948717,
                                          ),
                                          Positioned(
                                              right: 5,
                                              top: 5,
                                              child: index % 2 == 1
                                                  ? Stack(
                                                      children: [
                                                        Icon(Icons.favorite,
                                                            color: Colors.white),
                                                        Icon(
                                                            Icons.favorite_border,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.1)),
                                                      ],
                                                    )
                                                  : Icon(
                                                      Icons.favorite,
                                                      color: ColorApp.yellow,
                                                    )),
                                          Positioned(
                                            right: 5,
                                            bottom: 5,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: ColorApp.dark,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: ColorApp.yellow,
                                                      size: 12,
                                                    ),
                                                    Text(
                                                      '4.5',
                                                      style:
                                                          StyleApp.textStyle500(
                                                              color:
                                                                  ColorApp.yellow,
                                                              fontSize: 12),
                                                    ),
                                                    Text(
                                                      '(54)',
                                                      style:
                                                          StyleApp.textStyle500(
                                                              color: Colors.white,
                                                              fontSize: 12),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                        'Chăm sóc da mặt',
                                        style: StyleApp.textStyle600(
                                            color: ColorApp.dark),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'đ ${Const.ConvertPrice.format(1450000)}  ',
                                            style: StyleApp.textStyle700(
                                                color: ColorApp.dark500,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                          Text(
                                            '${Const.ConvertPrice.format(1200000)} đ',
                                            style: StyleApp.textStyle700(
                                                color: ColorApp.dark,
                                                decoration: TextDecoration.none),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.home,
                                            color: ColorApp.darkGreen,
                                          ),
                                          Text(
                                            ' Sviet Beauty Spa',
                                            style: StyleApp.textStyle700(
                                                color: ColorApp.darkGreen,
                                                decoration: TextDecoration.none),
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
                                                Icons.location_on,
                                                color: ColorApp.greyAD,
                                              ),
                                              Text(
                                                ' 2.3km',
                                                style: StyleApp.textStyle700(
                                                    color: ColorApp.greyAD,
                                                    decoration:
                                                        TextDecoration.none),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.watch_later_rounded,
                                                color: ColorApp.greyAD,
                                              ),
                                              Text(
                                                ' 90 phút',
                                                style: StyleApp.textStyle700(
                                                    color: ColorApp.greyAD,
                                                    decoration:
                                                        TextDecoration.none),
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
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
