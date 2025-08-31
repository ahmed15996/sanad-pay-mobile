import 'package:dartz/dartz.dart';
import 'package:sanad/features/common/profile/data/models/app_settings_model.dart';

import '../../../../../core/errors/failures.dart';
import '../../../auth/data/models/user_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, String>> logOut();

  Future<Either<Failure, String>> deleteAcc();

  Future<Either<Failure, UserModel>> fetchUserProfile();

  Future<Either<Failure, AppSettingsModel>> fetchAppSettings();

  Future<Either<Failure, dynamic>> clearDataUser();

}
