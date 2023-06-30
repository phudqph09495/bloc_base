import 'package:bloc_base/bloc/language/bloc_lang.dart';
import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/widget/item/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../bloc/state_bloc.dart';
import '../../../config/const.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/input/text_filed.dart';

class RegisterMemberScreen extends StatefulWidget {
  const RegisterMemberScreen({Key? key}) : super(key: key);

  @override
  State<RegisterMemberScreen> createState() => _RegisterMemberScreenState();
}

class _RegisterMemberScreenState extends State<RegisterMemberScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLanguage, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: ColorApp.darkGreen,
            appBar: AppBar(
              leading: InkResponse(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close)),
              elevation: 0,
              backgroundColor: ColorApp.darkGreen,
              centerTitle: true,
              title: Text(
                language.dkDoiTac,
                style: StyleApp.styleGilroy700(
                  color: ColorApp.whiteF0,
                  fontSize: 18,
                ),
              ),
            ),
            body: Stack(
              children: [
                Positioned(
                    top: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/image_flower.png',
                      scale: 3,
                    )),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Const.size(context).width * 18 / 390),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Const.size(context).width * 30 / 390,
                        ),
                        Text(language.nhapTTDK,
                            style: StyleApp.styleGilroy700(
                                color: ColorApp.whiteF0, fontSize: 16)),
                        // Text.rich(),

                        const Gap(30),
                        TitleRichText(
                            language: language, title: language.tenSpa),
                        const Gap(12),
                        InputText1(
                          label: '',
                          radius: 10,
                        ),
                        const Gap(20),
                        TitleRichText(
                            language: language, title: language.taxNumber),
                        const Gap(12),

                        InputText1(
                          label: '',
                          radius: 10,
                        ),
                        SizedBox(
                          height: Const.size(context).width * 20 / 390,
                        ),
                        TitleRichText(
                            language: language, title: language.representative),
                        SizedBox(
                          height: Const.size(context).width * 12 / 390,
                        ),
                        InputText1(
                          label: '',
                          radius: 10,
                        ),
                        SizedBox(
                          height: Const.size(context).width * 20 / 390,
                        ),
                        TitleRichText(
                            language: language, title: language.phoneNumber),
                        const Gap(12),
                        InputText1(
                          label: '',
                          radius: 10,
                        ),
                        const Gap(20),
                        TitleRichText(
                            language: language, title: language.email),

                        const Gap(12),
                        InputText1(
                          label: '',
                          radius: 10,
                        ),
                        const Gap(20),
                        Text(
                          language.fanpageOrWebsite,
                          style:
                              StyleApp.styleGilroy700(color: ColorApp.whiteF0),
                        ),
                        const Gap(12),
                        InputText1(
                          label: '',
                          radius: 10,
                        ),
                        const Gap(20),
                        Text(
                          language.picture,
                          style:
                              StyleApp.styleGilroy700(color: ColorApp.whiteF0),
                        ),
                        const Gap(12),
                        InputText1(
                          hasSuffix: true,
                          label: '',
                          radius: 10,
                          suffix: Container(
                            margin: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: ColorApp.bottomBarABCA74,
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 23),
                              child: Text(
                                language.upload,
                                style: StyleApp.styleGilroy700(
                                    color: ColorApp.whiteF0),
                              ),
                            ),
                          ),
                        ),
                        const Gap(30),
                        ButtonWidget(
                          type: ButtonType.secondary,
                          text: language.gui,
                          onTap: () {},
                        ),
                        const Gap(20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return const Scaffold();
    });
  }
}

class TitleRichText extends StatelessWidget {
  const TitleRichText({
    super.key,
    required this.language,
    required this.title,
  });

  final Language language;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: title,
          style: StyleApp.styleGilroy700(color: ColorApp.whiteF0, fontSize: 14),
          children: const [
            TextSpan(text: ' *', style: TextStyle(color: ColorApp.yellow))
          ]),
      // Text.rich(),
    );
  }
}
