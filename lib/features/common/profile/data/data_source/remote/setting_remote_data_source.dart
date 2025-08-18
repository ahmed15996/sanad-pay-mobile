import '../../../../auth/data/models/user_model.dart';
import '../../models/social_media_model.dart';

abstract class SettingRemoteDataSource {
  Future<String> logOut(String deviceToken);

  Future<String> deleteAcc();

  Future<SocialMediaModel> fetchSocialMedias();

  Future<UserModel> authUser();

}
