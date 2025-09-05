import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/core/util/extensions/navigation.dart';

import '../../../../../../core/helpers/custom_location_helper.dart';
import '../../../../../../core/widgets/custom_toast.dart';
import '../../../../../../generated/locale_keys.g.dart';

part 'select_location_state.dart';

@injectable
class SelectLocationCubit extends Cubit<SelectLocationState> {
  SelectLocationCubit() : super(SelectLocationInitial());

  final searchLocationCtrl = TextEditingController();

  Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  GoogleMapController? googleMapController;

  LatLng? currentLocation;

  String? currentLocationName;

  void onMapCreate(GoogleMapController controller) async {
    if (!mapController.isCompleted) {
      mapController.complete(controller);
      googleMapController = await mapController.future;
      emit(OnMapCreateSuccess());
    }
  }

  void checkPermission({required BuildContext context}) async {
    emit(GetCurrentLoading());
    await Geolocator.requestPermission();
    bool serviceEnabled = await LocationHelper.isServiceEnabled();
    bool serviceHavePermission = await LocationHelper.isServiceHavePermission();
    if (serviceEnabled && serviceHavePermission) {
      return getCurrentLocation(isApple: false,);
    } else if (!serviceEnabled && serviceHavePermission) {
      return getCurrentLocation(isApple: false,);
    } else if (serviceEnabled && !serviceHavePermission) {
      await LocationHelper.requestLocationPermission(
        onFinish: () async {
          bool serviceHavePermission =
              await LocationHelper.isServiceHavePermission();
          if (serviceHavePermission) {
            return getCurrentLocation(isApple: false);
          } else {
             context.pop();
          }
        },
      );
    } else {
      await LocationHelper.requestLocationPermission(
        onFinish: () async {
          bool serviceHavePermission =
              await LocationHelper.isServiceHavePermission();
          if (serviceHavePermission) {
            return getCurrentLocation(isApple: false);
          } else {
             context.pop();
          }
        },
      );
    }
  }

  void getCurrentLocation({required bool isApple}) async {
    try {
        Position? position = await LocationHelper.getCurrentPosition();
        currentLocation = LatLng(position?.latitude ?? 24.774265, position?.longitude ?? 46.738586);
      Placemark placeMark =
          await LocationHelper.getLocationInfo(currentLocation!);
      currentLocationName =
          "${placeMark.name}, ${placeMark.subLocality}, ${placeMark.locality}, ${placeMark.administrativeArea}, ${placeMark.country}";
      emit(GetCurrentSuccess());
    } catch (error) {
      emit(GetCurrentFailure(error: error.toString()));
    }
  }

  void checkPermissionAndUpdateCurrentLocation() async {
    await Geolocator.requestPermission();
    bool serviceEnabled = await LocationHelper.isServiceEnabled();
    bool serviceHavePermission = await LocationHelper.isServiceHavePermission();
    if (serviceEnabled && serviceHavePermission) {
      return updateCurrentLocation();
    } else if (!serviceEnabled && serviceHavePermission) {
      return updateCurrentLocation();
    } else if (serviceEnabled && !serviceHavePermission) {
      await LocationHelper.requestLocationPermission(
        onFinish: () async {
          bool serviceHavePermission =
              await LocationHelper.isServiceHavePermission();
          if (serviceHavePermission) {
            return updateCurrentLocation();
          }
        },
      );
    } else {
      await LocationHelper.requestLocationPermission(
        onFinish: () async {
          bool serviceHavePermission =
              await LocationHelper.isServiceHavePermission();
          if (serviceHavePermission) {
            return updateCurrentLocation();
          }
        },
      );
    }
  }

  updateCurrentLocation() async {
    Position? position = await LocationHelper.getCurrentPosition();
    LatLng currentLoc = LatLng(position?.latitude ?? 24.774265, position?.longitude ?? 46.738586);
    currentLocation = currentLoc;
    googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: currentLoc, zoom: 15.0)));
  }

  void updateCameraPos({required LatLng pos}) async {
    currentLocation = pos;
    googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: currentLocation!, zoom: 15.0)));
  }

  void onUpdateCamera({required CameraPosition position}) {
    currentLocation = position.target;
  }

  void onCloseCamera() async {
    try {
      Placemark placeMark =
          await LocationHelper.getLocationInfo(currentLocation!);
      currentLocationName =
          "${placeMark.name}, ${placeMark.subLocality}, ${placeMark.locality}, ${placeMark.administrativeArea}, ${placeMark.country}";
      emit(UpdateCameraLocation());
    } catch (error) {
      showToast(
          text: LocaleKeys.noInternetError.tr(), state: ToastStates.error);
      emit(UpdateCameraFailure());
    }
  }

  @override
  Future<void> close() {
    if (googleMapController != null) {
      googleMapController!.dispose();
    }
    searchLocationCtrl.dispose();
    return super.close();
  }
}
