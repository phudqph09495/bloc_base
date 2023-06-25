import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/language/bloc_lang.dart';
import '../../../bloc/language/event_bloc2.dart';
import '../../../bloc/state_bloc.dart';
import '../../../styles/colors.dart';
import '../../../styles/styles.dart';
import '../appbar.dart';

class DataEmptyWidget extends StatelessWidget {
  const DataEmptyWidget({
    super.key,
    required this.titleAppbar,
  });
  final String titleAppbar;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLanguage, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return Scaffold(
          body: Stack(
            children: [
              AppBarWidget(title: titleAppbar),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.12,
                height: MediaQuery.of(context).size.height * 1.5,
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1.5,
                  decoration: const BoxDecoration(
                      color: ColorApp.whiteF0,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        language.emptyData,
                        style: StyleApp.textStyle500(fontSize: 16),
                      ),
                    ),
                  ),
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
