
import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';

class CustomCreateAccHeaderWidget extends StatelessWidget {
  const CustomCreateAccHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Enter the following details to create your account.",
      style: AppTextStyles.textStyle16.copyWith(color: AppColors.darkSecondaryColor),
    );
  }
}
