import 'package:injectable/injectable.dart';
import 'package:sanad/features/common/profile/data/data_source/remote/profile_remote_data_source.dart';


import '../../../../../../core/api/api_consumer.dart';
import '../../../../../../core/api/base_response.dart';
import '../../../../../../core/constants/api_constants.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../../../auth/data/models/user_model.dart';
import '../../models/app_settings_model.dart';


@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final ApiConsumer apiConsumer;

  ProfileRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<String> deleteAcc() async {
    BaseResponse response = await apiConsumer. delete(ApiConstants.deleteAcc);
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }



  @override
  Future<String> logOut() async {
    BaseResponse response = await apiConsumer
        .post(ApiConstants.logout);
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }



  @override
  Future<UserModel> fetchUserProfile() async {
    BaseResponse response = await apiConsumer.get(ApiConstants.profile);
    if (response.status == true) {
      return UserModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<AppSettingsModel> fetchAppSettings() async {
    BaseResponse response = await apiConsumer.get(
      ApiConstants.appSettings,
    );
    if (response.status == true) {
      return AppSettingsModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }
}
