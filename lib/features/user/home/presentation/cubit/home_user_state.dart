part of 'home_user_cubit.dart';

@immutable
abstract class HomeUserState {}

class HomeUserInitial extends HomeUserState {}
class ChangePageIndexState extends HomeUserState {}

class GetHomeDataLoading extends HomeUserState {}
class GetHomeDataSuccess extends HomeUserState {}
class GetHomeDataFailure extends HomeUserState {
  final String error ;

  GetHomeDataFailure({required this.error});
}
