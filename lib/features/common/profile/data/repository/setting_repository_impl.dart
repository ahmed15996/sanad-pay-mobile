import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/features/common/profile/data/repository/setting_repository.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../../../auth/data/models/user_model.dart';
import '../data_source/local/setting_local_data_source.dart';
import '../data_source/remote/setting_remote_data_source.dart';
import '../models/social_media_model.dart';

@Injectable(as: SettingRepository)
class SettingRepositoryImpl extends SettingRepository {
  final SettingRemoteDataSource settingRemoteDataSource;

  final SettingLocalDataSource settingLocalDataSource;

  SettingRepositoryImpl({
    required this.settingRemoteDataSource,
    required this.settingLocalDataSource,
  });

  @override
  Future<Either<Failure, dynamic>> clearDataUser() async {
    try {
      await settingLocalDataSource.clearDataUser();
      return const Right('Done');
    } on CacheException catch (exception) {
      return Left(CacheFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, String>> deleteAcc() async {
    try {
      String message = await settingRemoteDataSource.deleteAcc();
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, String>> logOut(String deviceToken) async {
    try {
      String message = await settingRemoteDataSource.logOut(deviceToken);
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }


  @override
  Future<Either<Failure, SocialMediaModel>> fetchSocialMedias() async {
    try {
      SocialMediaModel model =
          await settingRemoteDataSource.fetchSocialMedias();
      return Right(model);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, UserModel>> fetchUserAuth() async {
    try {
      UserModel model = await settingRemoteDataSource.authUser();
      return Right(model);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }
}
