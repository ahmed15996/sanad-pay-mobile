import '../../params/create_invoice_params.dart';

abstract class CreateInvoiceRemoteDataSource {
  Future<String> createInvoice({required CreateInvoiceParams param});

}
