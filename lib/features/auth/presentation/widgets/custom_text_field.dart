import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget(
      {super.key,
      required this.text,
      this.onChanged,
      this.onFieldSubmitted,
      this.suffixIcon,
      required this.obscureText});
  final String text;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Widget? suffixIcon;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, right: 8, left: 8),
      child: TextFormField(
        obscureText: obscureText,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Field is required, please enter some text';
          } else {
            return null;
          }
        },
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          labelText: text,
          labelStyle: CustomTextStyles.poppins500style18,
          border: getBorderStyle(),
          focusedBorder: getBorderStyle(),
          enabledBorder: getBorderStyle(),
        ),
      ),
    );
  }
}

OutlineInputBorder getBorderStyle() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: AppColors.grey));
}
