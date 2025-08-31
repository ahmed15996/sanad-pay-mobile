
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/constants/app_assets.dart';

import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../core/framework/spaces.dart';
import '../../../../../../../generated/locale_keys.g.dart';


class CustomCreateFinancingHeaderWidget extends StatelessWidget {
  const CustomCreateFinancingHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.financingRequestInformation.tr(),
      style: AppTextStyles.textStyle16.copyWith(color: AppColors.rhinoDark.shade400),
    );
  }
}
