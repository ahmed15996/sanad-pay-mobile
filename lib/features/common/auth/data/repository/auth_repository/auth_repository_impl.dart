import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/features/common/auth/data/models/verify_code_model.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/errors/failures.dart';
import '../../data_source/local/auth_local_data_source.dart';
import '../../data_source/remote/auth_remote_data_source/auth_remote_data_source.dart';
import '../../models/user_model.dart';
import '../../params/verify_code_param.dart';
import '../../params/create_acc_param.dart';
import '../../params/send_code_param.dart';
import 'auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, VerifyCodeModel>> verifyCode({
    required VerifyCodeParam param,
  }) async {
    try {
      VerifyCodeModel verifyCodeModel = await authRemoteDataSource.verifyCode(param: param);
      return Right(verifyCodeModel);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }


  @override
  Future<Either<Failure, String>> sendCode({
    required SendCodeParam param,
  }) async {
    try {
      String message = await authRemoteDataSource.sendCode(param: param);
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Either<Failure, dynamic> saveUserData({
    required UserModel userModel,
    required String token,
  }) {
    try {
      authLocalDataSource.saveDataUser(userModel: userModel, token: token);
      return const Right('Done');
    } on CacheException catch (exception) {
      return Left(CacheFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, String>> createAccount({
    required CreateAccParam param,
  }) async {
    try {
      String message = await authRemoteDataSource.createAccount(
        param: param,
      );
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }
}
