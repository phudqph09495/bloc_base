import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../bloc/language/bloc_lang.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/appbar.dart';
import 'widget/list_question.dart';

class FrequentlyQuestionsScreen extends StatefulWidget {
  const FrequentlyQuestionsScreen({Key? key}) : super(key: key);

  @override
  State<FrequentlyQuestionsScreen> createState() =>
      _FrequentlyQuestionsScreenState();
}

class _FrequentlyQuestionsScreenState extends State<FrequentlyQuestionsScreen> {
  List<int> listIndexSelect1 = [];
  List<int> listIndexSelect2 = [];
  int indexAnwserCommon = -1;
  int indexAnwserService = -1;
  final String description =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit.";
  @override
  Widget build(BuildContext context) {
    // bool isShow = false;

    return BlocBuilder<BlocLanguage, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        List<String> listTile = [
          language.lamSaoDatLich,
          language.toiCoTheHuyDichVu,
          language.thanhToanAnToan,
          language.myService
        ];
        return Scaffold(
          body: Stack(
            children: [
              AppBarWidget(title: language.cauHoiThuongGap),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.12,
                height: MediaQuery.of(context).size.height,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: ColorApp.backgroundF5F6EE,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: SingleChildScrollView(
                      child: SizedBox(
                    height: MediaQuery.of(context).size.height * 1.5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(30),
                          Text(language.commonAsk,
                              style: StyleApp.styleGilroy700(
                                color: ColorApp.darkGreen,
                                fontSize: 18,
                              )),
                          const Gap(10),
                          ListQuestion(
                            listTile: listTile,
                            listIndex: listIndexSelect1,
                            description: description,
                            onTap: () {
                              setState(() {});
                            },
                          ),
                          const Gap(48),
                          Text(language.serviceQuestion,
                              style: StyleApp.styleGilroy700(
                                color: ColorApp.dark252525,
                                fontSize: 18,
                              )),
                          ListQuestion(
                            listTile: listTile,
                            listIndex: listIndexSelect2,
                            description: description,
                            onTap: () {
                              setState(() {});
                            },
                          ),
                          const Gap(48),
                        ],
                      ),
                    ),
                  )),
                ),
              ),
            ],
          ),
        );
      }
      return const Scaffold();
    });
  }
}
