import 'package:injectable/injectable.dart';
import 'package:sanad/features/common/auth/data/models/verify_code_model.dart';
import '../../../../../../../core/api/api_consumer.dart';
import '../../../../../../../core/api/base_response.dart';
import '../../../../../../../core/constants/api_constants.dart';
import '../../../../../../../core/errors/exceptions.dart';
import '../../../params/verify_code_param.dart';
import '../../../params/create_acc_param.dart';
import '../../../params/send_code_param.dart';
import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiConsumer apiConsumer;

  AuthRemoteDataSourceImpl({required this.apiConsumer});


  @override
  Future<String> sendCode({required SendCodeParam param}) async {
    BaseResponse response = await apiConsumer.post(
      ApiConstants.sendCode,
      body: param.toJson(),
    );
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<VerifyCodeModel> verifyCode({required VerifyCodeParam param}) async {
    BaseResponse response = await apiConsumer.post(
      ApiConstants.verifyCode,
      body: param.toJson(),
    );
    if (response.status == true) {
      return VerifyCodeModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<String> createAccount({
    required CreateAccParam param,
  }) async {
    BaseResponse response = await apiConsumer.post(
      ApiConstants.createAccount,
      body: param.toJson(),
    );
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }
}
