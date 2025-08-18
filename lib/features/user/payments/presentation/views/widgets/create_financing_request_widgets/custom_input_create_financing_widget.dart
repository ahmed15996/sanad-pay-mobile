import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/constants/app_assets.dart';
import 'package:sanad/core/widgets/custom_drop_down_field.dart';

import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../core/framework/app_validator.dart';
import '../../../../../../../core/framework/spaces.dart';
import '../../../../../../../core/widgets/custom_text_form_field.dart';

class CustomInputCreateFinancingWidget extends StatelessWidget {
  const CustomInputCreateFinancingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // var cubit = context.read<CreateAccCubit>();
    return Form(
      // key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            keyboardType: TextInputType.name,
            // ctrl: cubit.fullNameCtrl,
            prefixIcon: SvgPicture.asset(AppAssets.user, fit: BoxFit.scaleDown),
            fillColor: AppColors.whiteColor,
            validator: AppValidator.nameValidator,
            hintText: "Enter Full Name",
          ),
          heightSpace(20),
          CustomTextFormField(
            // ctrl: cubit.emailCtrl,
            prefixIcon: SvgPicture.asset(
              AppAssets.email,
              fit: BoxFit.scaleDown,
            ),
            suffixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsetsDirectional.only(end: 8.w),
                  child: Text(
                    "Optional",
                    style: AppTextStyles.textStyle12.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor.withOpacity(0.6),
                    ),
                  ),
                ),
              ],
            ),
            hintText: "Enter your email address",
            keyboardType: TextInputType.emailAddress,
            validator: AppValidator.fullEmailValidator,
          ),
          heightSpace(20),
          CustomDropDownField(
            items: [],
            onChanged: (value) {},
            fillColor: AppColors.whiteColor,
            borderColor: AppColors.transparentColor,

            prefixIcon: SvgPicture.asset(
              AppAssets.city,
              fit: BoxFit.scaleDown,
            ),
            hintText: "City",
            value: "",
          ),
        ],
      ),
    );
  }
}
