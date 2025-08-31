import 'package:dartz/dartz.dart';
import 'package:sanad/features/common/auth/data/models/verify_code_model.dart';
import '../../../../../../core/errors/failures.dart';
import '../../models/user_model.dart';
import '../../params/verify_code_param.dart';
import '../../params/create_acc_param.dart';
import '../../params/send_code_param.dart';

abstract class AuthRepository {


  Future<Either<Failure, String>> sendCode(
      {required SendCodeParam param});

  Future<Either<Failure, VerifyCodeModel>> verifyCode(
      {required VerifyCodeParam param});

  Future<Either<Failure, String>> createAccount(
      {required CreateAccParam param});

  Either<Failure, dynamic> saveUserData({required String token, required UserModel userModel});
}
