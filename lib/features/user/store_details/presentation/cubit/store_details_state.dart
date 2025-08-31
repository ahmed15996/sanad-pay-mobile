part of 'store_details_cubit.dart';

@immutable
abstract class StoreDetailsState {}

class StoreDetailsInitial extends StoreDetailsState {}

class GetStoreDetailsLoading extends StoreDetailsState {}
class GetStoreDetailsSuccess extends StoreDetailsState {}
class GetStoreDetailsFailure extends StoreDetailsState {
  final String error ;

  GetStoreDetailsFailure({required this.error});
}

