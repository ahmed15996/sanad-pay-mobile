part of 'transaction_history_cubit.dart';

abstract class TransactionHistoryState {}

class TransactionHistoryInitial extends TransactionHistoryState {}


class GetTransactionHistoryLoading extends TransactionHistoryState {}

class GetTransactionHistoryPaginationLoading extends TransactionHistoryState {}

class GetTransactionHistoryPaginationFailure extends TransactionHistoryState {}

class GetTransactionHistoryFailure extends TransactionHistoryState {
  final String error;

  GetTransactionHistoryFailure({required this.error});
}

class GetTransactionHistorySuccess extends TransactionHistoryState {}



