import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/features/common/auth/data/models/verify_code_model.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../common/auth/data/models/user_model.dart';
import '../data_source/remote/create_acc_user_remote_data_source.dart';
import '../models/city_model.dart';
import '../params/create_acc_user_param.dart';
import 'create_acc_user_repository.dart';

@Injectable(as: CreateAccUserRepository)
class CreateAccUserRepositoryImpl extends CreateAccUserRepository {
  final CreateAccUserRemoteDataSource createAccUserRemoteDataSource;

  CreateAccUserRepositoryImpl({required this.createAccUserRemoteDataSource});

  @override
  Future<Either<Failure, VerifyCodeModel>> createAcc({
    required CreateAccUserParam param,
  }) async {
    try {
      VerifyCodeModel verifyCodeModel = await createAccUserRemoteDataSource
          .createAcc(param: param);
      return Right(verifyCodeModel);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<CityModel>>> fetchCities() async {
    try {
      List<CityModel> cities = await createAccUserRemoteDataSource
          .fetchCities();
      return Right(cities);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }
}
