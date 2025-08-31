part of 'privacy_cubit.dart';

@immutable
abstract class PrivacyState {}

class PrivacyInitial extends PrivacyState {}
class GetPrivacyLoading extends PrivacyState {}
class GetPrivacyFailure extends PrivacyState {
  final String error ;

  GetPrivacyFailure({required this.error});
}
class GetPrivacySuccess extends PrivacyState {}
