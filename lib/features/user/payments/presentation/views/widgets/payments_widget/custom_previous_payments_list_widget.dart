import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sanad/core/widgets/custom_error.dart';
import 'package:sanad/core/widgets/custom_loading.dart';
import 'package:sanad/features/user/payments/presentation/views/widgets/payments_widget/custom_previous_payments_item_widget.dart';

import '../../../../../../../core/framework/spaces.dart';
import '../../../cubits/payments_cubit/payments_cubit.dart';

class CustomPreviousPaymentsListWidget extends StatelessWidget {
  const CustomPreviousPaymentsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentsCubit, PaymentsState>(
      builder: (context, state) {
        var cubit = context.read<PaymentsCubit>();
        return state is GetPreviousPaymentsLoading ? CustomLoading() : state is GetPreviousPaymentsFailure ? CustomError(error: state.error, retry: (){
          cubit.fetchPreviousPayments();
        }) : SmartRefresher(
          controller: cubit.previousPaymentsRefreshController,
          onRefresh: () => cubit.refreshPreviousPayments(),
          onLoading: () => cubit.paginatePreviousPayments(),
          enablePullUp: true,
          child: ListView.separated(itemBuilder: (context, index) {
            return CustomPreviousPaymentsItemWidget(paymentModel: cubit.previousPayments[index]);
          }, separatorBuilder: (context, index) {
            return heightSpace(16.h);
          }, itemCount: cubit.previousPayments.length),
        );
      },
    );
  }
}
