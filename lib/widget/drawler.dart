import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/language/bloc_lang.dart';
import '../bloc/language/event_bloc2.dart';
import '../bloc/state_bloc.dart';
import '../config/const.dart';
import '../model/model_local.dart';
import '../styles/init_style.dart';

class ItemDrawer extends StatefulWidget {
  @override
  State<ItemDrawer> createState() => _ItemDrawerState();
}

class _ItemDrawerState extends State<ItemDrawer> {
  List<ModelLocal> list = [
    ModelLocal(id: 'Tiếng Việt', title: 'coVN.png'),
    ModelLocal(id: 'English', title: 'coAnh.png'),
  ];
  BlocLang blocLang = BlocLang();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Drawer(
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: BlocBuilder<BlocLang, StateBloc>(
            builder: (context, StateBloc state) {
              if (state is LoadSuccess) {
                Language lang = state.data;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: Const.size(context).width * 0.1,
                          left: 15,
                          right: 15,
                          bottom: Const.size(context).width * 0.23076923076),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.clear)),
                          BlocListener(
                            bloc: blocLang,
                            listener: (_, StateBloc state) {
                              if (state is LoadSuccess) {
                                context.read<BlocLang>().add(getLang());
                              }
                            },
                            child: PopupMenuButton(
                              itemBuilder: (_) {
                                return List.generate(
                                    list.length,
                                    (index) => PopupMenuItem(
                                          padding: EdgeInsets.only(left: 20),
                                          value: index,
                                          onTap: () {
                                            if (index == 0) {
                                              blocLang.add(sangVn());
                                            } else if (index == 1) {
                                              blocLang.add(sangE());
                                            }
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${list[index].id}',
                                                style: StyleApp.textStyle500(
                                                    color: Colors.black),
                                                textAlign: TextAlign.end,
                                              ),
                                              Container(
                                                height:
                                                    Const.size(context).width *
                                                        0.06153846153,
                                                width:
                                                    Const.size(context).width *
                                                        0.06153846153,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle),
                                                child: ClipOval(
                                                    child: Image.asset(
                                                  'assets/images/${list[index].title}',
                                                  fit: BoxFit.cover,
                                                )),
                                              )
                                            ],
                                          ),
                                        ));
                              },
                              child: Row(
                                children: [
                                  Text(
                                    '${lang.string1}',
                                    style: StyleApp.textStyle700(
                                        color: ColorApp.dark),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: Const.size(context).width *
                                        0.06153846153,
                                    width: Const.size(context).width *
                                        0.06153846153,
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle),
                                    child: ClipOval(
                                        child: Image.asset(
                                      'assets/images/${lang.co}',
                                      fit: BoxFit.cover,
                                    )),
                                  )
                                ],
                              ),
                            ),
                          )
                          // BlocListener(bloc: blocLang,
                          //   listener: (context,StateBloc state) { if(state is LoadSuccess){
                          //     context.read<BlocLang>().add(getLang());
                          //   } },
                          //   child: InkWell(
                          //     onTap: (){
                          //       blocLang.add(sangE());
                          //     },
                          //     child:,
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    buildRow(
                        title: '${lang.gioiThieu}',
                        onTap: () {},
                        numW: SizedBox()),
                    Divider(),
                    buildRow(
                        title: '${lang.hoTro}', onTap: () {}, numW: SizedBox()),
                    Divider(),
                    buildRow(
                        title: '${lang.gioHang}',
                        onTap: () {},
                        numW: Container(
                          decoration: BoxDecoration(
                              color: ColorApp.darkGreen,
                              shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '6',
                              style: StyleApp.textStyle600(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ),
                        )),
                    Divider(),
                    buildRow(
                        title: '${lang.ttTK}', onTap: () {}, numW: SizedBox()),
                    Divider(),
                    buildRow(
                        title: '${lang.thongBao}',
                        onTap: () {},
                        numW: Container(
                          decoration: BoxDecoration(
                              color: ColorApp.darkGreen,
                              shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '6',
                              style: StyleApp.textStyle600(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ),
                        )),
                    Divider(),
                    buildRow(
                        title: '${lang.dieuKhoan}',
                        onTap: () {},
                        numW: SizedBox()),
                  ],
                );
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }

  buildRow({
    required String title,
    Function()? onTap,
    required Widget numW,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: StyleApp.textStyle700(
                  fontSize: 16,
                ),
              ),
              numW,
            ],
          ),
        ),
      ),
    );
  }
}
