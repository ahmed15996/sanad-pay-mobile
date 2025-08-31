
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../params/create_invoice_params.dart';

abstract class CreateInvoiceRepository {

  Future<Either<Failure, String>> createInvoice({required CreateInvoiceParams param});

}
