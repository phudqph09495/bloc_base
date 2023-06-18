import 'package:bloc_base/bloc/language/bloc_lang.dart';
import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/widget/item/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocBuilder<BlocLang, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return Scaffold(
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
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Const.size(context).width * 18 / 390),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Const.size(context).width * 30 / 390,
                  ),
                  Text(
                    language.nhapTTDK,
                    style: StyleApp.styleGilroy700(
                        color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    height: Const.size(context).width * 30 / 390,
                  ),
                  Text(
                    language.tenSpa,
                    style: StyleApp.styleGilroy700(
                      color: Colors.white,
                    ),
                  ),
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
                  Text(
                    language.diaChi,
                    style: StyleApp.styleGilroy700(
                      color: Colors.white,
                    ),
                  ),
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
                  Text(
                    language.nguoiDaiDien,
                    style: StyleApp.styleGilroy700(
                      color: Colors.white,
                    ),
                  ),
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
                  Text(
                    language.dienThoai,
                    style: StyleApp.styleGilroy700(
                      color: Colors.white,
                    ),
                  ),
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
                  Text(
                    'Email',
                    style: StyleApp.styleGilroy700(
                      color: Colors.white,
                    ),
                  ),
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
                  Text(
                    language.fanpage,
                    style: StyleApp.styleGilroy700(color: Colors.white),
                  ),
                  SizedBox(
                    height: Const.size(context).width * 12 / 390,
                  ),
                  InputText1(
                    label: '',
                    radius: 10,
                  ),
                  SizedBox(
                    height: Const.size(context).width * 30 / 390,
                  ),
                  ButtonWidget(
                    type: ButtonType.secondary,
                    text: language.gui,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: Const.size(context).width * 20 / 390,
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
