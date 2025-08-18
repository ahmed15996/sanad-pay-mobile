import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/constants/app_text_styles.dart';
import 'package:sanad/core/widgets/custom_text_form_field.dart';

import '../constants/app_colors.dart';
import '../constants/app_shadows.dart';

class CustomDropDownField<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final String? hintText;

  final void Function(T?) onChanged;
  final String? Function(T? value)? validator;
  final T? value;
  final Widget? prefixIcon;
  final AutovalidateMode? autoValidateMode;
  final Color? fillColor,borderColor;

  const CustomDropDownField(
      {super.key,
      required this.items,
      required this.onChanged,
      required this.value, this.hintText,
      this.validator,
      this.prefixIcon,
      this.autoValidateMode, this.fillColor, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          AppShadows.defaultShadow
        ]
      ),
      child: DropdownButtonFormField<T>(
        value: value,
        items: items,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          fillColor: fillColor,
          filled: true,
          enabledBorder: buildOutlineInputBorder(borderColor,),
          focusedBorder: buildOutlineInputBorder(AppColors.primaryColor,),
          errorBorder: buildOutlineInputBorder(AppColors.redColor),
          focusedErrorBorder: buildOutlineInputBorder(AppColors.redColor),
          errorStyle: AppTextStyles.textStyle12.copyWith(
            color: AppColors.redColor,
          ),
          hintStyle: AppTextStyles.textStyle14.copyWith(
              color: AppColors.hintColor
          ),
        ),
        hint: hintText != null ? Text(
          hintText!,
          style: AppTextStyles.textStyle14.copyWith(
        color: AppColors.hintColor
        ),
        ) : null,
        validator: validator,
        isDense: true,


        iconSize: 24.w,
        autovalidateMode: autoValidateMode  ?? AutovalidateMode.onUserInteraction,
        icon: Icon(Icons.keyboard_arrow_down),
        iconEnabledColor: AppColors.primaryColor,
        iconDisabledColor: AppColors.primaryColor,

        borderRadius: BorderRadius.circular(25.r),
        padding: EdgeInsets.zero,
        onChanged: onChanged,
      ),
    );
  }

}
