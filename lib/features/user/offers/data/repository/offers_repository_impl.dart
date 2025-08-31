import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/features/common/auth/data/models/user_model.dart';
import 'package:sanad/features/user/home/data/models/home_model.dart';
import 'package:sanad/features/user/offers/data/models/offers_model.dart';
import 'package:sanad/features/user/offers/data/params/offers_params.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../data_source/remote/offers_remote_data_source.dart';
import 'offers_repository.dart';


@Injectable(as: OffersRepository)
class OffersRepositoryImpl extends OffersRepository {
  final OffersRemoteDataSource offersRemoteDataSource;

  OffersRepositoryImpl({required this.offersRemoteDataSource});

  @override
  Future<Either<Failure, OffersModel>> fetchOffers(OffersParams params) async {
    try {
      OffersModel offersModel = await offersRemoteDataSource.fetchOffers(params);
      return Right(offersModel);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }


}
