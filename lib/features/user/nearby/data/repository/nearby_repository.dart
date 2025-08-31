import 'package:dartz/dartz.dart';
import 'package:sanad/features/common/auth/data/models/user_model.dart';
import 'package:sanad/features/user/home/data/models/home_model.dart';
import 'package:sanad/features/user/nearby/data/data_source/params/search_params.dart';
import '../../../../../core/errors/failures.dart';
import '../models/nearby_model.dart';

abstract class NearbyRepository {
  Future<Either<Failure, NearbyModel>> fetchSearch(SearchParams params);



}
