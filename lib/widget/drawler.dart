import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/language/bloc_lang.dart';
import '../bloc/language/event_bloc2.dart';
import '../bloc/state_bloc.dart';
import '../config/const.dart';
import '../styles/init_style.dart';

class ItemDrawer extends StatefulWidget {
  @override
  State<ItemDrawer> createState() => _ItemDrawerState();
}

class _ItemDrawerState extends State<ItemDrawer> {
  BlocLang blocLang=BlocLang();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Drawer(
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(top:Const.size(context).width*0.1 ,left: 15,right: 15,bottom:Const.size(context).width*0.23076923076 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.clear),
                   BlocBuilder<BlocLang,StateBloc>(builder: (context,StateBloc state){
                   if(state is LoadSuccess){
                     Language lang=state.data;
                        return  BlocListener(bloc: blocLang,
                          listener: (context,StateBloc state) { if(state is LoadSuccess){
                            context.read<BlocLang>().add(getLang());
                          } },
                          child: InkWell(
                       onTap: (){
                         blocLang.add(sangE());
                       },
                       child: Row(
                           children: [
                             Text(
                               '${lang.string1}',
                               style: StyleApp.textStyle700(color: ColorApp.dark),
                             ),
                             SizedBox(width: 5,),
                             Container(
                               height: Const.size(context).width * 0.06153846153,
                               width: Const.size(context).width * 0.06153846153,
                               decoration: BoxDecoration(shape: BoxShape.circle),
                               child: ClipOval(child: Image.asset('assets/images/coVN.png',fit: BoxFit.cover,)),
                             )
                           ],
                       ),
                     ),
                        );
                   }
                   return SizedBox();
                   }, )
                  ],
                ),
              ),
              buildRow(
                title: 'MẸ VÀ BÉ',
                onTap: () {},
              ),
              Divider(),
              buildRow(
                title: 'SỨC KHOẺ & SẮC ĐẸP',
                onTap: () {},
              ),
              Divider(),
              buildRow(
                title: 'NHÀ CỬA & ĐỜI SỐNG',
                onTap: () {},
              ),
              Divider(),
              buildRow(
                title: 'BÁCH HOÁ ONLINE',
                onTap: () {},
              ),
              Divider(),
              buildRow(
                title: 'THỜI TRANG',
                onTap: () {},
              ),
              Divider(),
              buildRow(
                title: 'ĐIỆN MÁY',
                onTap: () {},
              ),
              Divider(),
              buildRow(
                title: 'NHÀ THÔNG MINH',
                onTap: () {},
              ),
              Divider(),
              buildRow(
                title: 'SẢN PHẨM HÀN QUỐC (KOREA)',
                onTap: () {},
              ),
              Divider(),
              buildRow(
                title: 'SẢN PHẨM ÚC (AUSTRALIA)',
                onTap: () {},
              ),
              Divider(),
              buildRow(
                title: 'SẢN PHẨM ĐỨC (GERMANY)',
                onTap: () {},
              ),
              Divider(),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildRow({
    required String title,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: StyleApp.textStyle700(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
