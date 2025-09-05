import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/features/user/payments/data/models/payment_model.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../core/framework/spaces.dart';
import '../../../../../../../generated/locale_keys.g.dart';

class CustomPreviousPaymentsItemWidget extends StatelessWidget {
  final PaymentModel paymentModel;
  const CustomPreviousPaymentsItemWidget({super.key, required this.paymentModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppAssets.previousPayment,height: 70.r,),
        widthSpace(12.w),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text("${LocaleKeys.paymentDate.tr()} (${paymentModel.date})",
              style: AppTextStyles.textStyle14.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkSecondaryColor
              ),),
            heightSpace(4),
            Text(paymentModel.amount, style: AppTextStyles.textStyle16.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.secondaryColor
            ),),

          ],)),
      ],
    );
  }
}
