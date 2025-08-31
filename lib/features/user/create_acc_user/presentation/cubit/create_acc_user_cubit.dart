import 'package:bloc/bloc.dart';

import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import '../../../../../core/framework/app_firebase.dart';
import '../../../../../core/util/routing/routes.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../../../common/auth/data/models/user_model.dart';
import '../../../../common/auth/data/repository/auth_repository/auth_repository.dart';
import '../../../../common/bottom_nav/data/arguments/bottom_nav_argument.dart';
import '../../data/models/city_model.dart';
import '../../data/params/create_acc_user_param.dart';
import '../../data/repository/create_acc_user_repository.dart';

part 'create_acc_user_state.dart';

@injectable
class CreateAccUserCubit extends Cubit<CreateAccUserState> {
  final CreateAccUserRepository repository;
  final AuthRepository authRepository;
  final AppFirebase appFirebase;

  CreateAccUserCubit(this.repository, this.authRepository, this.appFirebase)
    : super(CreateAccUserInitial());

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  CityModel? selectedCityId;

  void changeCityValue(CityModel value) {
    selectedCityId = value;
    emit(ChangeValueDropDown());
  }

  List<CityModel> cities = [];

  void fetchCities() async {
    emit(GetCitiesLoading());
    var result = await repository.fetchCities();
    result.fold(
      (failure) {
        emit(GetCitiesFailure(error: failure.message));
      },
      (cities) {
        this.cities = cities;
        emit(GetCitiesSuccess());
      },
    );
  }

  void createAcc({required String phone, required BuildContext context}) async {
    emit(CreateAccLoading());
    var result = await repository.createAcc(
      param: CreateAccUserParam(
        name: nameCtrl.text,
        email: emailCtrl.text,
        phone: phone,
        fcm: await appFirebase.getFirebaseToken() ?? "",
        cityId: selectedCityId!.id,
      ),
    );
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(CreateAccFailure());
      },
      (verifyCodeModel)  {
        saveDataUser(user: verifyCodeModel.user!, token: verifyCodeModel.token!, context: context);
      },
    );
  }

  void saveDataUser({
    required UserModel user,
    required String token,
    required BuildContext context,
  }) {
    emit(CreateAccLoading());
    var result = authRepository.saveUserData(
     userModel: user,
      token: token,
    );
    result.fold(
          (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(SaveDataFailure());
      },
          (r) {
        context.pushAndRemoveUntilWithNamed(
          Routes.bottomNavView,
          arguments: BottomNavArgument(isUser: true),
        );
        emit(GetCitiesSuccess());
      },
    );
  }

  @override
  Future<void> close() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    return super.close();
  }
}
