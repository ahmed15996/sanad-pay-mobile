import '../../../../../common/auth/data/models/verify_code_model.dart';
import '../../models/city_model.dart';
import '../../params/create_acc_user_param.dart';

abstract class CreateAccUserRemoteDataSource {
  Future<VerifyCodeModel> createAcc({required CreateAccUserParam param});
  Future<List<CityModel>> fetchCities();
}
