import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/features/user/home/data/models/category_model.dart';
import '../../../../../core/framework/app_firebase.dart';
import '../../../../../core/helpers/custom_phone_controller.dart';
import '../../../../../core/helpers/image_helper.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../../../user/create_acc_user/data/models/city_model.dart';
import '../../../../user/create_acc_user/data/repository/create_acc_user_repository.dart';
import '../../../select_location/data/arguments/store_location_argument.dart';
import '../../data/params/create_acc_store_param.dart';
import '../../data/repository/create_acc_store_repository.dart';
import '../views/widgets/custom_finish_acc_store_dialog.dart';

part 'create_acc_store_state.dart';

@injectable
class CreateAccStoreCubit extends Cubit<CreateAccStoreState> {
  final CreateAccUserRepository userRepository;
  final CreateAccStoreRepository techRepository;
  final AppFirebase appFirebase;

  CreateAccStoreCubit(
    this.userRepository,
    this.techRepository,
    this.appFirebase,
  ) : super(CreateAccStoreInitial());

  final formKey = GlobalKey<FormState>();

  final storeNameCtrl = TextEditingController();
  final storeOwnerNameCtrl = TextEditingController();
  final storeLocationCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final phoneCtrl = PhoneFieldController();
  final storeLogoCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final branchesCountCtrl = TextEditingController();
  final workFromCtrl = TextEditingController();
  final workToCtrl = TextEditingController();

  final commerceNumCtrl = TextEditingController();
  final imageCommerceCtrl = TextEditingController();

  CityModel? selectedCityId;
  CategoryModel? selectedCategoryId;

  void changeCityValue(CityModel value) {
    selectedCityId = value;
    emit(ChangeValueDropDown());
  }

  String formatTimeOfDay(TimeOfDay tod) {
    final hour = tod.hour.toString().padLeft(2, '0');
    final minute = tod.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  void changeCategoryValue(CategoryModel value) {
    selectedCategoryId = value;
    emit(ChangeValueDropDown());
  }

  void changeWorkFrom(TimeOfDay value) {
    workFromCtrl.text = formatTimeOfDay(value);
    emit(ChangeValueDropDown());
  }

  void changeWorkTo(TimeOfDay value) {
    workToCtrl.text = formatTimeOfDay(value);
    emit(ChangeValueDropDown());
  }

  LatLng? currentLocation;

  void updateLocationData(StoreLocationArgument argument) {
    storeLocationCtrl.text = argument.address.toString();
    currentLocation = LatLng(
      double.parse(argument.lat),
      double.parse(argument.long),
    );
    emit(UpdateLocationData());
  }

  List<CityModel> cities = [];
  List<CategoryModel> categories = [];

  void fetchCities() async {
    emit(GetDataLoading());
    var result = await userRepository.fetchCities();
    result.fold(
      (failure) {
        emit(GetDataFailure(error: failure.message));
      },
      (cities) {
        this.cities = cities;
        fetchCategories();
      },
    );
  }

  void fetchCategories() async {
    emit(GetDataLoading());
    var result = await techRepository.fetchCategories();
    result.fold(
      (failure) {
        emit(GetDataFailure(error: failure.message));
      },
      (categories) {
        this.categories = categories;
        emit(GetDataSuccess());
      },
    );
  }

  File? imageCommerce;
  File? storeImage;

  /// Type == 0 ? image commerce :store image
  void pickImage({required BuildContext context, required int type}) async {
    try {
      if (type == 0) {
        imageCommerce = await DocumentHelper().pickImage(
          type: PickImageFromEnum.gallery,
        );
        if (imageCommerce != null) {
          imageCommerceCtrl.text = imageCommerce!.path;
          emit(GetImagesSuccess());
        }
      } else {
        storeImage = await DocumentHelper().pickImage(
          type: PickImageFromEnum.gallery,
        );
        if (storeImage != null) {
          storeLogoCtrl.text = storeImage!.path;
          emit(GetImagesSuccess());
        }
      }
    } catch (error) {
      showToast(text: error.toString(), state: ToastStates.error);
      emit(CreateAccFailure());
    }
  }

  void deleteImage({required int type}) {
    if (type == 0) {
      imageCommerce = null;
      imageCommerceCtrl.clear();
    } else {
      storeImage = null;
    }
    emit(GetImagesSuccess());
  }

  Future<CreateAccStoreParam> getParam() async {
    return CreateAccStoreParam(
      ownerName: storeOwnerNameCtrl.text,
      storeName: storeNameCtrl.text,
      storeLogo: MultipartFile.fromFileSync(storeImage!.path),
      phone: phoneCtrl.controller.text,
      fcm: await appFirebase.getFirebaseToken() ?? "",
      address: storeLocationCtrl.text,
      lat: currentLocation!.latitude,
      long: currentLocation!.longitude,
      cityId: selectedCityId!.id,
      categoryId: selectedCategoryId!.id,
      commercialNumber: commerceNumCtrl.text,
      commercialImage: MultipartFile.fromFileSync(imageCommerce!.path),
      branchesCount: branchesCountCtrl.text,
      description: descriptionCtrl.text,
      workFrom: workFromCtrl.text,
      workTo: workToCtrl.text
    );
  }

  void createAcc({required BuildContext context}) async {
    emit(CreateAccLoading());
    final result = await techRepository.createAcc(param: await getParam());
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(CreateAccFailure());
      },
      (message) {
        emit(GetDataSuccess());
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => const CustomFinishAccStoreDialog(),
        );
      },
    );
  }

  @override
  Future<void> close() {
    commerceNumCtrl.dispose();
    imageCommerceCtrl.dispose();
    storeNameCtrl.dispose();
    storeOwnerNameCtrl.dispose();
    storeLocationCtrl.dispose();
    phoneCtrl.dispose();
    branchesCountCtrl.dispose();
    descriptionCtrl.dispose();
    addressCtrl.dispose();
    workFromCtrl.dispose();
    workToCtrl.dispose();


    return super.close();
  }
}
