import 'package:flutter/material.dart';

import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_text_styles.dart';

class CustomPaymentRequestRowDataWidget extends StatelessWidget {
  final String title,subtitle;
  const CustomPaymentRequestRowDataWidget({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return  Row(

      children: [
        Expanded(child: Text(title,style: AppTextStyles.textStyle14.copyWith(color: AppColors.rhinoDark.shade300),)),
        Text(subtitle,style: AppTextStyles.textStyle14.copyWith(color: AppColors.rhinoDark.shade500,fontWeight: FontWeight.w500),),
      ],
    );
  }
}
