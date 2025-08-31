import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:sanad/core/widgets/custom_toast.dart';
import 'package:sanad/features/common/auth/data/models/user_model.dart';
import 'package:sanad/features/common/profile/data/repository/profile_repository.dart';
import 'package:sanad/features/store/home/data/models/dashboard_model.dart';
import 'package:sanad/features/store/home/data/models/order_model.dart';
import 'package:sanad/features/user/home/data/models/home_model.dart';
import 'package:sanad/features/user/home/data/repository/home_user_repository.dart';

import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/constants/app_cached.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/local/shared_preferences/shared_pref_services.dart';
import '../../../../common/profile/data/models/app_settings_model.dart';
import '../../data/repository/home_store_repository.dart';
part 'home_store_state.dart';

@injectable
class HomeStoreCubit extends Cubit<HomeStoreState> {
  final HomeStoreRepository homeStoreRepository;
  final HomeUserRepository homeUserRepository;
  final ProfileRepository profileRepository;
  final SharedPrefServices appPref;

  HomeStoreCubit(
    this.homeStoreRepository,
    this.profileRepository,
    this.homeUserRepository,
    this.appPref,
  ) : super(HomeStoreInitial());


  DashboardModel? dashboardModel;
  UserModel? userModel;
  AppSettingsModel? appSettingsModel;

  void fetchAppSettings() async {

    emit(GetStoreHomeDataLoading());
    var result = await profileRepository.fetchAppSettings();
    result.fold(
          (failure) {
        emit(GetStoreHomeDataFailure(error: failure.message));
      },
          (appSettingsModel) {
        this.appSettingsModel = appSettingsModel;
        emit(GetStoreHomeDataSuccess());
      },
    );
  }

  void fetchDashboard() async {
    emit(GetStoreHomeDataLoading());
    var result = await homeStoreRepository.fetchDashboard();
    result.fold(
      (failure) {
        emit(GetStoreHomeDataFailure(error: failure.message));
      },
      (dashboardModel) {
        this.dashboardModel = dashboardModel;
        fetchUserProfile();
      },
    );
  }


  void fetchUserProfile() async {
    emit(GetStoreHomeDataLoading());
    var result = await homeUserRepository.fetchUserProfile();
    result.fold(
      (failure) {
        emit(GetStoreHomeDataFailure(error: failure.message));
      },
      (userModel) {
        this.userModel = userModel;
        initPusher();
        fetchAppSettings();
      },
    );
  }

  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

  Future<void> initPusher() async {
    try {
      await pusher.init(
        apiKey: AppConstants.pusherKey,
        cluster: AppConstants.pusherCluster,
        authEndpoint: "${ApiConstants.baseUrl}${ApiConstants.pusherAuth}",
        onAuthorizer: onAuthorizer,

        onEvent: (event) {
         try{


           if (event.data.isNotEmpty) {

             if (event.eventName == "order.status.changed") {
               var data = jsonDecode(event.data);
               OrderModel orderModel = OrderModel.fromJson(data["order"]);
               dashboardModel!.pendingOrders.removeWhere((element) => element.id == orderModel.id);
               if(orderModel.status == "approved"){
                 showToast(text: "order is Approved from (${orderModel.userName})", state: ToastStates.success);
                 dashboardModel!.latestOrders.add(orderModel);
                 dashboardModel!.monthSales =  num.parse(data["monthly_sales"].toString());
                 dashboardModel!.todaySales =  num.parse(data["today_sales"].toString());
               }else{
                 showToast(text: "order is Rejected from (${orderModel.userName}", state: ToastStates.error);
               }
               emit(GetStoreHomeDataSuccess());
             }
           }
         }catch(e){
           log(e.toString());
         }
        },
      );
      await pusher.subscribe(
        channelName:
        'private-store.${appPref.getData(key: AppCached.userId)}',
      );
      await pusher.connect();
    } catch (e) {
      debugPrint("Error :$e");
    }
  }

  dynamic onAuthorizer(
      String channelName,
      String socketId,
      dynamic options,
      ) async {
    Map json;
    try {
      var authUrl = "${ApiConstants.baseUrl}${ApiConstants.pusherAuth}";
      var token = appPref.getData(key: AppCached.token);
      var result = await Dio().post(
        authUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
            "app-api-key": AppConstants.apiKey,
          },
        ),
        data: FormData.fromMap({
          'socket_id': socketId,
          'channel_name': channelName,
        }),
      );
      try {
        json = result.data;
      } catch (e) {
        return {};
      }

      return {"auth": json['auth']};
    } catch (e) {
      log("Error :$e");
    }
  }

  @override
  Future<void> close() {
    if (pusher.connectionState == "CONNECTED") {
      pusher.disconnect();
    }
    return super.close();
  }

}
