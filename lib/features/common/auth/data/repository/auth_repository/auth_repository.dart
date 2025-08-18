import 'package:dartz/dartz.dart';
import '../../../../../../core/errors/failures.dart';
import '../../models/sign_in_model.dart';
import '../../models/user_model.dart';
import '../../params/check_otp_param.dart';
import '../../params/create_acc_param.dart';
import '../../params/send_code_param.dart';
import '../../params/sign_in_param.dart';

abstract class AuthRepository {
  Future<Either<Failure, SignInModel>> signIn(
      {required SignInParam param});


  Future<Either<Failure, String>> sendCode(
      {required SendCodeParam param});

  Future<Either<Failure, String>> checkOtp(
      {required CheckOtpParam param});

  Future<Either<Failure, String>> createAccount(
      {required CreateAccParam param});

  Either<Failure, dynamic> saveUserData({required String token, required UserModel userModel});
}
