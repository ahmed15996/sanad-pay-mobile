part of 'payments_cubit.dart';

abstract class PaymentsState {}

class PaymentsInitial extends PaymentsState {}


class GetPreviousPaymentsLoading extends PaymentsState {}

class GetPreviousPaymentsPaginationLoading extends PaymentsState {}

class GetPreviousPaymentsPaginationFailure extends PaymentsState {}

class GetPreviousPaymentsFailure extends PaymentsState {
  final String error;

  GetPreviousPaymentsFailure({required this.error});
}

class GetPreviousPaymentsSuccess extends PaymentsState {}

class GetUpcomingPaymentsLoading extends PaymentsState {}

class GetUpcomingPaymentsSuccess extends PaymentsState {}

class GetUpcomingPaymentsFailure extends PaymentsState {
  final String error;

  GetUpcomingPaymentsFailure({required this.error});
}

class PayLoading extends PaymentsState {}

class PaySuccess extends PaymentsState {}

class PayFailure extends PaymentsState {}


class AcceptLoading extends PaymentsState {}

class AcceptSuccess extends PaymentsState {}

class AcceptFailure extends PaymentsState {}

class RejectLoading extends PaymentsState {}

class RejectSuccess extends PaymentsState {}

class RejectFailure extends PaymentsState {}

