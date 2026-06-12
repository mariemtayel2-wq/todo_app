import 'package:evently_app/core/resources/color_manager/color_manger.dart';
import 'package:flutter/material.dart';

typedef Validation = void Function(String? value);
typedef Validator = String? Function(String? value);

class CustumTextFormFieled extends StatefulWidget {
  CustumTextFormFieled({
    this.obscureText = false,
    this.onchanged,
    this.controller,
    this.validator,
    super.key,
    this.borderside,
    this.suffixicon,
    this.maxline,
    this.fillcolor,
    this.filled,
    this.hintstyle,
    this.hinttext,
    this.labelstyle,
    this.labeltext,
    this.prefixicon,
  });

  Color? borderside;
  Color? fillcolor;
  bool? filled;
  String? hinttext;
  TextStyle? hintstyle;
  String? labeltext;
  TextStyle? labelstyle;
  Widget? prefixicon;
  Widget? suffixicon;
  int? maxline;
  Validation? onchanged;
  TextEditingController? controller;
  Validator? validator;
  bool obscureText;

  @override
  State<CustumTextFormFieled> createState() => _CustumTextFieledState();
}

class _CustumTextFieledState extends State<CustumTextFormFieled> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: AppColorLight.secondaryText),
      obscureText: widget.obscureText,
      validator: widget.validator,
      onChanged: widget.onchanged,
      controller: widget.controller,
      maxLines: widget.maxline ?? 1,
      decoration: InputDecoration(
        fillColor: widget.fillcolor,
        filled: widget.filled,
        enabledBorder: builtdecorationborder(
          bordercolor: widget.borderside ?? Colors.transparent,
        ),
        focusedBorder: builtdecorationborder(
          bordercolor: widget.borderside ?? Colors.transparent,
        ),
        errorBorder: builtdecorationborder(
          bordercolor:AppColorLight.error,
        ),
        hintText: widget.hinttext,
        hintStyle: widget.hintstyle,
        labelText: widget.labeltext,
        labelStyle: widget.labelstyle,
        prefixIcon: widget.prefixicon,
        suffixIcon: widget.suffixicon,
      ),
    );
  }

  OutlineInputBorder builtdecorationborder({required Color bordercolor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        width: 2,
        color: widget.borderside ?? Colors.transparent,
      ),
    );
  }
}
