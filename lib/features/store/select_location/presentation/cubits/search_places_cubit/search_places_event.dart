part of 'search_places_bloc.dart';

@immutable
abstract class SearchPlacesEvent extends Equatable {}

class GetPlacesSuggestionsEvent extends SearchPlacesEvent {
  final String searchQuery;

  GetPlacesSuggestionsEvent({required this.searchQuery});

  @override
  List<Object?> get props => [searchQuery];
}

class GetPlaceCoordinates extends SearchPlacesEvent {
  final String placeId;


  GetPlaceCoordinates({required this.placeId});

  @override
  List<Object?> get props => [placeId];
}
