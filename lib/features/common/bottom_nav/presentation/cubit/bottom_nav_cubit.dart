import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/features/common/auth/data/models/user_model.dart';
import 'package:sanad/features/store/home/presentation/views/store_home_view.dart';
import 'package:sanad/features/store/sales/presentation/views/sales_view.dart';
import 'package:sanad/features/user/home/data/repository/home_user_repository.dart';
import 'package:sanad/features/user/home/presentation/views/home_user_view.dart';
import 'package:sanad/features/user/offers/presentation/views/offers_view.dart';
import 'package:sanad/features/user/payments/presentation/views/payments_view.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_cached.dart';
import '../../../../../core/local/shared_preferences/shared_pref_services.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../profile/presentation/views/profile_view.dart';
import '../views/widgets/custom_bottom_bar_item.dart';
part 'bottom_nav_state.dart';

@injectable
class BottomNavCubit extends Cubit<BottomNavState> {
  final SharedPrefServices appPref;
  final HomeUserRepository homeUserRepository;
  BottomNavCubit(this.appPref, this.homeUserRepository) : super(BottomNavInitial());

  int currentIndex = 0;

  String get token => appPref.getData(key: AppCached.token) ?? '';

  void changeNavIndex({required int index}) {
    currentIndex = index;
    emit(ChangeNavBarIndex());
  }

  List<Widget> userScreens = [
    HomeUserView(),
    OffersView(),
    SizedBox(),
    PaymentsView(),
    ProfileView(),
  ];

  List<Widget> storeScreens = [

    StoreHomeView(),
    SizedBox(),
    SalesView(),
  ];

  UserModel? userModel;

  void fetchUserProfile()async{
    emit(UserProfileLoading());
    var result = await homeUserRepository.fetchUserProfile();
    result.fold(
      (failure) {
        emit(UserProfileFailure(error: failure.message));
      },
      (userModel) {
        this.userModel = userModel;
        emit(UserProfileSuccess());
      },
    );

  }



  List<Widget> getUserBottomNavigationBar() {
    return [
      CustomBottomBarItem(icon: AppAssets.home,title: LocaleKeys.shopping.tr(), index: 0,isUser: true,),
      CustomBottomBarItem(icon: AppAssets.offers,title: LocaleKeys.offers.tr(), index: 1,isUser: true,),
      SizedBox(),
      CustomBottomBarItem(icon: AppAssets.payment,title: LocaleKeys.payment.tr(), index: 3,isUser: true,),
      CustomBottomBarItem(icon: AppAssets.user,title: LocaleKeys.profile.tr(), index: 4,isUser: true,),
    ];
  }

  List<Widget> getStoreBottomNavigationBar() {
    return [

      CustomBottomBarItem(icon: AppAssets.home,title: LocaleKeys.home.tr(), index: 0,isUser: false,),
      SizedBox(),
      CustomBottomBarItem(icon: AppAssets.order,title: LocaleKeys.sales.tr(), index: 2,isUser: false,),
    ];
  }
}
