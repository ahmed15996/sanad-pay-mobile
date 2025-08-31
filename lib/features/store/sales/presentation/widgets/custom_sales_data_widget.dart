import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/features/store/home/data/models/dashboard_model.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../generated/locale_keys.g.dart';

class CustomSalesDataWidget extends StatelessWidget {
  final DashboardModel dashboardModel;
  const CustomSalesDataWidget({super.key, required this.dashboardModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(11.w),
            margin: EdgeInsetsDirectional.only(start: 24.w),
            decoration: BoxDecoration(
              color: AppColors.lighterGreyColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                Text(
                  LocaleKeys.todayTotalSales.tr(),
                  style: AppTextStyles.textStyle12.copyWith(
                    color: AppColors.textColor,
                  ),
                ),
                heightSpace(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${dashboardModel.todaySales}",
                      style: AppTextStyles.textStyle14.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor
                      ),
                    ),
                    widthSpace(2),
                    SvgPicture.asset(AppAssets.sr,color:  AppColors.blackColor,),
                  ],
                ),
              ],
            ),
          ),
        ),
        widthSpace(16.w),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(11.w),
            margin: EdgeInsetsDirectional.only(end: 4.w),
            decoration: BoxDecoration(
              color: AppColors.lighterGreyColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                Text(
                  LocaleKeys.currentMonthTotalSales.tr(),
                  style: AppTextStyles.textStyle12.copyWith(
                    color: AppColors.textColor,
                  ),
                ),
                heightSpace(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${dashboardModel.monthSales}",
                      style: AppTextStyles.textStyle14.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor
                      ),
                    ),
                    widthSpace(2),
                    SvgPicture.asset(AppAssets.sr,color: AppColors.blackColor),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
