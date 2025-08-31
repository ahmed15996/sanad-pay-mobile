import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sanad/features/user/payments/data/models/payment_model.dart';
import 'package:sanad/features/user/payments/data/models/transaction_model.dart';
import '../../../data/models/upcoming_payments_model.dart';
import '../../../data/params/transaction_history_params.dart';
import '../../../data/repository/payments_repository.dart';
part 'transaction_history_state.dart';

@injectable
class TransactionHistoryCubit extends Cubit<TransactionHistoryState> {
  final PaymentsRepository repository;

  TransactionHistoryCubit(this.repository,) : super(TransactionHistoryInitial());

  List<TransactionModel> transactionHistory = [];
  int page = 1;


  final transactionHistoryRefreshController = RefreshController();



  void fetchTransactionHistory() async {
    if (page != 1) {
      emit(GetTransactionHistoryPaginationLoading());
      debugPrint("Pagination...............");
    } else {
      emit(GetTransactionHistoryLoading());
    }
    var result = await repository.fetchTransactionHistory(TransactionHistoryParams(page: page));
    result.fold(
      (failure) {
        if (page != 1) {
          transactionHistoryRefreshController.loadFailed();
          emit(GetTransactionHistoryPaginationFailure());
        } else {
          emit(GetTransactionHistoryFailure(error: failure.message));
        }
      },
      (transactionHistoryModel) {
        if (page != 1) {
          if (transactionHistoryModel.transactions.isNotEmpty) {
            transactionHistory.addAll(transactionHistoryModel.transactions);
            transactionHistoryRefreshController.loadComplete();
          } else {
            transactionHistoryRefreshController.loadNoData();
          }
        } else {
          transactionHistoryRefreshController.refreshCompleted();
          transactionHistoryRefreshController.loadComplete();
          transactionHistory.clear();
          transactionHistory.addAll(transactionHistoryModel.transactions);
        }
        emit(GetTransactionHistorySuccess());
      },
    );
  }

  void refreshTransactionHistory() {
    debugPrint("+++++++++++++++++++++++++++++++");
    page = 1;
    debugPrint("Refreshing..........");
    fetchTransactionHistory();
  }

  void paginateTransactionHistory() {
    debugPrint("+++++++++++++++++++++++++++++++");
    state is GetTransactionHistoryPaginationFailure
        ? debugPrint("Not Add Item Count")
        : page++;
    debugPrint("Pagination..........");
    fetchTransactionHistory();
  }


  @override
  Future<void> close() {
    transactionHistoryRefreshController.dispose();
    return super.close();
  }
}
