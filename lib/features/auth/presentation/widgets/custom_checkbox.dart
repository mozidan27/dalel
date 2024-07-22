import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          BlocProvider.of<AuthCubit>(context)
              .updateTermsAndConditionCheckBox(newValue: newValue);
        });
      },
    );
  }
}
