import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/features/common/profile/data/models/app_settings_model.dart';
import 'package:sanad/features/common/profile/data/repository/profile_repository.dart';
import '../../../../../core/constants/app_cached.dart';
import '../../../../../core/local/shared_preferences/shared_pref_services.dart';
import '../../../../../core/util/routing/routes.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../../auth/data/models/user_model.dart';
import 'package:local_auth/local_auth.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final SharedPrefServices appPref;
  final ProfileRepository repository;

  ProfileCubit(
    this.appPref,
    this.repository,
  ) : super(ProfileInitial());

  void saveChanges(BuildContext context) {
    if (context.locale.languageCode == "ar") {
      context.setLocale(const Locale('en'));
      appPref.saveData(AppCached.lang, 'en');
    } else {
      context.setLocale(const Locale('ar'));
      appPref.saveData(AppCached.lang, 'ar');
    }
    emit(ChangeLangState());
  }

  void logOut({required BuildContext context}) async {
    emit(LogOutLoading());
    var result = await repository.logOut();
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(DeleteAccAndLogOutFailure());
      },
      (message) {
        clearUserData(context: context, message: message);
      },
    );
  }


  void deleteAcc({required BuildContext context}) async {
    emit(DeleteAccLoading());
    var result = await repository.deleteAcc();
    result.fold(
      (failure) {
        context.pop();
        showToast(text: failure.message, state: ToastStates.error);
        emit(DeleteAccAndLogOutFailure());
      },
      (message) {
        clearUserData(context: context, message: message);
      },
    );
  }

  bool? isHasFaceId;

  void changeHasFaceId() {
    isHasFaceId = !isHasFaceId!;
    appPref.saveData(AppCached.isFaceIdNotify, isHasFaceId);
    emit(ChangeHasFaceIdState());
  }

  bool isAuthenticated = false;

  Future<void> checkAuthentication() async {
    try{
      final LocalAuthentication auth = LocalAuthentication();
      bool canCheckBiometrics = await auth.canCheckBiometrics;
      bool isDeviceSupported = await auth.isDeviceSupported();
      isAuthenticated = canCheckBiometrics && isDeviceSupported;
      debugPrint(
          "isFaceIdNotify >>> ${appPref.getData(key: AppCached.isFaceIdNotify)}");
      emit(DeleteAccAndLogOutSuccess());
    }on PlatformException {
      // ...
    }catch(e){
      debugPrint(e.toString());
 
    }
  }


  String get token => appPref.getData(key: AppCached.token) ?? "";


  UserModel? userModel;
  AppSettingsModel? appSettingsModel;

  void fetchUserData() async {

    emit(GetDataLoading());
    var result = await repository.fetchUserProfile();
    result.fold(
      (failure) {
        emit(GetDataFailure(error: failure.message));
      },
      (userModel) {
        this.userModel = userModel;
        isHasFaceId = appPref.getData(key: AppCached.isFaceIdNotify) == true
            ? true
            : false;
        emit(DeleteAccAndLogOutSuccess());
      },
    );
  }

  void fetchAppSettings() async {

    emit(GetDataLoading());
    var result = await repository.fetchAppSettings();
    result.fold(
      (failure) {
        emit(GetDataFailure(error: failure.message));
      },
      (appSettingsModel) {
        this.appSettingsModel = appSettingsModel;
        if(token.isNotEmpty) {
          fetchUserData();
        }else{
          emit(DeleteAccAndLogOutSuccess());
        }

      },
    );
  }


  void clearUserData({
    required BuildContext context,
    required String message,
  }) async {
    var result = await repository.clearDataUser();
    result.fold(
      (failure) {
        context.pop();
        showToast(text: failure.message, state: ToastStates.error);
        emit(DeleteAccAndLogOutFailure());
      },
      (r) {
        context.pop();
        context.pushAndRemoveUntilWithNamed(
          Routes.loginView,
        );
        showToast(text: message, state: ToastStates.success);
        emit(DeleteAccAndLogOutSuccess());
      },
    );
  }


}
