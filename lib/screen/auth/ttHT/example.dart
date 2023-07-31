import 'package:bloc_base/bloc/language/bloc_lang.dart';
import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/state_bloc.dart';
import '../../../config/const.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLanguage, StateBloc>(builder: (_,StateBloc state){
      if(state is LoadSuccess){
        Language language=state.data;
        return Scaffold(
          appBar: AppBar(
            title: Text(language.thanhToan),
            actions: [
              SizedBox(height: Const.sizeHeight(context, 30),width: Const.sizeWidth(context, 30),)
            ],
          ),
        );
      }
      return Scaffold();
    });
  }
}
