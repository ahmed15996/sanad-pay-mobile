
import 'package:flutter/material.dart';

import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_text_styles.dart';


class CustomCreateFinancingHeaderWidget extends StatelessWidget {
  const CustomCreateFinancingHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Please fill in the information below to review your financing request.",
      style: AppTextStyles.textStyle16.copyWith(color: AppColors.darkSecondaryColor),
    );
  }
}
