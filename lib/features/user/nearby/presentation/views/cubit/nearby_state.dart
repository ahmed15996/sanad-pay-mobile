part of 'nearby_cubit.dart';

abstract class NearbyState {}

class NearbyInitial extends NearbyState {}


class GetNearbyLoading extends NearbyState {}

class GetNearbyPaginationLoading extends NearbyState {}

class GetNearbyPaginationFailure extends NearbyState {}

class GetNearbyFailure extends NearbyState {
  final String error;

  GetNearbyFailure({required this.error});
}

class GetNearbySuccess extends NearbyState {}

