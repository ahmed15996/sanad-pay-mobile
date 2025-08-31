part of 'offers_cubit.dart';

abstract class OffersState {}

class OffersInitial extends OffersState {}


class GetOffersLoading extends OffersState {}

class GetOffersPaginationLoading extends OffersState {}

class GetOffersPaginationFailure extends OffersState {}

class GetOffersFailure extends OffersState {
  final String error;

  GetOffersFailure({required this.error});
}

class GetOffersSuccess extends OffersState {}

