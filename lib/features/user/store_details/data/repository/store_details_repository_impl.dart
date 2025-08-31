import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/features/common/auth/data/models/user_model.dart';
import 'package:sanad/features/user/home/data/models/home_model.dart';
import 'package:sanad/features/user/home/data/models/store_model.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../data_source/remote/store_details_remote_data_source.dart';
import 'store_details_repository.dart';


@Injectable(as: StoreDetailsRepository)
class StoreDetailsRepositoryImpl extends StoreDetailsRepository {
  final StoreDetailsRemoteDataSource storeDetailsRemoteDataSource;

  StoreDetailsRepositoryImpl({required this.storeDetailsRemoteDataSource});

  @override
  Future<Either<Failure, StoreModel>> fetchStoreDetails(int storeId) async {
    try {
      StoreModel storeModel = await storeDetailsRemoteDataSource.fetchStoreDetails(storeId);
      return Right(storeModel);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }
}
