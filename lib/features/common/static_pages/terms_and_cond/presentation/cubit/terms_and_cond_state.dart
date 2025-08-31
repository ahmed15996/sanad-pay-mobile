part of 'terms_and_cond_cubit.dart';

@immutable
abstract class TermsAndCondState {}

class TermsAndCondInitial extends TermsAndCondState {}
class GetTermsLoading extends TermsAndCondState {}
class GetTermsFailure extends TermsAndCondState {
  final String error ;

  GetTermsFailure({required this.error});
}
class GetTermsSuccess extends TermsAndCondState {}
