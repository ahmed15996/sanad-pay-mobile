import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/constants/app_assets.dart';
import 'package:sanad/core/framework/spaces.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/util/routing/routes.dart';
import '../../cubits/create_acc_cubit/create_acc_cubit.dart';

class CustomRowAcceptTermsAndCondWidget extends StatelessWidget {
  const CustomRowAcceptTermsAndCondWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateAccCubit>();
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 23.w),
      child: Row(
        children: [
          SvgPicture.asset(AppAssets.info),
          widthSpace(8),

          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "By creating an account, you agree to the ",
                    style: AppTextStyles.textStyle12.copyWith(
                      color: AppColors.darkSecondaryColor
                    ),
                  ),
                  TextSpan(
                    text: "Terms & Conditions.",
                    style: AppTextStyles.textStyle12.copyWith(
                      color: AppColors.primaryColor,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.pushWithNamed(
                          Routes.termsView,
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
