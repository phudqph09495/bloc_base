import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:group_button/group_button.dart';
import '../../../bloc/language/bloc_lang.dart';
import '../../../config/const.dart';
import '../../../router/router.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/appbar.dart';
import '../../../widget/item/button.dart';
import '../../../widget/item/input/text_filed.dart';

class TTHTScreen extends StatefulWidget {
  const TTHTScreen({Key? key}) : super(key: key);

  @override
  State<TTHTScreen> createState() => _TTHTScreenState();
}

class _TTHTScreenState extends State<TTHTScreen> {
  final controller = GroupButtonController();
  int ind=0;
  String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.selectIndex(ind);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<BlocLanguage, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              backgroundColor: ColorApp.darkGreen,
              appBar: AppBarWidget(title: language.ttHT2),
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
                      children: [ Gap(20),
                        InputText1(label: language.hoTen,colorBg: Colors.white,radius: 5,),
                        Gap(5),
                        InputText1(label: language.email,colorBg: Colors.white,radius: 5,),
                        Gap(5),
                        InputText1(label: language.dienThoai,colorBg: Colors.white,radius: 5,),
                        Gap(5),

                        InputText1(label: language.noidung,colorBg: Colors.white,radius: 5,maxLine: 5,),
                        Gap(15),
                        ButtonWidget(
                          type: ButtonType.primary,
                          text: language.gui,
                          onTap: () {},
                        ),
                        Gap(2000),


                      ],
                    ),
                  ),
                ),
              ),
            ));
      }
      return const Scaffold();
    });
  }
}

class ShopFeedbackWidget extends StatelessWidget {
  const ShopFeedbackWidget({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        decoration: BoxDecoration(
            color: ColorApp.backgroundF5F6EE,
            border: Border.all(color: ColorApp.borderEAEAEA),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Row(
              children: [
                Text(
                  'Phản hồi của Spa',
                  style: StyleApp.styleGilroy700(
                      fontSize: 14, color: ColorApp.dark252525),
                ),
                const SizedBox.shrink()
              ],
            ),
            const Gap(5),
            Text(
              description,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: StyleApp.textStyle500(color: ColorApp.dark500),
            )
          ]),
        ),
      ),
    );
  }
}

class CustomerFeedback extends StatelessWidget {
  const CustomerFeedback({
    required this.description,
    super.key,
  });
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: ColorApp.borderEAEAEA),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          const Gap(5),
          const RatingAndDateTime(),
          const Gap(5),
          Row(
            children: [
              RichText(
                text: TextSpan(
                    text: 'Dịch vụ: ',
                    style: StyleApp.textStyle500(color: ColorApp.grey82),
                    children: [
                      TextSpan(
                          text: 'Chăm sóc da mặt ',
                          style:
                          StyleApp.textStyle500(color: ColorApp.darkGreen))
                    ]),
              ),
              const SizedBox.shrink()
            ],
          ),
          const Gap(5),
          Text(
            description,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: StyleApp.textStyle500(color: ColorApp.dark500),
          )
        ]),
      ),
    );
  }
}

class RatingAndDateTime extends StatelessWidget {
  const RatingAndDateTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              5,
                  (index) => const Icon(
                Icons.star,
                size: 12,
                color: ColorApp.yellow,
              )),
        ),
        Text(
          '18/5/2023',
          style: StyleApp.textStyle500(color: ColorApp.dark500),
        )
      ],
    );
  }
}
