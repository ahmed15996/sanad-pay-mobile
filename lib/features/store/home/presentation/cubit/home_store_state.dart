part of 'home_store_cubit.dart';

@immutable
abstract class HomeStoreState {}

class HomeStoreInitial extends HomeStoreState {}

class GetStoreHomeDataLoading extends HomeStoreState {}
class GetStoreHomeDataSuccess extends HomeStoreState {}
class GetStoreHomeDataFailure extends HomeStoreState {
  final String error ;

  GetStoreHomeDataFailure({required this.error});
}
