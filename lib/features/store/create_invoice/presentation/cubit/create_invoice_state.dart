part of 'create_invoice_cubit.dart';

abstract class CreateInvoiceState {}

final class CreateInvoiceInitial extends CreateInvoiceState {}


final class UpdateBarcodeState extends CreateInvoiceState {}

class CreateInvoiceLoading extends CreateInvoiceState {}

class CreateQrInvoiceLoading extends CreateInvoiceState {}

class CreateInvoiceSuccess extends CreateInvoiceState {}

class CreateInvoiceFailure extends CreateInvoiceState {}

class GetDataSuccess extends CreateInvoiceState {}

class GetDataLoading extends CreateInvoiceState {}



class GetDataFailure extends CreateInvoiceState {
  final String error;
  GetDataFailure({required this.error});
}



