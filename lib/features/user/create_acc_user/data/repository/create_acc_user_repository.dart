import 'package:dartz/dartz.dart';
import 'package:sanad/features/common/auth/data/models/verify_code_model.dart';
import '../../../../../core/errors/failures.dart';
import '../models/city_model.dart';
import '../params/create_acc_user_param.dart';

abstract class CreateAccUserRepository {
  Future<Either<Failure, List<CityModel>>> fetchCities();

  Future<Either<Failure, VerifyCodeModel>> createAcc({required CreateAccUserParam param});
}
