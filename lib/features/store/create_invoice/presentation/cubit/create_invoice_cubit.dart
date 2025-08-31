import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/features/common/profile/data/repository/profile_repository.dart';
import '../../../../../core/helpers/custom_phone_controller.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../../../common/auth/data/models/user_model.dart';
import '../../../../common/profile/data/models/app_settings_model.dart';
import '../../../../user/home/data/repository/home_user_repository.dart';
import '../../../home/data/models/dashboard_model.dart';
import '../../../home/data/repository/home_store_repository.dart';
import '../../data/params/create_invoice_params.dart';
import '../../data/repository/create_invoice_repository.dart';

part 'create_invoice_state.dart';

@injectable
class CreateInvoiceCubit extends Cubit<CreateInvoiceState> {
  final CreateInvoiceRepository repository;
  final HomeStoreRepository homeStoreRepository;
  final HomeUserRepository homeUserRepository;
  final ProfileRepository profileRepository;

  CreateInvoiceCubit(this.repository, this.homeStoreRepository, this.homeUserRepository, this.profileRepository) : super(CreateInvoiceInitial());

  final formKey = GlobalKey<FormState>();
  final totalCtrl = TextEditingController();
  PhoneFieldController phoneCtrl = PhoneFieldController();

  DashboardModel? dashboardModel;
  UserModel? userModel;
  AppSettingsModel? appSettingsModel;

  void fetchDashboard() async {
    emit(GetDataLoading());
    var result = await homeStoreRepository.fetchDashboard();
    result.fold(
          (failure) {
        emit(GetDataFailure(error: failure.message));
      },
          (dashboardModel) {
        this.dashboardModel = dashboardModel;
        fetchUserProfile();
      },
    );
  }

  void fetchAppSettings() async {

    emit(GetDataLoading());
    var result = await profileRepository.fetchAppSettings();
    result.fold(
          (failure) {
        emit(GetDataFailure(error: failure.message));
      },
          (appSettingsModel) {
        this.appSettingsModel = appSettingsModel;
        emit(GetDataSuccess());
      },
    );
  }


  void fetchUserProfile() async {
    emit(GetDataLoading());
    var result = await homeUserRepository.fetchUserProfile();
    result.fold(
          (failure) {
        emit(GetDataFailure(error: failure.message));
      },
          (userModel) {
        this.userModel = userModel;
      fetchAppSettings();
      },
    );
  }

  void updateBarcode(String barcode, BuildContext context) {
    phoneCtrl.controller.text = barcode;
    createInvoice(context, true);
  }

  void createInvoice(BuildContext context, bool isQr) async {
    if (isQr) {
      emit(CreateQrInvoiceLoading());
    } else {
      emit(CreateInvoiceLoading());
    }

    final result = await repository.createInvoice(
      param: CreateInvoiceParams(
        total: totalCtrl.text,
        phone: phoneCtrl.controller.text,
      ),
    );
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(CreateInvoiceFailure());
      },
      (message) {
        showToast(text: message, state: ToastStates.success);
        context.pop(arguments: true);
        emit(CreateInvoiceSuccess());
      },
    );
  }

  @override
  Future<void> close() {
    totalCtrl.dispose();
    phoneCtrl.dispose();
    return super.close();
  }
}
