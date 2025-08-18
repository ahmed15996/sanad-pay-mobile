import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import '../../../../../../core/framework/app_firebase.dart';
import '../../../../../../core/helpers/custom_phone_controller.dart';
import '../../../../../../core/widgets/custom_toast.dart';
import '../../../data/params/create_acc_param.dart';
import '../../../data/repository/auth_repository/auth_repository.dart';

part 'create_acc_state.dart';

@injectable
class CreateAccCubit extends Cubit<CreateAccState> {
  final AuthRepository authRepository;
  final AppFirebase appFirebase;

  CreateAccCubit(this.authRepository, this.appFirebase)
    : super(CreateAccInitial());

  final fullNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final passwordConfirmationCtrl = TextEditingController();
  final userNameCtrl = TextEditingController();
  final phoneCtrl = PhoneFieldController();
  bool isTermsAgree = false;
  final formKey = GlobalKey<FormState>();

  void changeAgreeTerms(bool value) {
    isTermsAgree = value;
    emit(CreateAccSuccess());
  }

  void createAcc({required BuildContext context}) async {
    emit(CreateAccLoading());

    var result = await authRepository.createAccount(
      param: CreateAccParam(
        name: fullNameCtrl.text,
        email: emailCtrl.text,
        username: userNameCtrl.text,
        mobile: phoneCtrl.controller.text,
        password: passwordCtrl.text,
        passwordConfirmation: passwordConfirmationCtrl.text,
        agreedTerms: isTermsAgree,
      ),
    );
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(CreateAccFailure());
      },
      (message) {
        showToast(text: message, state: ToastStates.success);
        context.pop();
        emit(CreateAccSuccess());
      },
    );
  }

  @override
  Future<void> close() {
    fullNameCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    passwordConfirmationCtrl.dispose();
    userNameCtrl.dispose();
    phoneCtrl.dispose();
    return super.close();
  }
}
