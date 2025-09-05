import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/routing/routes.dart';
import 'package:sanad/features/user/payments/data/params/send_financing_request_params.dart';
import '../../../../../../core/widgets/custom_toast.dart';
import '../../../data/arguments/financing_status_arguments.dart';
import '../../../data/repository/payments_repository.dart';
part 'create_financing_state.dart';

@injectable
class CreateFinancingCubit extends Cubit<CreateFinancingState> {
  final PaymentsRepository repository;

  CreateFinancingCubit(this.repository,) : super(CreateFinancingInitial());


  final nationalIdCtrl = TextEditingController();
  final dateOfBirthCtrl = TextEditingController();
  final occupationCtrl = TextEditingController();
  final dateOfStartedJobCtrl = TextEditingController();
  final salaryCtrl = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isButtonEnabled = false;

  void validateForm() {

      isButtonEnabled =
          nationalIdCtrl.text.isNotEmpty &&
              dateOfBirthCtrl.text.isNotEmpty &&
              occupationCtrl.text.isNotEmpty &&
              dateOfStartedJobCtrl.text.isNotEmpty &&
              salaryCtrl.text.isNotEmpty;
      emit(SelectDateState());
  }

  void initListeners(){
    nationalIdCtrl.addListener(validateForm);
    dateOfBirthCtrl.addListener(validateForm);
    occupationCtrl.addListener(validateForm);
    dateOfStartedJobCtrl.addListener(validateForm);
    salaryCtrl.addListener(validateForm);
  }

  void selectDateOfBirth(DateTime date){
    dateOfBirthCtrl.text = DateFormat('yyyy-MM-dd', 'en').format(date);
    emit(SelectDateState());
  }

  void selectDateOfStartedJob(DateTime date){
    dateOfStartedJobCtrl.text = DateFormat('yyyy-MM-dd', 'en').format(date);
    emit(SelectDateState());
  }


  void sendFinancingRequest(BuildContext context) async {
    emit(SendFinancingRequestLoading());
    var result = await repository.sendFinancingRequest(SendFinancingRequestParams(nationalId: nationalIdCtrl.text, dateOfBirth: dateOfBirthCtrl.text, occupation: occupationCtrl.text, salary: salaryCtrl.text, jobStartDate: dateOfStartedJobCtrl.text));
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(SendFinancingRequestFailure());
      },
      (message) {
        context.pushAndRemoveUntilWithNamed(Routes.financingStatusView,arguments: FinancingStatusArguments(isSuccess: true));
        emit(SendFinancingRequestSuccess());
      },
    );
  }

  void changeValue(){
    emit(SelectDateState());
  }



  @override
  Future<void> close() {
    nationalIdCtrl.dispose();
    dateOfBirthCtrl.dispose();
    occupationCtrl.dispose();
    dateOfStartedJobCtrl.dispose();
    salaryCtrl.dispose();
    return super.close();
  }
}
