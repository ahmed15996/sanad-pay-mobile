import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import 'package:sanad/features/store/home/data/models/order_model.dart';
import 'package:sanad/features/user/payments/data/arguments/payment_request_arguments.dart';
import 'package:sanad/features/user/payments/data/models/payment_model.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../core/framework/spaces.dart';
import '../../../../../../../core/util/routing/routes.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../../cubits/payments_cubit/payments_cubit.dart';

class CustomPaymentWidget extends StatelessWidget {
  final PaymentModel paymentModel;
  const CustomPaymentWidget({super.key, required this.paymentModel});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PaymentsCubit>();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 77.w,
            height: 77.h,
            padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 18.h),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(AppAssets.logo),
          ),
          heightSpace(24),
          Text(
            "${LocaleKeys.paymentDate.tr()}\n${paymentModel.date}",
            textAlign: TextAlign.center,
            style: AppTextStyles.textStyle28.copyWith(
              color: AppColors.rhinoDark.shade600,
            ),
          ),
          heightSpace(24),
          Text(
            paymentModel.amount,
            style: AppTextStyles.textStyle20.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.secondaryColor,
            ),
          ),
          heightSpace(20),
          CustomButton(
            text: LocaleKeys.payNow.tr(),
            isLoading: cubit.state is PayLoading,
            onPressed: () {
              cubit.pay();
            },
          ),
          heightSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.transactionHistory.tr(),
                style: AppTextStyles.textStyle14.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: AppColors.primaryColor),
            ],
          ).onTap(
            function: () {
              context.pushWithNamed(Routes.transactionHistoryView);
            },
          ),
        ],
      ),
    );
  }
}
