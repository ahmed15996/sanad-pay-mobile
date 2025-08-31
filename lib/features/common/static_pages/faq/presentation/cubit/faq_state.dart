part of 'faq_cubit.dart';

@immutable
abstract class FaqState {}

class FaqInitial extends FaqState {}

class GetFaqLoading extends FaqState {}
class GetFaqSuccess extends FaqState {}
class GetFaqFailure extends FaqState {
  final String error ;

  GetFaqFailure({required this.error});
}
