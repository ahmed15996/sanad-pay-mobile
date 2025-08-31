part of 'search_places_bloc.dart';

@immutable
abstract class SearchPlacesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchPlacesInitial extends SearchPlacesState {}

class SearchPlacesLoadingState extends SearchPlacesState {}

class SearchPlacesSuccessState extends SearchPlacesState {}

class GetCoordinatesSuccessState extends SearchPlacesState {}

class GetCoordinatesFailureState extends SearchPlacesState {}

class SearchPlacesFailureState extends SearchPlacesState {
  final String error;

  SearchPlacesFailureState({required this.error});
}
