part of 'select_location_cubit.dart';

@immutable
abstract class SelectLocationState {}

class SelectLocationInitial extends SelectLocationState {}

class OnMapCreateSuccess extends SelectLocationState {}

class GetCurrentLoading extends SelectLocationState {}

class GetCurrentFailure extends SelectLocationState {
  final String error;

  GetCurrentFailure({required this.error});
}

class GetCurrentSuccess extends SelectLocationState {}

class GetPlacesLoading extends SelectLocationState {}

class GetPlacesSuccess extends SelectLocationState {}

class GetPlacesFailure extends SelectLocationState {
  final String error;

  GetPlacesFailure({required this.error});
}

class UpdateCameraLocation extends SelectLocationState {}

class UpdateCameraFailure extends SelectLocationState {}

class SetSearchResultValueState extends SelectLocationState {}

class GetAutoCompleteState extends SelectLocationState {}

class SelectLocationLoaded extends SelectLocationState {
  final Position currentLocation;

  SelectLocationLoaded({
    required this.currentLocation,
  });
}
