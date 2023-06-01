import 'package:bloc_base/bloc/language/bloc_lang.dart';
import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/state_bloc.dart';
import '../../config/const.dart';
import '../../styles/init_style.dart';
import '../../widget/item/input/text_filed.dart';

class DangKyTVScreen extends StatefulWidget {
  const DangKyTVScreen({Key? key}) : super(key: key);

  @override
  State<DangKyTVScreen> createState() => _DangKyTVScreenState();
}

class _DangKyTVScreenState extends State<DangKyTVScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLang, StateBloc>(builder: (_, StateBloc state) {
      if(state is LoadSuccess){
        Language language=state.data;
        return Scaffold(
          backgroundColor: ColorApp.darkGreen,
          appBar: AppBar(
            backgroundColor: ColorApp.darkGreen,
            centerTitle:  true,
            title: Text('${language.dkDoiTac}',style: StyleApp.textStyle700(color: Colors.white,fontSize: 20,),
          ),
        ),
          body: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: Const.size(context).width*18/390),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Const.size(context).width*30/390 ,),
                  Text('${language.nhapTTDK}',style: StyleApp.textStyle700(color: Colors.white,fontSize: 16),),
                  SizedBox(height: Const.size(context).width*30/390 ,),
                  Text('${language.tenSpa}',style: StyleApp.textStyle700(color: Colors.white,fontSize: 16),),
                  SizedBox(height: Const.size(context).width*12/390 ,),
                  InputText1(label: '',radius: 10,),
                  SizedBox(height: Const.size(context).width*20/390 ,),
                  Text('${language.diaChi}',style: StyleApp.textStyle700(color: Colors.white,fontSize: 16),),
                  SizedBox(height: Const.size(context).width*12/390 ,),
                  InputText1(label: '',radius: 10,),
                  SizedBox(height: Const.size(context).width*20/390 ,),
                  Text('${language.nguoiDaiDien}',style: StyleApp.textStyle700(color: Colors.white,fontSize: 16),),
                  SizedBox(height: Const.size(context).width*12/390 ,),
                  InputText1(label: '',radius: 10,),
                  SizedBox(height: Const.size(context).width*20/390 ,),
                  Text('${language.dienThoai}',style: StyleApp.textStyle700(color: Colors.white,fontSize: 16),),
                  SizedBox(height: Const.size(context).width*12/390 ,),
                  InputText1(label: '',radius: 10,),
                  SizedBox(height: Const.size(context).width*20/390 ,),
                  Text('Email',style: StyleApp.textStyle700(color: Colors.white,fontSize: 16),),
                  SizedBox(height: Const.size(context).width*12/390 ,),
                  InputText1(label: '',radius: 10,),
                  SizedBox(height: Const.size(context).width*20/390 ,),
                  Text('${language.fanpage}',style: StyleApp.textStyle700(color: Colors.white,fontSize: 16),),
                  SizedBox(height: Const.size(context).width*12/390 ,),
                  InputText1(label: '',radius: 10,),
                  SizedBox(height: Const.size(context).width*30/390 ,),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.065,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorApp.orange,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical:
                          Const.size(context).width * 0.02615384615),
                      child: Text(
                        '${language.gui}',
                        style:
                        StyleApp.textStyle700(color: ColorApp.dark),
                      ),
                    ),
                  ),
                  SizedBox(height: Const.size(context).width*20/390 ,),

                ],
              ),
            ),
          ),
        );
      }
      return Scaffold();
    });
  }
}
