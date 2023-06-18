import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:group_button/group_button.dart';

import '../../bloc/language/bloc_lang.dart';
import '../../bloc/state_bloc.dart';

import '../../styles/styles.dart';
import '../../widget/item/appbar.dart';
import '../search/search_tab_screen/bloc/search_tab_bloc.dart';
import '../search/search_tab_screen/bloc/search_tab_event.dart';

class CartNew extends StatefulWidget {
  const CartNew({super.key});

  @override
  State<CartNew> createState() => _CartNewState();
}

class _CartNewState extends State<CartNew> {
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
    return BlocBuilder<BlocLang, StateBloc>(builder: (context, state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return Scaffold(
          backgroundColor: ColorApp.darkGreen,
          appBar: AppBar(
            centerTitle: true,
            leading: AppBarBackButton(
              onTap: () => Navigator.pop(context),
            ),
            title: Text(
              language.yeuThich,
              style: StyleApp.textStyle700(color: Colors.white, fontSize: 20),
            ),
            elevation: 0,
            backgroundColor: ColorApp.darkGreen,
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
                children: const [
                  Padding(
                    padding: EdgeInsets.all(16),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
