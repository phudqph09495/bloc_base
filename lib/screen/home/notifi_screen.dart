import 'package:bloc_base/bloc/language/bloc_lang.dart';
import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/config/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bloc/state_bloc.dart';
import '../../styles/init_style.dart';

class NotifyScreen extends StatefulWidget {
  const NotifyScreen({Key? key}) : super(key: key);

  @override
  State<NotifyScreen> createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLang,StateBloc>(builder: (context,StateBloc state){
      if(state is LoadSuccess){
        Language language=state.data;
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.clear,
                  color: Colors.white,
                )),
            centerTitle: true,
            backgroundColor: ColorApp.darkGreen,
            title: Text(
              '${language.thongBao}',
              style: StyleApp.textStyle700(color: Colors.white, fontSize: 18),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Const.size(context).width * 0.05,
                  vertical: Const.size(context).width * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${language.homNay}',
                      style: StyleApp.textStyle700(
                          fontSize: 16, color: ColorApp.dark)),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Const.size(context).width * 0.025),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset('assets/svg/notiIcon.svg'),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(width: Const.size(context).width*0.65,
                                  child: Text(
                                    'Thanh toán không thành côndsfsdjfiosdufiosdjsdiojfiosdfdsfsdfsdfhsduhfdjhg',

                                    style:
                                    StyleApp.textStyle600(color: ColorApp.dark),
                                  ),
                                ),
                                SizedBox(
                                  height: Const.size(context).width * 0.02,
                                ),
                                Text(
                                  '10:21 pm',
                                  style: StyleApp.textStyle400(
                                      color: Color(0xff717171)),
                                )
                              ],
                            ),
                            Icon(
                              Icons.more_horiz,
                              color: ColorApp.bottomBar,
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  ),
                  SizedBox(
                    height: Const.size(context).width * 0.05,
                  ),
                  Text('${language.ganDay}',
                      style: StyleApp.textStyle700(
                          fontSize: 16, color: ColorApp.dark)),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Const.size(context).width * 0.025),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                child: SvgPicture.asset('assets/svg/notiIcon.svg')),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(width: Const.size(context).width*0.65,
                                  child: Text(
                                    'Thanh toán không thành côndsfsdjfiosdufiosdjsdiojfiosdfdsfsdfsdfhsduhfdjhg',

                                    style:
                                    StyleApp.textStyle600(color: ColorApp.dark),
                                  ),
                                ),
                                SizedBox(
                                  height: Const.size(context).width * 0.02,
                                ),
                                Text(
                                  '10:21 pm',
                                  style: StyleApp.textStyle400(
                                      color: Color(0xff717171)),
                                )
                              ],
                            ),
                            Icon(
                              Icons.more_horiz,
                              color: ColorApp.bottomBar,
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  ),
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
