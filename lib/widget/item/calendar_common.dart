import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/const.dart';
import 'input/text_filed.dart';

Widget Calendar (BuildContext context , Controller ){
  return InputText1(
    suffix: Transform.scale(
        scale: 0.5,
        child: SvgPicture.asset(
            'assets/svg/notiIcon.svg')),
    controller: Controller,
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
          Controller.text =
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
  );
}