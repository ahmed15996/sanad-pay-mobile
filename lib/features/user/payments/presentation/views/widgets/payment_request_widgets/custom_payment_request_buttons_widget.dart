import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/framework/spaces.dart';

import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../../cubits/payments_cubit/payments_cubit.dart';

class CustomPaymentRequestButtonsWidget extends StatelessWidget {
  final int orderId;
  final bool isFromNotification;
  const CustomPaymentRequestButtonsWidget({super.key, required this.orderId, required this.isFromNotification});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentsCubit,PaymentsState>(builder: (context, state) {
      var cubit = context.read<PaymentsCubit>();
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            width: 109.w,
            border: Border.all(color: AppColors.borderColor),
            backgroundColor: AppColors.transparentColor,
            radius: 20.r,
            text: LocaleKeys.accept.tr(),
            loadingColor: AppColors.primaryColor,
            onPressed: () {
              cubit.accept(orderId, isFromNotification,context);
            },
            isLoading: state is AcceptLoading,
            style: AppTextStyles.textStyle16.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600
            ),
          ),
          widthSpace(30),
          CustomButton(
            width: 109.w,
            border: Border.all(color: AppColors.borderColor),
            backgroundColor: AppColors.transparentColor,
            radius: 20.r,
            text: LocaleKeys.reject.tr(),
            loadingColor: AppColors.primaryColor,
            onPressed: () {
              cubit.reject(orderId,isFromNotification, context);
            },
            isLoading: state is RejectLoading,
            style: AppTextStyles.textStyle16.copyWith(
                color: AppColors.redColor,
                fontWeight: FontWeight.w600
            ),
          ),

        ],
      );
    },);
  }
}
