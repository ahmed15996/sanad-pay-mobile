part of 'sales_cubit.dart';

abstract class SalesState {}

class SalesInitial extends SalesState {}


class GetSalesPaginationLoading extends SalesState {}

class GetSalesPaginationFailure extends SalesState {}


class GetSalesDataLoading extends SalesState {}
class GetSalesDataFailure extends SalesState {
  final String error;

  GetSalesDataFailure({required this.error});
}
class GetSalesDataSuccess extends SalesState {}



