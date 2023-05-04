import 'package:bloc_base/bloc/auth/bloc_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/check_log_state.dart';
import '../bloc/state_bloc.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  BlocLogin blocLogin = BlocLogin();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder(
              builder: (_, StateBloc state) {
                //giao diện khi load thành công
                if (state is LoadSuccess) {
                  return SizedBox();
                }
                //giao diện khi loading
                if (state is Loading) {
                  return SizedBox();
                }
                //giao diện khi load thất bại
                if (state is LoadFail) {
                  return SizedBox();
                }
                // giao diện mặc định
                return SizedBox();
              },
              bloc: blocLogin,
            ),
            BlocListener(
              listener: (_, StateBloc state) {
                CheckLogState.check(context, state: state,msg: 'dòng thông báo khi submit thành công',success: (){
                  // function chạy khi load thành công
                });
              },
              bloc: blocLogin,
              child: InkWell(
                onTap: () {
                  // function khi bấm
                },
                child: Icon(Icons.add),
              ),
            )
          ],
        ),
      ),
    );
  }
}
