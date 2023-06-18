import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  Color? borderColor;
  Function()? search;
  bool readOnly;
  double colorLabel;
  String? initVal;
  Color suffixColor;
  int maxLine;
  Widget? widgetLabel;
  Function()? onComplete;
  List<TextInputFormatter>? inputformater;

  InputText1({
    super.key,
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
    this.radius = 20,
    this.width = double.infinity,
    this.borderColor,
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
    return TextFormField(
      maxLines: widget.maxLine,
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
          // borderSide:
          // const BorderSide(color: ColorApp.black, width: 1),
          borderSide: BorderSide(
              color: widget.borderColor ?? widget.colorBg, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide:
              BorderSide(color: Colors.black.withOpacity(0.2), width: 0.5),
          // borderSide:
          // const BorderSide(color: ColorApp.black, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: const BorderSide(color: Colors.red, width: 0.5),
          // borderSide:
          // const BorderSide(color: ColorApp.black, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: const BorderSide(color: Colors.red, width: 0.5),
          // borderSide:
          // const BorderSide(color: ColorApp.black, width: 1),
        ),
        label: widget.widgetLabel,
        filled: true,
        fillColor: widget.colorBg,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        prefixIcon: widget.hasLeading ? widget.iconPreFix : null,
        hintText: widget.label,
        hintStyle: StyleApp.textStyle400(
            fontSize: widget.labelSize,
            color: ColorApp.dark500.withOpacity(0.7)),
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
    );
  }
}
