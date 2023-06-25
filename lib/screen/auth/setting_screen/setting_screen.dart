import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:bloc_base/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import '../../../bloc/language/bloc_lang.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/appbar.dart';
import '../../../widget/item/button.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLanguage, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              backgroundColor: ColorApp.darkGreen,
              appBar: AppBarWidget(title: language.caiDatThongBao),
              body: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: ColorApp.whiteF0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(25),
                      Text(
                        language.thayDoiMK,
                        style: StyleApp.textStyle700(
                            color: ColorApp.dark252525, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(language.nhanThongBao,
                                style: StyleApp.textStyle500(
                                    color: ColorApp.black3F)),
                          ),
                          Row(
                            children: [
                              Text('${language.tat}  ',
                                  style: StyleApp.textStyle500(
                                      color: ColorApp.black3F)),
                              FlutterSwitch(
                                  padding: 1,
                                  activeToggleColor: ColorApp.bottomBarABCA74,
                                  height: 26,
                                  width: 50,
                                  switchBorder: Border.all(
                                      color: ColorApp.bottomBarABCA74),
                                  value: isSwitched,
                                  inactiveColor: Colors.white,
                                  toggleColor: ColorApp.bottomBarABCA74,
                                  activeColor: Colors.white,
                                  onToggle: (val) {
                                    setState(() {
                                      isSwitched = val;
                                    });
                                  }),
                              Text(
                                '  ${language.bat}',
                                style: StyleApp.textStyle500(
                                    color: ColorApp.black3F),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  backgroundColor: ColorApp.background,
                                  titlePadding: const EdgeInsets.only(
                                      top: 20, left: 20, right: 20),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 20),
                                  actionsPadding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 30),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(),
                                      Container(
                                        color: Colors.red,
                                        child: GestureDetector(
                                          onTap: () => Navigator.pop(context),
                                          child: const Icon(
                                            Icons.close,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  content: Text(
                                    language.doYouWantDeleteAccount,
                                    style: StyleApp.styleGilroy700(
                                        fontSize: 18,
                                        color: ColorApp.dark252525),
                                  ),
                                  actions: [
                                    Column(
                                      children: [
                                        ButtonWidget(
                                          text: language.khong,
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          type: ButtonType.secondary,
                                        ),
                                        const Gap(10),
                                        ButtonWidget(
                                          text: language.dongY,
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, RouterName.homeScreen);
                                          },
                                          type: ButtonType.grey,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.delete_outlined,
                                    color: ColorApp.pinkF59398,
                                  ),
                                  const Gap(8),
                                  Text(
                                    language.deleteAccount,
                                    style: StyleApp.styleGilroy700(
                                        fontSize: 16,
                                        color: ColorApp.pinkF59398),
                                  ),
                                ],
                              ),
                            )),
                      )
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 5),
                      //   child: ButtonWidget(
                      //     type: ButtonType.secondary,
                      //     text: language.luuThayDoi.toUpperCase(),
                      //     onTap: () {},
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ));
      }
      return const Scaffold();
    });
  }
}
