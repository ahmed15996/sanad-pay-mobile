
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/helpers/google_place_plus.dart';
import '../../../../../../core/widgets/custom_toast.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../data/models/place_lat_long_model.dart';
import '../../../data/models/place_model.dart';

part 'search_places_event.dart';

part 'search_places_state.dart';

@injectable
class SearchPlacesBloc extends Bloc<SearchPlacesEvent, SearchPlacesState> {
  List<PlaceModel> places = [];
  LatLng? searchedPosition;
  var searchCtrl = TextEditingController();

  SearchPlacesBloc() : super(SearchPlacesInitial()) {
    on<GetPlacesSuggestionsEvent>(
      _getPlacesSuggestionsEvent,
      transformer: (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 600))
          .distinct()
          .switchMap(mapper),
    );
    on<GetPlaceCoordinates>(_getPlaceCoordinates);
  }

  Future<void> _getPlacesSuggestionsEvent(
    GetPlacesSuggestionsEvent event,
    Emitter<SearchPlacesState> emit,
  ) async {

      try {
        emit(SearchPlacesLoadingState());
        places = await GooglePlacesPlus.getSuggestions(
          searchQuery: event.searchQuery,
          googleMapsKey: AppConstants.googleMapsKey,
        );
        emit(SearchPlacesSuccessState());
      } catch (e) {
        emit(SearchPlacesFailureState(error: LocaleKeys.noInternetError.tr()));
      }
  }

  Future<void> _getPlaceCoordinates(
    GetPlaceCoordinates event,
    Emitter<SearchPlacesState> emit,
  ) async {
    try {
      emit(SearchPlacesLoadingState());
      final PlaceLatLngModel placeLatLng =
          await GooglePlacesPlus.getLatitudeAndLongitude(
        placeId: event.placeId,
        googleMapsKey: AppConstants.googleMapsKey,
      );
      searchedPosition = LatLng(placeLatLng.latitude, placeLatLng.longitude);
      places.clear();
      searchCtrl.clear();
      emit(GetCoordinatesSuccessState());
    } catch (e) {
      showToast(
          text: LocaleKeys.noInternetError.tr(), state: ToastStates.error);
      emit(GetCoordinatesFailureState());
    }
  }

  @override
  Future<void> close() {
    searchCtrl.dispose();
    return super.close();
  }
}
