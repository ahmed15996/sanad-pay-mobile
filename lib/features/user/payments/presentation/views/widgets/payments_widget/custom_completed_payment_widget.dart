import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../core/framework/spaces.dart';
import '../../../../../../../generated/locale_keys.g.dart';

class CustomCompletedPaymentWidget extends StatelessWidget {
  const CustomCompletedPaymentWidget({super.key,});

  @override
  Widget build(BuildContext context) {
     return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppAssets.success),
        heightSpace(26),
        Text(LocaleKeys.paymentCompleted.tr(),
          textAlign: TextAlign.center,
          style: AppTextStyles.textStyle28.copyWith(
            fontWeight: FontWeight.w600,
              color: AppColors.blackColor
          ),),
        heightSpace(20),
        Text(LocaleKeys.noOutstandingPayments.tr(),
          textAlign: TextAlign.center,
          style: AppTextStyles.textStyle14.copyWith(

            color: AppColors.blackColor
        ),),
      ],
    );
  }
}
