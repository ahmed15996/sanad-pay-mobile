import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import '../../../../../../core/framework/app_firebase.dart';
import '../../../../../../core/util/routing/routes.dart';
import '../../../../../../core/widgets/custom_toast.dart';
import '../../../data/arguments/pin_code_argument.dart';
import '../../../data/models/user_model.dart';
import '../../../data/params/check_otp_param.dart';
import '../../../data/params/send_code_param.dart';
import '../../../data/repository/auth_repository/auth_repository.dart';
part 'pin_code_state.dart';

@injectable
class PinCodeCubit extends Cubit<PinCodeState> {
  final AuthRepository repository;
  final AppFirebase appFirebase;

  PinCodeCubit(this.repository, this.appFirebase) : super(PinCodeInitial());

  final pinCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void sendCode({
    required VoidCallback timer,
    required PinCodeArgument argument,
  }) async {
    emit(ResendCodeLoading());
    var result = await repository.sendCode(
      param: SendCodeParam(mobile: argument.phone),
    );
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(PinCodeFailure());
      },
      (message) {
        timer();
        emit(PinCodeSuccess());
      },
    );
  }


  void checkOtp({
    required BuildContext context,
    required CheckOtpParam param,
  }) async {
    emit(PinCodeLoading());
    var result = await repository.checkOtp(param: param);
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(PinCodeFailure());
      },
      (message) {
        emit(PinCodeSuccess());
        showToast(text: message, state: ToastStates.success);
        // context.pushAndRemoveUntilWithNamed(
        //   Routes.resetPasswordView,
        //   arguments: ResetPasswordArguments(phone: param.mobile),
        // );
      },
    );
  }

  void saveDataUser({
    required String token,
    required UserModel userModel,
    required BuildContext context,
  }) {
    emit(PinCodeLoading());
    var result = repository.saveUserData(userModel: userModel, token: token);
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(SaveDataFailure());
      },
      (r) {
        context.pushAndRemoveUntilWithNamed(Routes.bottomNavView);
        emit(PinCodeSuccess());
      },
    );
  }

  @override
  Future<void> close() {
    pinCtrl.dispose();
    return super.close();
  }
}
