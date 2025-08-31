import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/util/extensions/navigation.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../generated/locale_keys.g.dart';


class CustomFinishAccStoreDialog extends StatelessWidget {
  const CustomFinishAccStoreDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(
          horizontal: 30.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.requestSuccess.tr(),
                style: AppTextStyles.textStyle16.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              heightSpace(10.h),
              Text(
                LocaleKeys.requestPendingManagement.tr(),
                style: AppTextStyles.textStyle14.copyWith(
                  color: AppColors.textColor,
                ),
                textAlign: TextAlign.center,
              ),
              heightSpace(25.h),
              CustomButton(
                onPressed: () {
                  context.pop();
                  context.pop();
                },
                text: LocaleKeys.done.tr(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
