import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/core/constants/app_assets.dart';
import 'package:sanad/generated/locale_keys.g.dart';
import '../constants/app_colors.dart';
import '../constants/app_shadows.dart';
import '../constants/app_text_styles.dart';

class CustomDropDownField<T> extends StatelessWidget {
  final List<T> items;
  final String? hintText;

  final void Function(T?) onChanged;
  final String? Function(T? value)? validator;
  final T? value;
  final Widget? prefixIcon;
  final AutovalidateMode? autoValidateMode;
  final Color? fillColor, borderColor;

  const CustomDropDownField({
    super.key,
    required this.items,
    required this.onChanged,
    required this.value,
    this.hintText,
    this.validator,
    this.prefixIcon,
    this.autoValidateMode,
    this.fillColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          isDense: true,
        ),
      ),
      child: CustomDropdown<T>.search(
        hintText: hintText,
        items: items,
        excludeSelected: false,
        validator: validator,
        searchHintText: LocaleKeys.search.tr(),
        hintBuilder: (context, hint, enabled) {
          return Text(
            hint,
            style: AppTextStyles.textStyle10.copyWith(
              color: AppColors.hintColor,
            ),
          );
        },
        headerBuilder: (context, selectedItem, enabled) {
          return Text(
            selectedItem.toString(),
            style: AppTextStyles.textStyle14.copyWith(
              color: AppColors.blackColor,
            ),
          );
        },
        noResultFoundBuilder: (context, text) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: AppTextStyles.textStyle12.copyWith(
                  color: AppColors.darkSecondaryColor,
                ),
              ),
            ),
          );
        },
        decoration: CustomDropdownDecoration(
          hintStyle: AppTextStyles.textStyle14.copyWith(
            color: AppColors.hintColor,
          ),
          prefixIcon: prefixIcon,
          closedSuffixIcon: SvgPicture.asset(
            AppAssets.arrowDown,
            color: AppColors.primaryColor,
            fit: BoxFit.scaleDown,
            width: 26.w,
            height: 26.h,
          ),

          errorStyle: AppTextStyles.textStyle12.copyWith(
            color: AppColors.redColor,
          ),
          expandedFillColor: fillColor,
          closedFillColor: fillColor,
          closedBorderRadius: BorderRadius.circular(30),
          expandedBorderRadius: BorderRadius.circular(30),
          closedErrorBorderRadius: BorderRadius.circular(30),
          closedErrorBorder: Border.all(color: AppColors.redColor),
          expandedShadow: [AppShadows.defaultShadow],
          closedShadow: [AppShadows.defaultShadow],
        ),
        onChanged: onChanged,
        noResultFoundText: LocaleKeys.emptyData.tr(),
      ),
    );
  }
}
