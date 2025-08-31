
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../generated/locale_keys.g.dart';

class CustomCreateAccHeaderWidget extends StatelessWidget {
  const CustomCreateAccHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.enterThisInformationToCreateAccount.tr(),
      style: AppTextStyles.textStyle16.copyWith(color: AppColors.rhinoDark.shade400),
    );
  }
}
