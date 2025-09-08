import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/widgets/custom_error.dart';
import 'package:sanad/core/widgets/custom_loading.dart';
import 'package:sanad/features/user/payments/presentation/views/widgets/payments_widget/custom_apply_for_financing_widget.dart';
import 'package:sanad/features/user/payments/presentation/views/widgets/payments_widget/custom_completed_payment_widget.dart';
import 'package:sanad/features/user/payments/presentation/views/widgets/payments_widget/custom_payment_widget.dart';

import '../../../cubits/payments_cubit/payments_cubit.dart';

class CustomUpcomingPaymentsTabViewWidget extends StatelessWidget {
  const CustomUpcomingPaymentsTabViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PaymentsCubit>();
    return cubit.state is GetUpcomingPaymentsLoading
        ? CustomLoading()
        : cubit.state is GetUpcomingPaymentsFailure
        ? CustomError(
            error: (cubit.state as GetUpcomingPaymentsFailure).error,
            retry: () {
              cubit.fetchUpcomingPayments();
            },
          )
        : cubit.upcomingPayments!.upcomingPayment == null
        ? CustomApplyForFinancingWidget(
            canApplyFinance: cubit.upcomingPayments!.canApplyForFinance,
          )
        : CustomPaymentWidget(
            paymentModel: cubit.upcomingPayments!.upcomingPayment!,
          );
  }
}
