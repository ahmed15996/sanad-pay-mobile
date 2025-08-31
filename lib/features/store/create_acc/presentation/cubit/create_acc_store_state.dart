part of 'create_acc_store_cubit.dart';

@immutable
abstract class CreateAccStoreState {}

class CreateAccStoreInitial extends CreateAccStoreState {}


class UpdateLocationData extends CreateAccStoreState {}
class UpdateLocationLoading extends CreateAccStoreState {}

class ChangeIndexTap extends CreateAccStoreState {}

class ChangeValueDropDown extends CreateAccStoreState {}


class GetDataLoading extends CreateAccStoreState {}

class GetDataSuccess extends CreateAccStoreState {}

class GetDataFailure extends CreateAccStoreState {
  final String error;

  GetDataFailure({required this.error});
}

class CreateAccLoading extends CreateAccStoreState {}

class CreateAccFailure extends CreateAccStoreState {}

class GetImagesSuccess extends CreateAccStoreState {}




