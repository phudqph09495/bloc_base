import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../bloc/language/bloc_lang.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/appbar.dart';

class IntroduceScreen extends StatelessWidget {
  const IntroduceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String list1 =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit.";
    String list2 =
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex. 

Ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''';
    String list3 =
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex. ''';
    String list4 =
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex. ''';
    return BlocBuilder<BlocLang, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return Scaffold(
          backgroundColor: ColorApp.darkGreen,
          appBar: AppBarWidget(title: language.dangNhap),
          body: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(30),
                    Center(child: SvgPicture.asset('assets/svg/LogoApp.svg')),
                    const Gap(30),
                    Text(
                      list1,
                      style: StyleApp.textStyle500(color: ColorApp.dark500),
                    ),
                    const Gap(20),
                    Image.asset('assets/images/image_introduce.png'),
                    const Gap(25),
                    Text(language.gioiThieu,
                        style: StyleApp.styleGilroy700(
                          fontSize: 18,
                          color: ColorApp.dark252525,
                        )),
                    const Gap(12),
                    Text(
                      list2,
                      style: StyleApp.textStyle500(color: ColorApp.dark500),
                    ),
                    const Gap(25),
                    Text(language.myService,
                        style: StyleApp.styleGilroy700(
                          color: ColorApp.dark252525,
                          fontSize: 16,
                        )),
                    const Gap(10),
                    Text(
                      list3,
                      style: StyleApp.textStyle500(color: ColorApp.dark500),
                    ),
                    const Gap(25),
                    Text(
                      language.target,
                      style: StyleApp.styleGilroy700(
                        color: ColorApp.dark252525,
                        fontSize: 16,
                      ),
                    ),
                    const Gap(8),
                    Text(
                      list4,
                      style: StyleApp.textStyle500(color: ColorApp.dark500),
                    ),
                    const Gap(45)
                  ],
                ),
              ),
            ),
          ),
        );
      }
      return const Scaffold();
    });
  }
}
