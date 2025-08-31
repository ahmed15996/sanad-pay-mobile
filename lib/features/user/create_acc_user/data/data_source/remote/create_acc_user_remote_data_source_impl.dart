import 'package:injectable/injectable.dart';
import 'package:sanad/features/common/auth/data/models/verify_code_model.dart';
import '../../../../../../core/api/api_consumer.dart';
import '../../../../../../core/api/base_response.dart';
import '../../../../../../core/constants/api_constants.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../../../../common/auth/data/models/user_model.dart';
import '../../models/city_model.dart';
import '../../params/create_acc_user_param.dart';
import 'create_acc_user_remote_data_source.dart';

@Injectable(as: CreateAccUserRemoteDataSource)
class CreateAccUserRemoteDataSourceImpl extends CreateAccUserRemoteDataSource {
  final ApiConsumer apiConsumer;

  CreateAccUserRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<VerifyCodeModel> createAcc(
      {required CreateAccUserParam param}) async {
    BaseResponse response = await apiConsumer.post(
      ApiConstants.createAccount,
      body: param.toJson(),
    );
    if (response.status == true) {
      return VerifyCodeModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<List<CityModel>> fetchCities() async {
    BaseResponse response = await apiConsumer.get(ApiConstants.cities);
    if (response.status == true) {
      return response.data
          .map<CityModel>((json) => CityModel.fromJson(json))
          .toList();
    } else {
      throw ServerException(response.message.toString());
    }
  }
}
