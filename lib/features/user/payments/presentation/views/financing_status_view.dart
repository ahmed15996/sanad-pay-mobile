import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/util/routing/routes.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/locale_keys.g.dart';

class FinancingStatusView extends StatelessWidget {
  const FinancingStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 24.w, top: 40.h),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "Request Submitted Successfully",
                    style: AppTextStyles.textStyle32,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 20.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(AppAssets.success),
                  heightSpace(42),
                  Text("Request Submitted Successfully",style: AppTextStyles.textStyle20.copyWith(
                    color: AppColors.darkSecondaryColor,
                    fontWeight: FontWeight.w600,
                  ),),
                  heightSpace(9),
                  Text("Great! Your request has been received and is being reviewed. We'll notify you as soon as a decision is made.",style: AppTextStyles.textStyle16.copyWith(
                    color: AppColors.darkSecondaryColor,
                  ),)
                  

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
