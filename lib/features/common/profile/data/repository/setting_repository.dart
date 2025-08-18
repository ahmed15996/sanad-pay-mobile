import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../../auth/data/models/user_model.dart';
import '../models/social_media_model.dart';


abstract class SettingRepository {
  Future<Either<Failure, String>> logOut(String deviceToken);

  Future<Either<Failure, String>> deleteAcc();

  Future<Either<Failure, SocialMediaModel>> fetchSocialMedias();

  Future<Either<Failure, UserModel>> fetchUserAuth();

  Future<Either<Failure, dynamic>> clearDataUser();

}
