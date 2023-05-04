import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../styles/init_style.dart';

class ItemDrawer extends StatefulWidget {
  @override
  State<ItemDrawer> createState() => _ItemDrawerState();
}

class _ItemDrawerState extends State<ItemDrawer> {


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
              Center(
                  child: Image.asset(
                'assets/images/logoNoBG.png',
                width: MediaQuery.of(context).size.width * 0.4,
              )),
              buildRow(
                title: 'MẸ VÀ BÉ',
                onTap: () {

                },
              ),
              Divider(),
              buildRow(
                title: 'SỨC KHOẺ & SẮC ĐẸP',
                onTap: () {

                },
              ),
              Divider(),

              buildRow(
                title: 'NHÀ CỬA & ĐỜI SỐNG',
                onTap: () {

                },
              ),
              Divider(),

              buildRow(
                title: 'BÁCH HOÁ ONLINE',
                onTap: () {

                },
              ),
              Divider(),

              buildRow(
                title: 'THỜI TRANG',
                onTap: () {

                },
              ),
              Divider(),
              buildRow(
                title: 'ĐIỆN MÁY',
                onTap: () {

                },
              ),
              Divider(),
              buildRow(
                title: 'NHÀ THÔNG MINH',
                onTap: () {

                },
              ),
              Divider(),
              buildRow(
                title: 'SẢN PHẨM HÀN QUỐC (KOREA)',
                onTap: () {

                },
              ),
              Divider(),
              buildRow(
                title: 'SẢN PHẨM ÚC (AUSTRALIA)',
                onTap: () {

                },
              ),
              Divider(),
              buildRow(
                title: 'SẢN PHẨM ĐỨC (GERMANY)',
                onTap: () {

                },
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
