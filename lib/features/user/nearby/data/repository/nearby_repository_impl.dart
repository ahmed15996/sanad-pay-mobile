import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/features/common/auth/data/models/user_model.dart';
import 'package:sanad/features/user/home/data/models/home_model.dart';
import 'package:sanad/features/user/nearby/data/data_source/params/search_params.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../data_source/remote/nearby_remote_data_source.dart';
import '../models/nearby_model.dart';
import 'nearby_repository.dart';


@Injectable(as: NearbyRepository)
class NearbyRepositoryImpl extends NearbyRepository {
  final NearbyRemoteDataSource searchRemoteDataSource;

  NearbyRepositoryImpl({required this.searchRemoteDataSource});

  @override
  Future<Either<Failure, NearbyModel>> fetchSearch(SearchParams params) async {
    try {
      NearbyModel nearbyModel = await searchRemoteDataSource.fetchSearch(params);
      return Right(nearbyModel);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }


}
