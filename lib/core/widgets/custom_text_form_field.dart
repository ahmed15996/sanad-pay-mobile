import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_shadows.dart';
import '../constants/app_text_styles.dart';
import '../framework/spaces.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? ctrl;
  final String? hintText, labelText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly, autoFocus;
  final int? maxLines, maxLength;
  final double? borderRadiusValue;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor, borderColor, textStyleColor;

  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;

  final AutovalidateMode? autoValidateMode;
  final TextStyle? hintTextStyle;
  final TextInputAction? textInputAction;

  const CustomTextFormField({
    super.key,
    this.ctrl,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly = false,
    this.maxLines = 1,
    this.autoValidateMode,
    this.onChanged,
    this.onTap,
    this.textInputAction,
    this.borderRadiusValue,
    this.onSubmitted,
    this.maxLength,
    this.contentPadding,
    this.fillColor,
    this.borderColor,
    this.hintTextStyle,
    this.textStyleColor,
    this.autoFocus,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: AppTextStyles.textStyle16.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          heightSpace(12),
        ],

        Container(
          decoration: BoxDecoration(
            boxShadow: [
              AppShadows.defaultShadow
            ]
          ),
          child: TextFormField(
            keyboardType: keyboardType,
            controller: ctrl,
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onFieldSubmitted: onSubmitted,
            textInputAction: textInputAction,
            onTap: onTap,

            scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            style: AppTextStyles.textStyle12.copyWith(color: textStyleColor ?? AppColors.darkSecondaryColor),
            inputFormatters: inputFormatters,
            readOnly: readOnly!,
            validator: validator,
            maxLines: maxLines,
            maxLength: maxLength,
            autofocus: autoFocus ?? false,
            autovalidateMode:
                autoValidateMode ?? AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              filled: true,
              fillColor: fillColor,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintText: hintText,
              isDense: true,
              hintStyle: hintTextStyle ?? AppTextStyles.textStyle10.copyWith(
                color: AppColors.hintColor
              ),
              enabledBorder: buildOutlineInputBorder(borderColor,borderRadiusValue),
              focusedBorder: buildOutlineInputBorder(AppColors.primaryColor,borderRadiusValue),
              errorBorder: buildOutlineInputBorder(AppColors.redColor,borderRadiusValue),
              focusedErrorBorder: buildOutlineInputBorder(AppColors.redColor,borderRadiusValue),
              errorStyle: AppTextStyles.textStyle12.copyWith(
                color: AppColors.redColor,
                height: 1.2
              ),

              contentPadding:
                  contentPadding ??
                  EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            ),

            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

OutlineInputBorder buildOutlineInputBorder([
  Color? color,
  double? borderRadiusValue,
]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadiusValue ?? 30.r),
    borderSide: color != null ? BorderSide(color: color) : BorderSide.none,
  );
}
