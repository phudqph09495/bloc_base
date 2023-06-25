import 'package:bloc_base/screen/cart/cart_screen/cart_screen.dart';
import 'package:bloc_base/screen/auth/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../bloc/language/bloc_lang.dart';
import '../bloc/language/event_bloc2.dart';
import '../bloc/state_bloc.dart';
import '../config/const.dart';
import '../model/model_local.dart';
import '../styles/init_style.dart';

class ItemDrawer extends StatefulWidget {
  const ItemDrawer({super.key});

  @override
  State<ItemDrawer> createState() => _ItemDrawerState();
}

class _ItemDrawerState extends State<ItemDrawer> {
  List<ModelLocal> list = [
    ModelLocal(id: 'Tiếng Việt', title: 'coVN.png'),
    ModelLocal(id: 'English', title: 'coAnh.png'),
  ];
  BlocLanguage blocLang = BlocLanguage();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Drawer(
        backgroundColor: ColorApp.backgroundF5F6EE,
        child: SingleChildScrollView(
          child: BlocBuilder<BlocLanguage, StateBloc>(
            builder: (context, StateBloc state) {
              if (state is LoadSuccess) {
                Language lang = state.data;
                return Padding(
                  padding: EdgeInsets.only(
                      top: 10 + MediaQuery.of(context).viewPadding.top,
                      left: 15,
                      right: 15,
                      bottom: Const.size(context).width * 0.23076923076),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.clear)),
                          BlocListener(
                            bloc: blocLang,
                            listener: (_, StateBloc state) {
                              if (state is LoadSuccess) {
                                context.read<BlocLanguage>().add(GetLanguage());
                              }
                            },
                            child: PopupMenuButton(
                              itemBuilder: (_) {
                                return List.generate(
                                    list.length,
                                    (index) => PopupMenuItem(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          value: index,
                                          onTap: () {
                                            if (index == 0) {
                                              blocLang.add(ConvertToVNEvent());
                                            } else if (index == 1) {
                                              blocLang.add(ConvertToEngEvent());
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
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: ClipOval(
                                                    child: Image.asset(
                                                  'assets/images/${list[index].title}',
                                                  fit: BoxFit.cover,
                                                )),
                                              ),
                                              // const Gap(16)
                                            ],
                                          ),
                                        ));
                              },
                              child: Row(
                                children: [
                                  Text(
                                    lang.string1,
                                    style: StyleApp.textStyle700(
                                        color: ColorApp.dark252525),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: Const.size(context).width *
                                        0.06153846153,
                                    width: Const.size(context).width *
                                        0.06153846153,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle),
                                    child: ClipOval(
                                        child: Image.asset(
                                      'assets/images/${lang.co}',
                                      fit: BoxFit.cover,
                                    )),
                                  ),
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
                      const Gap(90),
                      buildRow(
                          title: lang.gioiThieu,
                          onTap: () {},
                          numW: const SizedBox()),
                      const Divider(),
                      buildRow(
                          title: lang.hoTro,
                          onTap: () {},
                          numW: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '',
                              style: StyleApp.textStyle600(
                                  fontSize: 14, color: Colors.white),
                            ),
                          )),
                      const Divider(),
                      buildRow(
                          title: lang.gioHang,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const GioHangScreen()));
                          },
                          numW: Container(
                            decoration: const BoxDecoration(
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
                      const Divider(),
                      buildRow(
                          title: lang.ttTK,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProfileScreen()));
                          },
                          numW: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '',
                              style: StyleApp.textStyle600(
                                  fontSize: 14, color: Colors.white),
                            ),
                          )),
                      const Divider(),
                      buildRow(
                          title: lang.thongBao,
                          onTap: () {},
                          numW: Container(
                            decoration: const BoxDecoration(
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
                      const Divider(),
                      buildRow(
                          title: lang.dieuKhoan,
                          onTap: () {},
                          numW: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '',
                              style: StyleApp.textStyle600(
                                  fontSize: 14, color: Colors.white),
                            ),
                          )),
                    ],
                  ),
                );
              }
              return const SizedBox();
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: StyleApp.styleGilroy700(
                fontSize: 16,
              ),
            ),
            numW,
          ],
        ),
      ),
    );
  }
}
