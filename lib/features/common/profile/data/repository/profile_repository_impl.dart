import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/features/common/profile/data/models/app_settings_model.dart';
import 'package:sanad/features/common/profile/data/repository/profile_repository.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../../../auth/data/models/user_model.dart';
import '../data_source/local/profile_local_data_source.dart';
import '../data_source/remote/profile_remote_data_source.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;
  final ProfileLocalDataSource profileLocalDataSource;

  ProfileRepositoryImpl({
    required this.profileRemoteDataSource,
    required this.profileLocalDataSource,
  });

  @override
  Future<Either<Failure, dynamic>> clearDataUser() async {
    try {
      await profileLocalDataSource.clearDataUser();
      return const Right('Done');
    } on CacheException catch (exception) {
      return Left(CacheFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, AppSettingsModel>> fetchAppSettings() async {
    try {
      AppSettingsModel appSettingsModel =
      await profileRemoteDataSource.fetchAppSettings();
      return Right(appSettingsModel);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, String>> deleteAcc() async {
    try {
      String message = await profileRemoteDataSource.deleteAcc();
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, String>> logOut() async {
    try {
      String message = await profileRemoteDataSource.logOut();
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }


  @override
  Future<Either<Failure, UserModel>> fetchUserProfile() async {
    try {
      UserModel model = await profileRemoteDataSource.fetchUserProfile();
      return Right(model);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }
}
