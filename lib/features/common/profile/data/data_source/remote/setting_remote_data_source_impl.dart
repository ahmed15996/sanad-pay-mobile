import 'package:injectable/injectable.dart';
import 'package:sanad/features/common/profile/data/data_source/remote/setting_remote_data_source.dart';


import '../../../../../../core/api/api_consumer.dart';
import '../../../../../../core/api/base_response.dart';
import '../../../../../../core/constants/api_constants.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../../../auth/data/models/user_model.dart';
import '../../models/social_media_model.dart';
import '../../params/invite_user_params.dart';

@Injectable(as: SettingRemoteDataSource)
class SettingRemoteDataSourceImpl extends SettingRemoteDataSource {
  final ApiConsumer apiConsumer;

  SettingRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<String> deleteAcc() async {
    BaseResponse response = await apiConsumer.get(ApiConstants.deleteAcc);
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }



  @override
  Future<String> logOut(String deviceToken) async {
    BaseResponse response = await apiConsumer
        .get(ApiConstants.logout, queryParameters: {'device_id': deviceToken});
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }


  @override
  Future<SocialMediaModel> fetchSocialMedias() async {
    BaseResponse response = await apiConsumer.get(ApiConstants.login);
    if (response.status == true) {
      return SocialMediaModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<UserModel> authUser() async {
    BaseResponse response = await apiConsumer.get(ApiConstants.login);
    if (response.status == true) {
      return UserModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }
}
