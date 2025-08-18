import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_text_form_field.dart';
import 'app_colors.dart';
import 'app_constants.dart';
import 'app_text_styles.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,

    scaffoldBackgroundColor: AppColors.primaryColor,
    cardColor: AppColors.whiteColor,
    fontFamily: AppConstants.fontFamily,

    bottomSheetTheme: BottomSheetThemeData(
      modalBackgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
    ),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(AppColors.secondaryColor),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.transparentColor;
        } else if (states.contains(WidgetState.selected)) {
          return AppColors.primaryColor;
        } else if (states.contains(WidgetState.pressed)) {
          return AppColors.primaryColor;
        } else {
          return AppColors.transparentColor;
        }
      }),
      checkColor: WidgetStateProperty.all(AppColors.blackColor),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      side: BorderSide(width: 1.w, color: AppColors.blackColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(AppColors.blackColor),
      trackOutlineColor: WidgetStateProperty.all(AppColors.blackColor),
      trackOutlineWidth: WidgetStateProperty.all(1.w),
    ),
    appBarTheme: AppBarTheme(color: AppColors.transparentColor, elevation: 0),
    hintColor: AppColors.hintColor,
    dividerTheme: DividerThemeData(
      color: AppColors.hintColor,
      thickness: 0.5.w,
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      hintStyle: AppTextStyles.textStyle12.copyWith(
        fontWeight: FontWeight.w500,
        color: AppColors.hintColor,
      ),
      focusedBorder: buildOutlineInputBorder(),
      enabledBorder: buildOutlineInputBorder(),
      errorBorder: buildOutlineInputBorder(AppColors.redColor),
      focusedErrorBorder: buildOutlineInputBorder(AppColors.redColor),
      errorStyle: AppTextStyles.textStyle12.copyWith(color: AppColors.redColor),
      contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
    ),
  );
}
