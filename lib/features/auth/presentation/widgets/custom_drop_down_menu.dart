import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropDownMenu<T> extends StatefulWidget {
  T? value;
  final String? hintText;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged; // Add this line

  CustomDropDownMenu({
    super.key,
    this.value,
    required this.items,
    this.hintText,
    this.onChanged, // Add this line
  });

  @override
  State<CustomDropDownMenu<T>> createState() => _CustomDropDownMenuState<T>();
}

class _CustomDropDownMenuState<T> extends State<CustomDropDownMenu<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      hint: Text(
        widget.hintText ?? '',
        style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 18),
      ),
      value: widget.value,
      items: widget.items,
      onChanged: (T? newValue) {
        setState(() {
          widget.value = newValue;
          if (widget.onChanged != null) {
            widget.onChanged!(newValue); // Call the onChanged callback
          }
        });
      },
      decoration: InputDecoration().applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }
}
