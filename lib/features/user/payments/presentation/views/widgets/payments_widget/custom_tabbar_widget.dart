import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../../cubits/payments_cubit/payments_cubit.dart';

class CustomTabBarWidget extends StatelessWidget {
  const CustomTabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PaymentsCubit>();
    return Container(
      padding: EdgeInsets.all(6.w),
      decoration: BoxDecoration(
        color: AppColors.rhinoDark.shade50,
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: TabBar(
        labelStyle: AppTextStyles.textStyle14.copyWith(
          fontWeight: FontWeight.w500,
        ),
        onTap: (value) {
          if(value == 0) {
            cubit.fetchUpcomingPayments();
          }else{
            cubit.fetchPreviousPayments();
          }
        },
        labelColor: AppColors.rhinoDark.shade600,
        unselectedLabelColor: AppColors.rhinoDark.shade600,
        unselectedLabelStyle: AppTextStyles.textStyle14.copyWith(
          fontWeight: FontWeight.w400,
        ),
        dividerHeight: 0,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26.r),
            ),
            color: AppColors.whiteColor
        ),

        tabs: [
          Tab(text: LocaleKeys.upcomingPayment.tr()),
          Tab(text: LocaleKeys.previousPayment.tr()),
        ],
      ),
    );
  }
}
