import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/const.dart';
import '../../../styles/init_style.dart';

class InputText2 extends StatefulWidget {
  IconData? iconData;
  IconData? suffix;
  bool obscureText;
  bool hasPass;
  bool hasLeading;
  String label;
  Function(String)? onChanged;
  Function(String)? validator;
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
  Widget? widgetLabel;
  List<TextInputFormatter>? inputformater;

  InputText2({
    super.key,
    this.obscureText = false,
    required this.label,
    this.keyboardType,
    this.controller,
    this.onChanged,
    this.iconData,
    this.suffix,
    this.hasPass = false,
    this.hasLeading = false,
    this.validator,
    this.radius = 20,
    this.width = double.infinity,
    this.borderColor = ColorApp.bottomBarABCA74,
    this.colorBg = ColorApp.backgroundF9F9F4,
    this.colorLabel = 0.5,
    this.height = 50,
    this.readOnly = false,
    this.inputformater,
    this.widgetLabel,
    this.search,
    this.onTap,
  });

  @override
  State<InputText2> createState() => _InputText2State();
}

class _InputText2State extends State<InputText2> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Const.sizeHeight(context, 100),
      child: TextFormField(
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
            borderSide: BorderSide(color: Colors.black.withOpacity(0.2), width: 0.7),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide:
                BorderSide(color: Colors.black.withOpacity(0.2), width: 0.7),
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
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
          prefixIcon: widget.hasLeading
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Icon(widget.iconData,
                      color: ColorApp.black.withOpacity(0.5)),
                )
              : null,
          hintText: widget.label,
          hintStyle: StyleApp.textStyle400(
              fontSize: 16, color: Colors.black.withOpacity(widget.colorLabel)),
          suffixIcon: widget.hasPass
              ? InkWell(
                  onTap: () {
                    widget.obscureText = !widget.obscureText;
                    setState(() {});
                  },
                  child: Icon(
                      !widget.obscureText
                          ? CupertinoIcons.eye
                          : CupertinoIcons.eye_slash,
                      color: ColorApp.black.withOpacity(0.5)),
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
