import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../generated/locale_keys.g.dart';

class CustomLoginHeaderWidget extends StatelessWidget {
  const CustomLoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 7.w),
      child: Text(
        LocaleKeys.enterMobileNumber.tr(),
        style: AppTextStyles.textStyle16.copyWith(
          color: AppColors.darkSecondaryColor
        ),
      ),
    );
  }
}
