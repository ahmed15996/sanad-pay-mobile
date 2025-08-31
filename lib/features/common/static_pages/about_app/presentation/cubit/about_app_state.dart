part of 'about_app_cubit.dart';

@immutable
abstract class AboutAppState {}

class AboutAppInitial extends AboutAppState {}
class GetWhoAreLoading extends AboutAppState {}
class GetWhoAreFailure extends AboutAppState {
  final String error ;

  GetWhoAreFailure({required this.error});
}
class GetWhoAreSuccess extends AboutAppState {}
