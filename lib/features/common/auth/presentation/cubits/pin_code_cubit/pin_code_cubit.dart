import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/features/common/auth/data/arguments/create_acc_argument.dart';
import 'package:sanad/features/common/bottom_nav/data/arguments/bottom_nav_argument.dart';
import '../../../../../../core/framework/app_firebase.dart';
import '../../../../../../core/util/routing/routes.dart';
import '../../../../../../core/widgets/custom_toast.dart';
import '../../../data/arguments/pin_code_argument.dart';
import '../../../data/models/user_model.dart';
import '../../../data/params/verify_code_param.dart';
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
      param: SendCodeParam(phone: argument.phone),
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

  void verifyCode({
    required BuildContext context,
    required PinCodeArgument argument,

  }) async {
    emit(PinCodeLoading());
    var result = await repository.verifyCode(param: VerifyCodeParam(phone: argument.phone, code: pinCtrl.text, fcm: (await appFirebase.getFirebaseToken()) ?? ""));
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(PinCodeFailure());
      },
      (verifyCodeModel) {
        emit(PinCodeSuccess());
        if (verifyCodeModel.action == "login") {
          saveDataUser(
            token: verifyCodeModel.token!,
            userModel: verifyCodeModel.user!,
            context: context,
          );
        } else {
          context.pushWithNamed(
            Routes.createAccUserView,
            arguments: CreateAccArgument(phone: argument.phone),
          );
        }
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
        context.pushAndRemoveUntilWithNamed(Routes.bottomNavView,arguments: BottomNavArgument(isUser: userModel.type == "user"));
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
