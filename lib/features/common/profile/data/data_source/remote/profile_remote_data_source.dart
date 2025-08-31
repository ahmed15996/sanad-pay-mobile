import '../../../../auth/data/models/user_model.dart';
import '../../models/app_settings_model.dart';

abstract class ProfileRemoteDataSource {
  Future<String> logOut();

  Future<String> deleteAcc();

  Future<UserModel> fetchUserProfile();

  Future<AppSettingsModel> fetchAppSettings();

}
