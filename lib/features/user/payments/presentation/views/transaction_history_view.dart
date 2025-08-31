import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/constants/app_assets.dart';
import 'package:sanad/core/constants/app_text_styles.dart';
import 'package:sanad/core/widgets/custom_image_network.dart';
import 'package:sanad/core/widgets/custom_loading.dart';
import 'package:sanad/features/user/payments/presentation/cubits/transaction_history_cubit/transaction_history_cubit.dart';
import 'package:sanad/features/user/payments/presentation/views/widgets/transaction_history_widgets/custom_transaction_history_list_widget.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_error.dart';
import '../../../../../generated/locale_keys.g.dart';

class TransactionHistoryView extends StatelessWidget {
  const TransactionHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: CustomAppbar(title: LocaleKeys.transactionHistory.tr()),
      body: BlocBuilder<TransactionHistoryCubit, TransactionHistoryState>(builder: (context, state) {
        var cubit = context.read<TransactionHistoryCubit>();
        if(state is GetTransactionHistoryLoading){
          return CustomLoading();
        }else if(state is GetTransactionHistoryFailure){
          return CustomError(error: state.error, retry: (){
            cubit.fetchTransactionHistory();
          },);
        }else{
          return CustomTransactionHistoryListWidget();
        }
      },)
    );
  }
}
