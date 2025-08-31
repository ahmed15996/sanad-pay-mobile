import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/util/extensions/media_query.dart';
import '../../generated/locale_keys.g.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../framework/spaces.dart';

class CustomLoading extends StatelessWidget {
  final bool? isButton;
  final Color? loadingColor;
  final double? heightLoading, widthLoading, strokeWidth;

  const CustomLoading(
      {super.key,
      this.isButton = false,
      this.heightLoading,
      this.loadingColor,
      this.widthLoading,
      this.strokeWidth});

  @override
  Widget build(BuildContext context) {
    return isButton == true
        ? SizedBox(
            height: (heightLoading ?? 20).h,
            width: (widthLoading ?? 20).w,
            child: CircularProgressIndicator(
              color: loadingColor ?? AppColors.whiteColor,
              strokeWidth: (strokeWidth ?? 4).w,
            ),
          )
        :  SizedBox(
      width: context.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppAssets.loading,
              width: context.width / 2.5,
              height: 100.h,
            ),
            heightSpace(10.h),
            Text(
              LocaleKeys.loading.tr(),
              style: AppTextStyles.textStyle16.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.blackColor
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
