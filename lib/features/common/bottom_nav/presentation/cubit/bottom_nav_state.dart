part of 'bottom_nav_cubit.dart';

@immutable
abstract class BottomNavState {}

class BottomNavInitial extends BottomNavState {}

class ChangeNavBarIndex extends BottomNavState {}

class UserProfileLoading extends BottomNavState {}
class UserProfileSuccess extends BottomNavState {}
class UserProfileFailure extends BottomNavState {
    final String error;
    UserProfileFailure({required this.error});
}
