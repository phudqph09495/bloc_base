import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/bloc/state_bloc.dart';

import 'package:bloc_base/widget/item/input/bottom_sheet.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../bloc/language/bloc_lang.dart';
import '../../../config/const.dart';
import '../../../model/model_local.dart';
import '../../../styles/init_style.dart';
import '../../../widget/item/appbar.dart';
import '../../../widget/item/button.dart';
import '../../../widget/item/input/text_filed.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void dispose() {
    genderController.dispose();
    dOBController.dispose();
    super.dispose();
  }

  TextEditingController genderController = TextEditingController();
  TextEditingController dOBController = TextEditingController();
  int selectedIndex = 0;
  List<ModelLocal2> listGender = [
    ModelLocal2(name: 'Nam'),
    ModelLocal2(name: 'Nữ')
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocLanguage, StateBloc>(builder: (_, StateBloc state) {
      if (state is LoadSuccess) {
        Language language = state.data;
        return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              backgroundColor: ColorApp.darkGreen,
              appBar: AppBarWidget(title: language.ttTK),
              body: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: ColorApp.whiteF0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            language.ttCN,
                            style: StyleApp.textStyle700(
                                color: ColorApp.dark252525, fontSize: 16),
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.04179487179,
                          ),
                          Text(
                            language.hoTen,
                            style: StyleApp.textStyle700(
                                color: ColorApp.dark252525),
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.02179487179,
                          ),
                          InputText1(
                            label: 'Nguyễn Quang Vinh',
                            radius: 10,
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.04179487179,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      language.ngaySinh,
                                      style: StyleApp.textStyle700(
                                          color: ColorApp.dark252525),
                                    ),
                                    SizedBox(
                                      height: Const.size(context).width *
                                          0.02179487179,
                                    ),
                                    InputText1(
                                      suffix: Transform.scale(
                                          scale: 0.5,
                                          child: SvgPicture.asset(
                                              'assets/svg/notiIcon.svg')),
                                      controller: dOBController,
                                      onTap: () {
                                        DatePicker.showDatePicker(
                                          context,
                                          locale: DateTimePickerLocale.vi,
                                          dateFormat: 'dd MMMM yyyy',
                                          initialDateTime: DateTime.now(),
                                          minDateTime: DateTime(2000),
                                          maxDateTime: DateTime(2050),
                                          onConfirm:
                                              (dateTime, List<int> index) {
                                            dOBController.text =
                                                Const.formatTime(
                                                    dateTime
                                                        .millisecondsSinceEpoch,
                                                    format: 'dd/MM/yyyy');
                                          },
                                        );
                                      },
                                      label:
                                          '${Const.formatTime(DateTime.now().millisecondsSinceEpoch, format: 'dd/MM/yyyy')}',
                                      radius: 10,
                                      readOnly: true,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      language.gioiTinh,
                                      style: StyleApp.textStyle700(
                                          color: ColorApp.dark252525),
                                    ),
                                    SizedBox(
                                      height: Const.size(context).width *
                                          0.02179487179,
                                    ),
                                    InputText1(
                                      onTap: () {
                                        BottomSheetInforService
                                            .selecteRadioBottomSheet(
                                                context,
                                                language.gioiTinh,
                                                listGender,
                                                selectedIndex,
                                                genderController,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.3);
                                      },
                                      controller: genderController,
                                      label: language.nam,
                                      radius: 10,
                                      hasSuffix: true,
                                      suffix: const Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: ColorApp.dark500,
                                      ),
                                      readOnly: true,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.04179487179,
                          ),
                          Text(
                            language.soDienThoai,
                            style: StyleApp.textStyle700(
                                color: ColorApp.dark252525),
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.02179487179,
                          ),
                          InputText1(
                            keyboardType: TextInputType.phone,
                            label: '0974859632',
                            radius: 10,
                          ),
                          SizedBox(
                            height: Const.size(context).width * 0.02179487179,
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1.2,
                    ),
                    const Expanded(child: SizedBox()),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 5),
                      child: ButtonWidget(
                        type: ButtonType.secondary,
                        text: language.luuThayDoi.toUpperCase(),
                        onTap: () {},
                      ),
                    )
                  ],
                ),
              ),
            ));
      }
      return const Scaffold();
    });
  }
}
