import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/core/helpers/custom_location_helper.dart';
import 'package:sanad/features/common/auth/data/models/user_model.dart';
import 'package:sanad/features/user/home/data/models/home_model.dart';

import '../../../../../core/constants/app_cached.dart';
import '../../../../../core/local/shared_preferences/shared_pref_services.dart';
import '../../data/params/home_user_params.dart';
import '../../data/repository/home_user_repository.dart';
part 'home_user_state.dart';

@injectable
class HomeUserCubit extends Cubit<HomeUserState> {
  final HomeUserRepository repository;
  final SharedPrefServices appPref;

  HomeUserCubit(
    this.repository,
    this.appPref,
  ) : super(HomeUserInitial());

  String get token => appPref.getData(key: AppCached.token) ?? "";




  int currentPage = 0;

  void changePageIndex(index) {
    currentPage = index;
    emit(ChangePageIndexState());
  }

  HomeModel? homeModel;
  UserModel? userModel;

  void fetchHome() async {
    emit(GetHomeDataLoading());
    Position? position = await LocationHelper.getCurrentLocation();
    var result = await repository.fetchHome(HomeUserParams(lat: position?.latitude ?? 24.774265, long: position?.longitude ?? 46.738586));
    result.fold(
      (failure) {
        emit(GetHomeDataFailure(error: failure.message));
      },
      (homeModel) {
        this.homeModel = homeModel;
        if(token.isNotEmpty){
          fetchUserProfile();
        }else{
          emit(GetHomeDataSuccess());
        }
      },
    );
  }


  void fetchUserProfile() async {
    emit(GetHomeDataLoading());
    var result = await repository.fetchUserProfile();
    result.fold(
      (failure) {
        emit(GetHomeDataFailure(error: failure.message));
      },
      (userModel) {
        this.userModel = userModel;
        emit(GetHomeDataSuccess());
      },
    );
  }

}
