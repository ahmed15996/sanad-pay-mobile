import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/routing/routes.dart';
import 'package:sanad/core/widgets/custom_button.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../core/framework/spaces.dart';
import '../../../../../../../generated/locale_keys.g.dart';

class CustomApplyForFinancingWidget extends StatelessWidget {
  final bool canApplyFinance;
  const CustomApplyForFinancingWidget({super.key, required this.canApplyFinance});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SvgPicture.asset(AppAssets.financing),
          Text(
            LocaleKeys.applyFinancingInformation.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyles.textStyle24.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.rhinoDark.shade600,
            ),
          ),
          heightSpace(30),
          CustomButton(
            text: LocaleKeys.applyForFinancing.tr(),
            isDisabled: !canApplyFinance,
            onPressed: () {
              if(canApplyFinance) {
                context.pushWithNamed(Routes.createFinancingView);
              }
            },
          ),
        ],
      ),
    );
  }
}
