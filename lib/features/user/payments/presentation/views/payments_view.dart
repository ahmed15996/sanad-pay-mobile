import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/framework/spaces.dart';
import 'package:sanad/features/user/payments/presentation/views/widgets/payments_widget/custom_previous_payments_list_widget.dart';
import 'package:sanad/features/user/payments/presentation/views/widgets/payments_widget/custom_tabbar_widget.dart';
import 'package:sanad/features/user/payments/presentation/views/widgets/payments_widget/custom_upcoming_payments_tab_view_widget.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/di/di.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../cubits/payments_cubit/payments_cubit.dart';

class PaymentsView extends StatelessWidget {
  const PaymentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: BlocProvider(
        create: (context) => getIt<PaymentsCubit>()..fetchUpcomingPayments(),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 24.w, top: 30.h),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      LocaleKeys.payment.tr(),
                      style: AppTextStyles.textStyle20.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.rhinoDark.shade600,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
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
                  child: BlocBuilder<PaymentsCubit, PaymentsState>(
                    builder: (context, state) {
                      return DefaultTabController(
                        length: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTabBarWidget(),
                            heightSpace(23),
                            Expanded(
                              child: TabBarView(
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  CustomUpcomingPaymentsTabViewWidget(),
                                  CustomPreviousPaymentsListWidget(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
