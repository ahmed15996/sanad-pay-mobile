import '../../../models/verify_code_model.dart';
import '../../../params/verify_code_param.dart';
import '../../../params/create_acc_param.dart';
import '../../../params/send_code_param.dart';

abstract class AuthRemoteDataSource {

  Future<String> sendCode({required SendCodeParam param});

  Future<VerifyCodeModel> verifyCode({required VerifyCodeParam param});

  Future<String> createAccount({required CreateAccParam param});
}
