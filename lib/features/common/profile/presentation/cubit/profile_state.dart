part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class CheckAuthentication extends ProfileState {}
class ChangeLangState extends ProfileState {}
class ChangeHasFaceIdState extends ProfileState {}
class ChangeNotifySuccess extends ProfileState {}

class DeleteAccLoading extends ProfileState {}

class ToggleNotifyLoading extends ProfileState {}
class GetDataLoading extends ProfileState {}
class GetDataFailure extends ProfileState {
  final String error ;

  GetDataFailure({required this.error});
}

class LogOutLoading extends ProfileState {}

class DeleteAccAndLogOutFailure extends ProfileState {}

class DeleteAccAndLogOutSuccess extends ProfileState {}

class InviteUserLoading extends ProfileState {}

class InviteUserFailure extends ProfileState {}

class InviteUserSuccess extends ProfileState {}

class ToggleTheme extends ProfileState {}
class ToggleThemeSuccess extends ProfileState {}
