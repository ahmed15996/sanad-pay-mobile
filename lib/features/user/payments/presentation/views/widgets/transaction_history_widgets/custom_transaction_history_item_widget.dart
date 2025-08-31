import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/features/user/payments/data/models/transaction_model.dart';

import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../core/framework/spaces.dart';
import '../../../../../../../core/widgets/custom_image_network.dart';
import '../../../../../../../generated/locale_keys.g.dart';

class CustomTransactionHistoryItemWidget extends StatelessWidget {
  final TransactionModel transactionModel;
  const CustomTransactionHistoryItemWidget({super.key, required this.transactionModel});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        CustomImageNetwork(image: transactionModel.store.logo,widthImage: 32,heightImage: 32,radiusValue: 25,),
        widthSpace(12.w),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(transactionModel.store.name,style: AppTextStyles.textStyle14.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.rhinoDark.shade500
            ),),
            heightSpace(4),
            Text("${transactionModel.amount} ${LocaleKeys.sar.tr()}",style: AppTextStyles.textStyle16.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.secondaryColor
            ),),

          ],)),
        Text(transactionModel.date,style: AppTextStyles.textStyle10.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.textColor
        ),),
      ],
    );
  }
}
