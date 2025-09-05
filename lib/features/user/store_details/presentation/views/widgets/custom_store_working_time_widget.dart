import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/core/constants/app_colors.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../generated/locale_keys.g.dart';

class CustomStoreWorkingTimeWidget extends StatelessWidget {
  final String workingTime;
  const CustomStoreWorkingTimeWidget({super.key, required this.workingTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(AppAssets.clock),
          widthSpace(12.w),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LocaleKeys.workingTime.tr(),style: AppTextStyles.textStyle14.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor
              ),),
              heightSpace(4),
              Text(workingTime,style: AppTextStyles.textStyle12.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.hintColor
              ),),

            ],
          )),
        ],
      ),
    );
  }
}
