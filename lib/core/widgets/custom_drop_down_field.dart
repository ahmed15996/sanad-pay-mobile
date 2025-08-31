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
  final Widget Function(BuildContext, T, bool, void Function()) listItemBuilder;
  final Widget Function(BuildContext, T, bool) headerBuilder;

  const CustomDropDownField({
    super.key,
    required this.items,
    required this.onChanged,
    required this.value,
    required this.listItemBuilder,
    required this.headerBuilder,
    this.hintText,
    this.validator,
    this.prefixIcon,
    this.autoValidateMode,
    this.fillColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [AppShadows.defaultShadow]),
      child: CustomDropdown<T>.search(
        hintText: hintText,
        items: items,
        excludeSelected: false,
        validator: validator,
        listItemBuilder: listItemBuilder,
        headerBuilder: headerBuilder,
        searchHintText: LocaleKeys.search.tr(),
        noResultFoundBuilder: (context, text) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Text(text,
                textAlign: TextAlign.center,
                style: AppTextStyles.textStyle14.copyWith(
                color: AppColors.blackColor
              ),),
            ),
          );
        },
        decoration: CustomDropdownDecoration(
          hintStyle: AppTextStyles.textStyle14.copyWith(
            color: AppColors.hintColor,
          ),
          prefixIcon: prefixIcon,
          closedSuffixIcon: SvgPicture.asset(AppAssets.arrowDown,color: AppColors.primaryColor,fit: BoxFit.scaleDown,),
          errorStyle: AppTextStyles.textStyle12.copyWith(
            color: AppColors.redColor,
          ),
          expandedFillColor: fillColor,
          closedFillColor: fillColor,
          closedBorderRadius: BorderRadius.circular(30),
          expandedBorderRadius: BorderRadius.circular(30),
          closedErrorBorderRadius: BorderRadius.circular(30),


        ),
        onChanged: onChanged,
        noResultFoundText: LocaleKeys.emptyData.tr(),
      ),
      // child: DropdownButtonFormField<T>(
      //   value: value,
      //   items: items,
      //   decoration: InputDecoration(
      //     prefixIcon: prefixIcon,
      //     fillColor: fillColor,
      //     filled: true,
      //     enabledBorder: buildOutlineInputBorder(borderColor,),
      //     focusedBorder: buildOutlineInputBorder(AppColors.primaryColor,),
      //     errorBorder: buildOutlineInputBorder(AppColors.redColor),
      //     focusedErrorBorder: buildOutlineInputBorder(AppColors.redColor),
      //     errorStyle: AppTextStyles.textStyle12.copyWith(
      //       color: AppColors.redColor,
      //     ),
      //     hintStyle: AppTextStyles.textStyle14.copyWith(
      //         color: AppColors.hintColor
      //     ),
      //   ),
      //   hint: hintText != null ? Text(
      //     hintText!,
      //     style: AppTextStyles.textStyle14.copyWith(
      //   color: AppColors.hintColor
      //   ),
      //   ) : null,
      //   validator: validator,
      //   isDense: true,
      //
      //
      //   iconSize: 24.w,
      //   autovalidateMode: autoValidateMode  ?? AutovalidateMode.onUserInteraction,
      //   icon: Icon(Icons.keyboard_arrow_down),
      //   iconEnabledColor: AppColors.primaryColor,
      //   iconDisabledColor: AppColors.primaryColor,
      //
      //   borderRadius: BorderRadius.circular(25.r),
      //   padding: EdgeInsets.zero,
      //   onChanged: onChanged,
      // ),
    );
  }
}
