import 'package:dartz/dartz.dart';
import 'package:sanad/features/common/auth/data/models/user_model.dart';
import 'package:sanad/features/user/home/data/models/home_model.dart';
import '../../../../../core/errors/failures.dart';
import '../../../home/data/models/store_model.dart';

abstract class StoreDetailsRepository {
  Future<Either<Failure, StoreModel>> fetchStoreDetails(int storeId);


}
