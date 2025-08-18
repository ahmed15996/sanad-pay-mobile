import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/features/common/profile/data/repository/setting_repository.dart';
import '../../../../../core/constants/app_cached.dart';
import '../../../../../core/framework/app_firebase.dart';
import '../../../../../core/local/shared_preferences/shared_pref_services.dart';
import '../../../../../core/util/routing/routes.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../../auth/data/models/user_model.dart';
import '../../data/models/social_media_model.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final SharedPrefServices appPref;
  final SettingRepository repository;
  final AppFirebase appFirebase;

  ProfileCubit(
    this.appPref,
    this.repository,
    this.appFirebase,
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
    var result = await repository.logOut(
        await appFirebase.getFirebaseToken() ?? ""
    );
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

  bool? isNotify;

  void changeNotify() {
    isNotify = !isNotify!;
    emit(ChangeNotifySuccess());
  }

  bool? isHasFaceId;

  void changeHasFaceId() {
    isHasFaceId = !isHasFaceId!;
    appPref.saveData(AppCached.isFaceIdNotify, isHasFaceId);
    emit(ChangeHasFaceIdState());
  }

  bool isAuthenticated = false;

  // Future<void> checkAuthentication() async {
  //   final LocalAuthentication auth = LocalAuthentication();
  //   bool canCheckBiometrics = await auth.canCheckBiometrics;
  //   bool isDeviceSupported = await auth.isDeviceSupported();
  //   isAuthenticated = canCheckBiometrics && isDeviceSupported;
  //   debugPrint(
  //       "isFaceIdNotify >>> ${appPref.getData(key: AppCached.isFaceIdNotify)}");
  //   emit(CheckAuthentication());
  // }


  SocialMediaModel? socialMediaModel;
  String? token;

  void getToken() async {
    token = await appPref.getData(key: AppCached.token) ?? "";
  }

  void fetchSocialMedia() async {
    emit(GetDataLoading());
    getToken();
    var result = await repository.fetchSocialMedias();
    result.fold(
      (failure) {
        emit(GetDataFailure(error: failure.message));
      },
      (socialMediaModel) async {
        this.socialMediaModel = socialMediaModel;
        if (token!.isNotEmpty) {
          fetchUserData();
        } else {
          emit(DeleteAccAndLogOutSuccess());
        }
      },
    );
  }

  UserModel? userModel;

  void fetchUserData() async {
    emit(GetDataLoading());
    var result = await repository.fetchUserAuth();
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

  // void goLink({required String link}) async {
  //   Uri launchUri = Uri.parse(link);
  //   try {
  //     if (await canLaunchUrl(launchUri)) {
  //       await launchUrl(
  //         launchUri,
  //         mode: LaunchMode.externalApplication,
  //       );
  //     } else {
  //       showToast(
  //           text: 'Could not launch $launchUri', state: ToastStates.error);
  //       emit(DeleteAccAndLogOutFailure());
  //     }
  //   } catch (e) {
  //     showToast(text: 'Could not launch $launchUri', state: ToastStates.error);
  //     emit(DeleteAccAndLogOutFailure());
  //   }
  // }

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
