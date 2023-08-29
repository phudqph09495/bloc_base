import 'package:bloc_base/styles/app_values.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTextStyles{
 static TextStyle textDark20() => getTextStyle(fontSize: AppSize.s20, color: ColorApp.dark252525);
 static TextStyle textDark18() => getTextStyle(fontSize: AppSize.s18, color: ColorApp.dark252525);
 static TextStyle textDark16() => getTextStyle(fontSize: AppSize.s16, color: ColorApp.dark252525);
 static TextStyle textDark14() => getTextStyle(fontSize: AppSize.s14, color: ColorApp.dark252525);
 static TextStyle textDark14Medium() => getTextStyle(fontSize: AppSize.s14, color: ColorApp.dark252525, fontWeight: FontWeight.w400);
 static TextStyle textDarkGreen20() => getTextStyle(fontSize: AppSize.s20, color: ColorApp.darkGreen);
 static TextStyle textDarkGreen18() => getTextStyle(fontSize: AppSize.s18, color: ColorApp.darkGreen);
 static TextStyle textDarkGreen16() => getTextStyle(fontSize: AppSize.s16, color: ColorApp.darkGreen);
 static TextStyle textDarkGreen14() => getTextStyle(fontSize: AppSize.s14, color: ColorApp.darkGreen);
 static TextStyle textDarkGreen14Medium() => getTextStyle(fontSize: AppSize.s14, color: ColorApp.darkGreen,fontWeight: FontWeight.w400);
 static TextStyle text16() => getTextStyle(fontSize: AppSize.s16, color: ColorApp.text);
 static TextStyle text14() => getTextStyle(fontSize: AppSize.s14, color: ColorApp.text);
 static TextStyle text16Medium() => getTextStyle(fontSize: AppSize.s16, color: ColorApp.text, fontWeight: FontWeight.w400);
 static TextStyle text14Medium() => getTextStyle(fontSize: AppSize.s14, color: ColorApp.text, fontWeight: FontWeight.w400);
 static TextStyle textGreen14() => getTextStyle(fontSize: AppSize.s14, color: ColorApp.green);
 static TextStyle textGreen14Medium() => getTextStyle(fontSize: AppSize.s14, color: ColorApp.green, fontWeight: FontWeight.w400);
 static TextStyle textGreen12() => getTextStyle(fontSize: AppSize.s12, color: ColorApp.green);
 static TextStyle textWhite16() => getTextStyle(fontSize: AppSize.s16, color: ColorApp.background);
 static TextStyle textWhite14() => getTextStyle(fontSize: AppSize.s14, color: ColorApp.background);
}



TextStyle getTextStyle({
  required double fontSize,
  FontWeight fontWeight = FontWeight.w700,
  required Color color,
}) {
  return GoogleFonts.lato(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
