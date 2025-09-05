import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/core/constants/app_colors.dart';
import 'package:sanad/core/constants/app_text_styles.dart';
import 'package:sanad/features/user/payments/presentation/views/widgets/payment_request_widgets/custom_payment_request_buttons_widget.dart';
import 'package:sanad/features/user/payments/presentation/views/widgets/payment_request_widgets/custom_payment_request_row_data_widget.dart';
import 'package:sanad/features/user/payments/presentation/views/widgets/payment_request_widgets/custom_payment_request_store_data_widget.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../data/arguments/payment_request_arguments.dart';

class PaymentRequestView extends StatelessWidget {
  final PaymentRequestArguments paymentRequestArguments;
  const PaymentRequestView({super.key, required this.paymentRequestArguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: PopScope(
          canPop: paymentRequestArguments.isFromNotification,
          child: SingleChildScrollView(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 80,
                    left: 24,
                    right: 24,
                    bottom: 24,
                  ),
                  padding: EdgeInsets.only(
                    top: 76,
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(24.w),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        paymentRequestArguments.orderModel.status == "pending" ? LocaleKeys.paymentPending.tr() : paymentRequestArguments.orderModel.status == "rejected" ? LocaleKeys.paymentRejected.tr() : LocaleKeys.paymentApproved.tr() ,
                        style: AppTextStyles.textStyle16.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      heightSpace(8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppAssets.sr,
                            width: 25.w,
                            height: 28.h,
                            color: AppColors.blackColor,
                          ),
                          widthSpace(9.w),
                          Text(
                            paymentRequestArguments.orderModel.total,
                            style: AppTextStyles.textStyle32.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.rhinoDark.shade600,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Divider(),
                      ),
                      CustomPaymentRequestStoreDataWidget(
                        orderModel: paymentRequestArguments.orderModel,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Divider(),
                      ),
                      CustomPaymentRequestRowDataWidget(
                        title: LocaleKeys.date.tr(),
                        subtitle: paymentRequestArguments.orderModel.date,
                      ),
                      heightSpace(20),
                      CustomPaymentRequestRowDataWidget(
                        title: LocaleKeys.time.tr(),
                        subtitle: paymentRequestArguments.orderModel.time ?? "",
                      ),
                      heightSpace(20),
                      CustomPaymentRequestRowDataWidget(
                        title: LocaleKeys.status.tr(),
                        subtitle: paymentRequestArguments.orderModel.status,
                      ),

                      heightSpace(20),
                      CustomPaymentRequestRowDataWidget(
                        title: LocaleKeys.referenceNo.tr(),
                        subtitle:
                            paymentRequestArguments
                                .orderModel
                                .referenceNumber ??
                            "",
                      ),
                      if(paymentRequestArguments.orderModel.status == "pending")
                      ...[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: Divider(),
                        ),
                        heightSpace(10),
                        CustomPaymentRequestButtonsWidget(
                          orderId: paymentRequestArguments.orderModel.id,
                        ),
                      ]
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(paymentRequestArguments.orderModel.status == "pending" ? AppAssets.pending : paymentRequestArguments.orderModel.status == "rejected" ? AppAssets.rejected : AppAssets.success,width: 124,height: 124,),
                ),
                Positioned(
                  left: 15.w,
                  top: 230,
                  child: Container(
                    height: 22.h,
                    width: 22.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  right: 15.w,
                  top: 230,
                  child: Container(
                    height: 22.h,
                    width: 22.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
