import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/const.dart';
import '../../../styles/init_style.dart';

class InputText1 extends StatefulWidget {
  IconData? iconData;
  Widget? suffix;
  bool obscureText;
  bool hasSuffix;
  bool hasLeading;
  String label;
  double labelSize;
  Function(String)? onChanged;
  Function(String)? validator;
  Widget? iconPreFix;
  Function()? onTap;
  TextEditingController? controller;
  TextInputType? keyboardType;
  double width;
  double radius;
  Color colorBg;
  double height;
  Color borderColor;
  Function()? search;
  bool readOnly;
  double colorLabel;
  String? initVal;
  Color suffixColor;
  int maxLine;
  Widget? widgetLabel;
  Function()? onComplete;
  List<TextInputFormatter>? inputformater;
  double borderSize ;
  Color laberColor;


  InputText1({
    super.key,
    this.laberColor = ColorApp.dark500,
    this.borderSize = 0.001,
    this.obscureText = false,
    required this.label,
    this.keyboardType,
    this.controller,
    this.onChanged,
    this.iconData,
    this.suffix,
    this.suffixColor = Colors.black12,
    this.hasSuffix = false,
    this.hasLeading = false,
    this.validator,
    this.iconPreFix,
    this.radius = 22,
    this.width = double.infinity,
    this.borderColor = Colors.black,
    this.colorBg = ColorApp.backgroundF9F9F4,
    this.colorLabel = 0.5,
    this.height = 50,
    this.initVal,
    this.maxLine = 1,
    this.readOnly = false,
    this.inputformater,
    this.onComplete,
    this.search,
    this.widgetLabel,
    this.onTap,
    this.labelSize = 16,
  });

  @override
  State<InputText1> createState() => _InputText1State();
}

class _InputText1State extends State<InputText1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        maxLines: null,
        initialValue: widget.initVal,
        onEditingComplete: widget.onComplete,
        inputFormatters: widget.inputformater,
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        textAlign: TextAlign.left,
        style: StyleApp.textStyle400(),
        decoration: InputDecoration(
          errorStyle: StyleApp.textStyle500(color: Colors.red, fontSize: 14),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide(
                color: Colors.black.withOpacity(0.2), width: widget.borderSize),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide:
                BorderSide(color: Colors.black.withOpacity(0.2), width: widget.borderSize),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: const BorderSide(color: Colors.red, width: 0.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: const BorderSide(color: Colors.red, width: 0.5),
          ),
          label: widget.widgetLabel,
          labelStyle: TextStyle(color: widget.laberColor),
          filled: true,
          fillColor: widget.colorBg,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
          prefixIcon: widget.hasLeading ? widget.iconPreFix : null,
          hintText: widget.label,
          hintStyle: StyleApp.textStyle400(
              fontSize: widget.labelSize,
              color: widget.laberColor),
          suffixIcon: widget.hasSuffix
              ? InkWell(
                  onTap: widget.search,
                  child: widget.suffix,
                )
              : null,
          errorText: null,
        ),
        validator: (val) {
          if (val != null && widget.validator != null) {
            return widget.validator!(val);
          }
          return null;
        },
      ),
    );
  }
}
