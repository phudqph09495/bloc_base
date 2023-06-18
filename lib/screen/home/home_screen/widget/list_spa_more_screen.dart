import 'package:bloc_base/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/language/bloc_lang.dart';
import '../../../../bloc/language/event_bloc2.dart';
import '../../../../bloc/state_bloc.dart';
import '../../../../config/const.dart';
import '../../../../styles/init_style.dart';

class MoreSpaScreen extends StatelessWidget {
  const MoreSpaScreen({Key? key}) : super(key: key);

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLang, StateBloc>(
        builder: (context, StateBloc state) {
      if (state is LoadSuccess) {
        return Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            // ),
            GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 20),
                itemCount: 50,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext ctx, index) {
                  return const IntroduceSpaWidget();
                }),
            SizedBox(
              height: Const.size(context).width * 0.1,
            )
          ],
        );
      }
      return const SizedBox();
    });
  }
}

class IntroduceSpaWidget extends StatelessWidget {
  const IntroduceSpaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouterName.infoSpaScreen);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  'assets/images/mostRate.png',
                  width: Const.size(context).width * 0.45,
                  fit: BoxFit.cover,
                ),
                Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorApp.dark252525.withOpacity(0.75),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical:
                              Const.size(context).width * 0.0111111111111),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 15,
                              ),
                              Text(
                                '2.3 km',
                                style: StyleApp.textStyle600(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            Text(
              'Sorella Beauty',
              style: StyleApp.textStyle600(color: ColorApp.dark252525),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: ColorApp.yellow,
                    ),
                    Text(
                      '4.7',
                      style: StyleApp.textStyle700(color: ColorApp.yellow),
                    ),
                    Text(' (98)',
                        style: StyleApp.textStyle700(
                            color: const Color(0xff717171))),
                  ],
                ),
                const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
