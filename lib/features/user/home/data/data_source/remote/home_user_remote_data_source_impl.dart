import 'package:injectable/injectable.dart';
import 'package:sanad/features/common/auth/data/models/user_model.dart';
import 'package:sanad/features/user/home/data/models/home_model.dart';
import 'package:sanad/features/user/home/data/params/home_user_params.dart';
import '../../../../../../core/api/api_consumer.dart';
import '../../../../../../core/api/base_response.dart';
import '../../../../../../core/constants/api_constants.dart';
import '../../../../../../core/errors/exceptions.dart';
import 'home_user_remote_data_source.dart';

@Injectable(as: HomeUserRemoteDataSource)
class HomeUserRemoteDataSourceImpl extends HomeUserRemoteDataSource {
  final ApiConsumer apiConsumer;

  HomeUserRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<HomeModel> fetchHome(HomeUserParams params) async {
    BaseResponse response = await apiConsumer.get(ApiConstants.home,queryParameters: params.toJson());
    if (response.status == true) {
      return HomeModel.fromJson(response.data);
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


}
