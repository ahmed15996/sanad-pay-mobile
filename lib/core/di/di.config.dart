// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;
import 'package:sanad/core/api/api_consumer.dart' as _i342;
import 'package:sanad/core/api/dio_consumer.dart' as _i831;
import 'package:sanad/core/api/dio_log_interceptor.dart' as _i759;
import 'package:sanad/core/api/network_info.dart' as _i916;
import 'package:sanad/core/di/di_module.dart' as _i364;
import 'package:sanad/core/framework/app_firebase.dart' as _i218;
import 'package:sanad/core/framework/app_notification.dart' as _i24;
import 'package:sanad/core/framework/device_info.dart' as _i903;
import 'package:sanad/core/helpers/image_helper.dart' as _i87;
import 'package:sanad/core/local/shared_preferences/shared_pref_services.dart'
    as _i657;
import 'package:sanad/features/common/auth/data/data_source/local/auth_local_data_source.dart'
    as _i962;
import 'package:sanad/features/common/auth/data/data_source/local/auth_local_data_source_impl.dart'
    as _i248;
import 'package:sanad/features/common/auth/data/data_source/remote/auth_remote_data_source/auth_remote_data_source.dart'
    as _i281;
import 'package:sanad/features/common/auth/data/data_source/remote/auth_remote_data_source/auth_remote_data_source_impl.dart'
    as _i476;
import 'package:sanad/features/common/auth/data/repository/auth_repository/auth_repository.dart'
    as _i976;
import 'package:sanad/features/common/auth/data/repository/auth_repository/auth_repository_impl.dart'
    as _i982;
import 'package:sanad/features/common/auth/presentation/cubits/create_acc_cubit/create_acc_cubit.dart'
    as _i216;
import 'package:sanad/features/common/auth/presentation/cubits/login_cubit/login_cubit.dart'
    as _i1036;
import 'package:sanad/features/common/auth/presentation/cubits/pin_code_cubit/pin_code_cubit.dart'
    as _i881;
import 'package:sanad/features/common/bottom_nav/presentation/cubit/bottom_nav_cubit.dart'
    as _i93;
import 'package:sanad/features/common/intro/select_language/presentation/cubit/select_language_cubit.dart'
    as _i148;
import 'package:sanad/features/common/intro/splash/presentation/cubit/splash_cubit.dart'
    as _i555;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectionModule = _$InjectionModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.factory<_i161.InternetConnection>(
      () => injectionModule.internetConnection,
    );
    gh.factory<_i361.Dio>(() => injectionModule.dioClient);
    gh.factory<_i183.ImagePicker>(() => injectionModule.imagePicker);
    gh.factory<_i24.AppNotifications>(() => _i24.AppNotifications());
    gh.factory<_i903.DeviceInfo>(() => _i903.DeviceInfo());
    gh.factory<_i87.DocumentHelper>(() => _i87.DocumentHelper());
    gh.lazySingleton<_i759.DioLogInterceptor>(() => _i759.DioLogInterceptor());
    gh.factory<_i218.AppFirebase>(
      () => _i218.AppFirebase(appNotifications: gh<_i24.AppNotifications>()),
    );
    gh.lazySingleton<_i657.SharedPrefServices>(
      () => _i657.SharedPrefServices(
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.factory<_i93.BottomNavCubit>(
      () => _i93.BottomNavCubit(gh<_i657.SharedPrefServices>()),
    );
    gh.factory<_i148.SelectLanguageCubit>(
      () => _i148.SelectLanguageCubit(gh<_i657.SharedPrefServices>()),
    );
    gh.factory<_i555.SplashCubit>(
      () => _i555.SplashCubit(gh<_i657.SharedPrefServices>()),
    );
    gh.factory<_i916.NetworkInfo>(
      () => _i916.NetworkInfoImpl(
        internetConnection: gh<_i161.InternetConnection>(),
      ),
    );
    gh.lazySingleton<_i342.ApiConsumer>(
      () => _i831.DioApiConsumer(
        networkInfo: gh<_i916.NetworkInfo>(),
        dioClient: gh<_i361.Dio>(),
        appPref: gh<_i657.SharedPrefServices>(),
      ),
    );
    gh.factory<_i281.AuthRemoteDataSource>(
      () =>
          _i476.AuthRemoteDataSourceImpl(apiConsumer: gh<_i342.ApiConsumer>()),
    );
    gh.factory<_i962.AuthLocalDataSource>(
      () => _i248.AuthLocalDataSourceImpl(
        appPref: gh<_i657.SharedPrefServices>(),
      ),
    );
    gh.factory<_i976.AuthRepository>(
      () => _i982.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i281.AuthRemoteDataSource>(),
        authLocalDataSource: gh<_i962.AuthLocalDataSource>(),
      ),
    );
    gh.factory<_i1036.SignInCubit>(
      () => _i1036.SignInCubit(
        gh<_i976.AuthRepository>(),
        gh<_i218.AppFirebase>(),
      ),
    );
    gh.factory<_i881.PinCodeCubit>(
      () => _i881.PinCodeCubit(
        gh<_i976.AuthRepository>(),
        gh<_i218.AppFirebase>(),
      ),
    );
    gh.factory<_i216.CreateAccCubit>(
      () => _i216.CreateAccCubit(
        gh<_i976.AuthRepository>(),
        gh<_i218.AppFirebase>(),
      ),
    );
    return this;
  }
}

class _$InjectionModule extends _i364.InjectionModule {}
