import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../../core/framework/spaces.dart';
import '../../../../../../../core/widgets/custom_footer_pagination_widget.dart';
import '../../../../../../../core/widgets/custom_header_pagination_widget.dart';
import '../../../../../../../core/widgets/custom_image_network.dart';
import '../../../cubits/transaction_history_cubit/transaction_history_cubit.dart';
import 'custom_transaction_history_item_widget.dart';

class CustomTransactionHistoryListWidget extends StatelessWidget {
  const CustomTransactionHistoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TransactionHistoryCubit>();
    return SmartRefresher(
      controller: cubit.transactionHistoryRefreshController,
      onRefresh: () => cubit.refreshTransactionHistory(),
      onLoading: () => cubit.paginateTransactionHistory(),
      header: CustomHeaderAppPagination(),
      footer: CustomFooterAppPagination(),
      enablePullUp: true,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        itemBuilder: (context, index) {
          return CustomTransactionHistoryItemWidget(
            transactionModel: cubit.transactionHistory[index],
          );
        },
        itemCount: cubit.transactionHistory.length,
        separatorBuilder: (context, index) {
          return heightSpace(16.h);
        },
      ),
    );
  }
}
