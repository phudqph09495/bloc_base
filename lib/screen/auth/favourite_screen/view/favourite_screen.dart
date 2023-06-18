import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';
import 'package:bloc_base/homepage.dart';
import 'package:bloc_base/screen/search/search_tab_screen/bloc/search_tab_bloc.dart';
import 'package:bloc_base/screen/search/search_tab_screen/bloc/search_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:group_button/group_button.dart';
import '../../../../bloc/language/bloc_lang.dart';
import '../../../../config/const.dart';
import '../../../../styles/init_style.dart';
import '../../../../widget/item/appbar.dart';
import '../../../search/search_tab_screen/bloc/search_tab_event.dart';
import '../../../search/search_tab_screen/view/search_tab_screen.dart';
part 'widget/card_spa_item.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final controller = GroupButtonController();
  bool isService = true;

  @override
  void initState() {
    context.read<SearchTabBloc>().add(GetDataSearchTabEvent());
    super.initState();
    controller.selectIndex(0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLang, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return Scaffold(
          backgroundColor: ColorApp.darkGreen,
          appBar: AppBarWidget(
            title: language.yeuThich,
          ),
          body: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                color: ColorApp.whiteF0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: GroupButton(
                            controller: controller,
                            options: GroupButtonOptions(
                                buttonWidth: Const.size(context).width * 0.44,
                                selectedColor: ColorApp.darkGreen,
                                mainGroupAlignment:
                                    MainGroupAlignment.spaceBetween,
                                unselectedTextStyle: StyleApp.textStyle500(
                                    color: ColorApp.dark500),
                                borderRadius: BorderRadius.circular(12)),
                            isRadio: true,
                            onSelected: (name, index, isSelected) {
                              if (index == 0) {
                                isService = true;
                                controller.selectIndex(0);
                              } else if (index == 1) {
                                isService = false;
                                controller.selectIndex(1);
                              }
                              setState(() {});
                            },
                            buttons: [
                              (language.spa),
                              (language.dichvu),
                            ],
                          ),
                        ),
                        const Gap(5),
                        isService
                            ? ListView.builder(
                                primary: false,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MyHomePage(
                                              index: 2,
                                            ),
                                          ));
                                    },
                                    child: const CardShopItem(),
                                  );
                                },
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 10,
                              )
                            : BlocBuilder<SearchTabBloc, SearchTabState>(
                                builder: (context, state) {
                                  if (state is LoadingState) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (state is LoadSuccessState) {
                                    return ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          const Gap(8),
                                      primary: false,
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (context, index) {
                                        return CardServiceItem(
                                          index: index,
                                          isFavorite: false,
                                          state: state,
                                        );
                                      },
                                      shrinkWrap: true,
                                      itemCount:
                                          state.serviceModel.data!.length,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                    );
                                  } else if (state is DataEmptyState) {}
                                  return const SizedBox.shrink();
                                },
                              )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      return const Scaffold();
    });
  }
}
