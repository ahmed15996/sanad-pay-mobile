import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_cached.dart';
import '../../../../../core/local/shared_preferences/shared_pref_services.dart';
import '../views/widgets/custom_bottom_bar_item.dart';
part 'bottom_nav_state.dart';

@injectable
class BottomNavCubit extends Cubit<BottomNavState> {
  final SharedPrefServices appPref;
  BottomNavCubit(this.appPref) : super(BottomNavInitial());

  int currentIndex = 0;

  String get token => appPref.getData(key: AppCached.token) ?? '';

  void changeNavIndex({required int index}) {
    currentIndex = index;
    emit(ChangeNavBarIndex());
  }

  List<Widget> screens = [
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];



  List<Widget> getBottomNavigationBar(BuildContext context) {
    return [
      CustomBottomBarItem(icon: AppAssets.home,title: "Shopping", index: 0),
      CustomBottomBarItem(icon: AppAssets.offers,title: "Offers", index: 1),
      SizedBox(),
      CustomBottomBarItem(icon: AppAssets.payment,title: "Payment", index: 3),
      CustomBottomBarItem(icon: AppAssets.user,title: "Profile", index: 4),
    ];
  }
}
