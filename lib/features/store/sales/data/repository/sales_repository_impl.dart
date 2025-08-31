import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/features/store/sales/data/models/sales_model.dart';
import 'package:sanad/features/store/sales/data/repository/sales_repository.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../data_source/remote/sales_remote_data_source.dart';
import '../params/orders_params.dart';

@Injectable(as: SalesRepository)
class SalesRepositoryImpl extends SalesRepository {
  final SalesRemoteDataSource salesRemoteDataSource;

  SalesRepositoryImpl({required this.salesRemoteDataSource});

  @override
  Future<Either<Failure, SalesModel>> fetchSales(
    OrdersParams params,
  ) async {
    try {
      SalesModel salesModel = await salesRemoteDataSource.fetchSales(
        params,
      );
      return Right(salesModel);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }
}
