import 'package:dalel/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool? value = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      side: WidgetStateBorderSide.resolveWith(
        (states) => BorderSide(width: 1.0, color: AppColors.deepGrey),
      ),
      activeColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      value: value,
      onChanged: (newValue) {
        setState(() {
          value = newValue;
        });
      },
    );
  }
}
