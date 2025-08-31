import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../data_source/remote/create_invoice_remote_data_source.dart';
import '../params/create_invoice_params.dart';
import 'create_invoice_repository.dart';

@Injectable(as: CreateInvoiceRepository)
class CreateInvoiceRepositoryImpl extends CreateInvoiceRepository {
  final CreateInvoiceRemoteDataSource createInvoiceRemoteDataSource;

  CreateInvoiceRepositoryImpl({required this.createInvoiceRemoteDataSource});

  @override
  Future<Either<Failure, String>> createInvoice(
      {required CreateInvoiceParams param}) async {
    try {
      String message = await createInvoiceRemoteDataSource.createInvoice(
        param: param,
      );
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

}
