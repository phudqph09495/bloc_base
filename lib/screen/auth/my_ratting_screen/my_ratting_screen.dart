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

class RattingScreen extends StatefulWidget {
  const RattingScreen({Key? key}) : super(key: key);

  @override
  State<RattingScreen> createState() => _RattingScreenState();
}

class _RattingScreenState extends State<RattingScreen> {
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
              appBar: AppBarWidget(title: language.danhGiaCuaToi),
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
                      children: [
                        const Gap(20),
                        GroupButton(
                          controller: controller,
                          options: GroupButtonOptions(
                            unselectedBorderColor: ColorApp.borderEAEAEA,
                              selectedBorderColor: Colors.transparent,
                              buttonWidth: Const.size(context).width * 0.44,
                              selectedColor: ColorApp.bottomBarABCA74,
                              mainGroupAlignment:
                              MainGroupAlignment.spaceBetween,
                              unselectedTextStyle: StyleApp.textStyle500(
                                  color: ColorApp.dark500),
                              borderRadius: BorderRadius.circular(12)),
                          isRadio: true,
                          onSelected: (name, index, isSelected) {
                            if (index == 0) {
ind=0;
                            } else if (index == 1) {
                              ind=1;
                            }
                            setState(() {});
                          },
                          buttons: [
                            (language.myRatting),
                            (language.vietDanhGia),
                          ],
                        ),
                   ind==0?     Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              language.myRatting,
                              style: StyleApp.styleGilroy700(
                                  fontSize: 20, color: ColorApp.dark252525),
                            ),
                            const Gap(10),
                            Text(
                              'Đánh giá của bạn cho những dịch dịch vụ spa đã sử dụng',
                              style: StyleApp.textStyle600(
                                  color: ColorApp.dark500, fontSize: 16),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Divider(
                                height: 1,
                                color: ColorApp.dark500,
                              ),
                            ),
                            ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  if (index != 3) {
                                    return CustomerFeedback(
                                        description: description);
                                  } else {
                                    return ShopFeedbackWidget(
                                        description: description);
                                  }
                                },
                                separatorBuilder: (context, index) => const Gap(15),
                                itemCount: 10)
                          ],
                        ):
                   ListView.separated(
                     separatorBuilder: (context, index) => const Gap(8),
                     padding: EdgeInsets.zero,
                     itemBuilder: (context, index) {
                       return InkWell(
                         onTap: () {
                           Navigator.pushNamed(
                               context, RouterName.rateSer);
                         },
                         child: Container(
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: ColorApp.background),
                           child: Padding(
                             padding: const EdgeInsets.all(10.0),
                             child: Row(
                               crossAxisAlignment:
                               CrossAxisAlignment.center,
                               children: [
                                 Expanded(
                                   flex: 8,
                                   child: Stack(
                                     alignment: Alignment.bottomCenter,
                                     children: [
                                       ClipRRect(
                                         borderRadius:
                                         BorderRadius.circular(5),
                                         child: SizedBox(
                                           width: Const.size(context)
                                               .width *
                                               0.45,
                                           height: Const.size(context)
                                               .height *
                                               0.1,
                                           child: Image.asset(
                                             'assets/images/exSpa.png',
                                             fit: BoxFit.cover,
                                           ),
                                         ),
                                       ),

                                     ],
                                   ),
                                 ),
                                 const Gap(10),
                                 Expanded(
                                     flex: 16,
                                     child: SizedBox(
                                       height:
                                       Const.size(context).height *
                                           0.1,
                                       child: Column(
                                         mainAxisAlignment:
                                         MainAxisAlignment
                                             .spaceBetween,
                                         crossAxisAlignment:
                                         CrossAxisAlignment.start,
                                         children: [
                                           Text(
                                             'Chăm sóc da mặt',
                                             style:
                                             StyleApp.textStyle600(
                                                 color: ColorApp
                                                     .dark252525),
                                           ),
                                         Row(
                                           children: [
                                             const Icon(
                                               Icons.home,
                                               size: 16,
                                               color: ColorApp.darkGreen,
                                             ),
                                             Text(
                                               ' Sviet Beauty Spa',
                                               style: StyleApp.textStyle600(
                                                 fontSize: 13,
                                                 color: ColorApp.darkGreen,
                                               ),
                                             ),
                                           ],
                                         ),
                                           Row(
                                             children: [
                                               Text(
                                                 'đ',
                                                 style: StyleApp
                                                     .textStyle500(
                                                   color: ColorApp
                                                       .dark252525,
                                                   decoration: TextDecoration.underline
                                                 ),
                                               ),
                                               Text(
                                                 ' ',
                                                 style: StyleApp
                                                     .textStyle400(
                                                     color: ColorApp
                                                         .dark500,

                                                 ),
                                               ),
                                               Text(
                                                 '1.200.000',
                                                 style: StyleApp
                                                     .textStyle500(
                                                     color: ColorApp
                                                         .dark252525,

                                                 ),
                                               ),
                                             ],
                                           ),
                                         ],
                                       ),
                                     )),
                                 Expanded(flex: 10,
                                   child: Container(decoration: BoxDecoration(
                                     color: ColorApp.darkGreen,
                                     borderRadius: BorderRadius.circular(10)

                                   ),
                                     child: Padding(
                                       padding:  EdgeInsets.symmetric(vertical: Const.sizeHeight(context, 7),horizontal:Const.sizeWidth(context, 16) ),
                                       child: Text(language.danhGia2.toUpperCase(),style: StyleApp.textStyle600(color: Colors.white,fontSize: 12),textAlign: TextAlign.center,),
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                       );
                     },
                     shrinkWrap: true,
                     physics: const NeverScrollableScrollPhysics(),
                     itemCount: 18,
                   ),

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
