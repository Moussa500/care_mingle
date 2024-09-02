import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final int? maxLines;
  final TextEditingController? controller;
  const CustomTextfield(
      {super.key, required this.hintText, this.maxLines, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
                hintText: hintText,
                hintStyle:
                    TextStyle(fontWeight: FontWeight.w400, fontSize: 18.sp))
            .applyDefaults(
          Theme.of(context).inputDecorationTheme,
        ));
  }
}
