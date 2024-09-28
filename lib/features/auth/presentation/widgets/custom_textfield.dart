import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final int? maxLines;
  final TextEditingController? controller;
  final String? initialValue;
  final String? textError;
  final void Function(String)? onChanged;
  const CustomTextfield(
      {super.key,
      this.initialValue,
      required this.hintText,
      this.maxLines,
      this.onChanged,
      this.controller,
      this.textError});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        maxLines: maxLines,
        initialValue: initialValue,
        onChanged: onChanged,
        decoration: InputDecoration(       
                errorText: textError,
                hintText: hintText,
                hintStyle:
                    TextStyle(fontWeight: FontWeight.w400, fontSize: 18.sp))
            .applyDefaults(
          Theme.of(context).inputDecorationTheme,
        ));
  }
}
