import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import '../../../../../../core/framework/app_firebase.dart';
import '../../../../../../core/helpers/custom_phone_controller.dart';
import '../../../../../../core/util/routing/routes.dart';
import '../../../../../../core/widgets/custom_toast.dart';
import '../../../data/arguments/pin_code_argument.dart';
import '../../../data/models/user_model.dart';
import '../../../data/params/forget_password_param.dart';
import '../../../data/params/send_code_param.dart';
import '../../../data/params/sign_in_param.dart';
import '../../../data/repository/auth_repository/auth_repository.dart';
part 'login_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final AuthRepository repository;
  final AppFirebase appFirebase;

  SignInCubit(this.repository, this.appFirebase) : super(SignInInitial());

  PhoneFieldController phoneCtrl = PhoneFieldController();
  TextEditingController userNameOrEmailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void signIn({required BuildContext context}) async {
    emit(SignInLoading());
    var result = await repository.signIn(
      param: SignInParam(
        identify: userNameOrEmailCtrl.text,
        password: passwordCtrl.text,
        fcm: (await appFirebase.getFirebaseToken()) ?? "",
      ),
    );
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(SignInFailure());
      },
      (signInModel) {
        saveDataUser(
          token: signInModel.token!,
          userModel: signInModel.user,
          context: context,
        );
      },
    );
  }

  void sendCode(BuildContext context) async {
    emit(SignInLoading());
    var result = await repository.sendCode(
      param: SendCodeParam(mobile: phoneCtrl.controller.text),
    );
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(SignInFailure());
      },
      (message) {
        emit(SignInSuccess());
        showToast(text: message, state: ToastStates.success);
        context.pushAndRemoveUntilWithNamed(
          Routes.pinCodeView,
          arguments: PinCodeArgument(
            phone: phoneCtrl.controller.text,
          ),
        );
      },
    );
  }


  void saveDataUser({
    required String token,
    required UserModel userModel,
    required BuildContext context,
  }) {
    emit(SignInLoading());
    var result = repository.saveUserData(userModel: userModel, token: token);
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(SignInFailure());
      },
      (r) {
        emit(SignInSuccess());
        context.pushAndRemoveUntilWithNamed(Routes.bottomNavView);
      },
    );
  }

  @override
  Future<void> close() {
    phoneCtrl.dispose();
    userNameOrEmailCtrl.dispose();
    passwordCtrl.dispose();
    return super.close();
  }
}
