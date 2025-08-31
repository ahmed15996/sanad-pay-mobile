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
import 'package:sanad/core/framework/app_local_auth.dart' as _i806;
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
import 'package:sanad/features/common/profile/data/data_source/local/profile_local_data_source.dart'
    as _i523;
import 'package:sanad/features/common/profile/data/data_source/local/profile_local_data_source_impl.dart'
    as _i651;
import 'package:sanad/features/common/profile/data/data_source/remote/profile_remote_data_source.dart'
    as _i657;
import 'package:sanad/features/common/profile/data/data_source/remote/profile_remote_data_source_impl.dart'
    as _i888;
import 'package:sanad/features/common/profile/data/repository/profile_repository.dart'
    as _i849;
import 'package:sanad/features/common/profile/data/repository/profile_repository_impl.dart'
    as _i909;
import 'package:sanad/features/common/profile/presentation/cubit/profile_cubit.dart'
    as _i728;
import 'package:sanad/features/common/static_pages/about_app/presentation/cubit/about_app_cubit.dart'
    as _i228;
import 'package:sanad/features/common/static_pages/data/data_source/remote/static_pages_remote_data_source.dart'
    as _i774;
import 'package:sanad/features/common/static_pages/data/data_source/remote/static_pages_remote_data_source_impl.dart'
    as _i196;
import 'package:sanad/features/common/static_pages/data/repository/static_pages_repository.dart'
    as _i949;
import 'package:sanad/features/common/static_pages/data/repository/static_pages_repository_impl.dart'
    as _i878;
import 'package:sanad/features/common/static_pages/faq/presentation/cubit/faq_cubit.dart'
    as _i851;
import 'package:sanad/features/common/static_pages/privacy/presentation/cubit/privacy_cubit.dart'
    as _i666;
import 'package:sanad/features/common/static_pages/terms_and_cond/presentation/cubit/terms_and_cond_cubit.dart'
    as _i1067;
import 'package:sanad/features/store/create_acc/data/data_source/remote/create_acc_store_remote_data_source.dart'
    as _i519;
import 'package:sanad/features/store/create_acc/data/data_source/remote/create_acc_store_remote_data_source_impl.dart'
    as _i381;
import 'package:sanad/features/store/create_acc/data/repository/create_acc_store_repository.dart'
    as _i84;
import 'package:sanad/features/store/create_acc/data/repository/create_acc_store_repository_impl.dart'
    as _i226;
import 'package:sanad/features/store/create_acc/presentation/cubit/create_acc_store_cubit.dart'
    as _i453;
import 'package:sanad/features/store/create_invoice/data/data_source/remote/create_invoice_remote_data_source.dart'
    as _i957;
import 'package:sanad/features/store/create_invoice/data/data_source/remote/create_invoice_remote_data_source_impl.dart'
    as _i597;
import 'package:sanad/features/store/create_invoice/data/repository/create_invoice_repository.dart'
    as _i232;
import 'package:sanad/features/store/create_invoice/data/repository/create_invoice_repository_impl.dart'
    as _i153;
import 'package:sanad/features/store/create_invoice/presentation/cubit/create_invoice_cubit.dart'
    as _i579;
import 'package:sanad/features/store/home/data/data_source/remote/home_store_remote_data_source.dart'
    as _i908;
import 'package:sanad/features/store/home/data/data_source/remote/home_user_remote_data_source_impl.dart'
    as _i71;
import 'package:sanad/features/store/home/data/repository/home_store_repository.dart'
    as _i433;
import 'package:sanad/features/store/home/data/repository/home_store_repository_impl.dart'
    as _i770;
import 'package:sanad/features/store/home/presentation/cubit/home_store_cubit.dart'
    as _i544;
import 'package:sanad/features/store/qr_scanner/presentation/cubit/qr_scanner_cubit.dart'
    as _i779;
import 'package:sanad/features/store/sales/data/data_source/remote/sales_remote_data_source.dart'
    as _i767;
import 'package:sanad/features/store/sales/data/data_source/remote/sales_remote_data_source_impl.dart'
    as _i996;
import 'package:sanad/features/store/sales/data/repository/sales_repository.dart'
    as _i285;
import 'package:sanad/features/store/sales/data/repository/sales_repository_impl.dart'
    as _i617;
import 'package:sanad/features/store/sales/presentation/cubit/sales_cubit.dart'
    as _i362;
import 'package:sanad/features/store/select_location/presentation/cubits/search_places_cubit/search_places_bloc.dart'
    as _i1064;
import 'package:sanad/features/store/select_location/presentation/cubits/select_location_cubit/select_location_cubit.dart'
    as _i546;
import 'package:sanad/features/user/create_acc_user/data/data_source/remote/create_acc_user_remote_data_source.dart'
    as _i119;
import 'package:sanad/features/user/create_acc_user/data/data_source/remote/create_acc_user_remote_data_source_impl.dart'
    as _i300;
import 'package:sanad/features/user/create_acc_user/data/repository/create_acc_user_repository.dart'
    as _i580;
import 'package:sanad/features/user/create_acc_user/data/repository/create_acc_user_repository_impl.dart'
    as _i685;
import 'package:sanad/features/user/create_acc_user/presentation/cubit/create_acc_user_cubit.dart'
    as _i841;
import 'package:sanad/features/user/home/data/data_source/remote/home_user_remote_data_source.dart'
    as _i678;
import 'package:sanad/features/user/home/data/data_source/remote/home_user_remote_data_source_impl.dart'
    as _i448;
import 'package:sanad/features/user/home/data/repository/home_user_repository.dart'
    as _i400;
import 'package:sanad/features/user/home/data/repository/home_user_repository_impl.dart'
    as _i849;
import 'package:sanad/features/user/home/presentation/cubit/home_user_cubit.dart'
    as _i120;
import 'package:sanad/features/user/nearby/data/data_source/remote/nearby_remote_data_source.dart'
    as _i120;
import 'package:sanad/features/user/nearby/data/data_source/remote/nearby_remote_data_source_impl.dart'
    as _i782;
import 'package:sanad/features/user/nearby/data/repository/nearby_repository.dart'
    as _i95;
import 'package:sanad/features/user/nearby/data/repository/nearby_repository_impl.dart'
    as _i819;
import 'package:sanad/features/user/nearby/presentation/views/cubit/nearby_cubit.dart'
    as _i322;
import 'package:sanad/features/user/notification/data/data_source/remote/notifications_remote_data_source.dart'
    as _i195;
import 'package:sanad/features/user/notification/data/data_source/remote/notifications_remote_data_source_impl.dart'
    as _i901;
import 'package:sanad/features/user/notification/data/repository/notifications_repository.dart'
    as _i616;
import 'package:sanad/features/user/notification/data/repository/notifications_repository_impl.dart'
    as _i646;
import 'package:sanad/features/user/notification/presentation/cubit/notifications_cubit.dart'
    as _i791;
import 'package:sanad/features/user/offers/data/data_source/remote/offers_remote_data_source.dart'
    as _i250;
import 'package:sanad/features/user/offers/data/data_source/remote/offers_remote_data_source_impl.dart'
    as _i831;
import 'package:sanad/features/user/offers/data/repository/offers_repository.dart'
    as _i906;
import 'package:sanad/features/user/offers/data/repository/offers_repository_impl.dart'
    as _i272;
import 'package:sanad/features/user/offers/presentation/cubit/offers_cubit.dart'
    as _i55;
import 'package:sanad/features/user/payments/data/data_source/remote/payments_remote_data_source.dart'
    as _i373;
import 'package:sanad/features/user/payments/data/data_source/remote/payments_remote_data_source_impl.dart'
    as _i1044;
import 'package:sanad/features/user/payments/data/repository/payments_repository.dart'
    as _i931;
import 'package:sanad/features/user/payments/data/repository/payments_repository_impl.dart'
    as _i140;
import 'package:sanad/features/user/payments/presentation/cubits/create_financing_cubit/create_financing_cubit.dart'
    as _i8;
import 'package:sanad/features/user/payments/presentation/cubits/payments_cubit/payments_cubit.dart'
    as _i623;
import 'package:sanad/features/user/payments/presentation/cubits/transaction_history_cubit/transaction_history_cubit.dart'
    as _i10;
import 'package:sanad/features/user/store_details/data/data_source/remote/store_details_remote_data_source.dart'
    as _i416;
import 'package:sanad/features/user/store_details/data/data_source/remote/store_details_remote_data_source_impl.dart'
    as _i141;
import 'package:sanad/features/user/store_details/data/repository/store_details_repository.dart'
    as _i118;
import 'package:sanad/features/user/store_details/data/repository/store_details_repository_impl.dart'
    as _i745;
import 'package:sanad/features/user/store_details/presentation/cubit/store_details_cubit.dart'
    as _i944;
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
    gh.factory<_i779.QrScannerCubit>(() => _i779.QrScannerCubit());
    gh.factory<_i1064.SearchPlacesBloc>(() => _i1064.SearchPlacesBloc());
    gh.factory<_i546.SelectLocationCubit>(() => _i546.SelectLocationCubit());
    gh.lazySingleton<_i759.DioLogInterceptor>(() => _i759.DioLogInterceptor());
    gh.lazySingleton<_i806.AppLocalAuthService>(
      () => _i806.AppLocalAuthService(),
    );
    gh.factory<_i218.AppFirebase>(
      () => _i218.AppFirebase(appNotifications: gh<_i24.AppNotifications>()),
    );
    gh.lazySingleton<_i657.SharedPrefServices>(
      () => _i657.SharedPrefServices(
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.factory<_i148.SelectLanguageCubit>(
      () => _i148.SelectLanguageCubit(gh<_i657.SharedPrefServices>()),
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
    gh.factory<_i519.CreateAccStoreRemoteDataSource>(
      () => _i381.CreateAccStoreRemoteDataSourceImpl(
        apiConsumer: gh<_i342.ApiConsumer>(),
      ),
    );
    gh.factory<_i678.HomeUserRemoteDataSource>(
      () => _i448.HomeUserRemoteDataSourceImpl(
        apiConsumer: gh<_i342.ApiConsumer>(),
      ),
    );
    gh.factory<_i908.HomeStoreRemoteDataSource>(
      () => _i71.HomeStoreRemoteDataSourceImpl(
        apiConsumer: gh<_i342.ApiConsumer>(),
      ),
    );
    gh.factory<_i657.ProfileRemoteDataSource>(
      () => _i888.ProfileRemoteDataSourceImpl(
        apiConsumer: gh<_i342.ApiConsumer>(),
      ),
    );
    gh.factory<_i281.AuthRemoteDataSource>(
      () =>
          _i476.AuthRemoteDataSourceImpl(apiConsumer: gh<_i342.ApiConsumer>()),
    );
    gh.factory<_i120.NearbyRemoteDataSource>(
      () => _i782.NearbyRemoteDataSourceImpl(
        apiConsumer: gh<_i342.ApiConsumer>(),
      ),
    );
    gh.factory<_i119.CreateAccUserRemoteDataSource>(
      () => _i300.CreateAccUserRemoteDataSourceImpl(
        apiConsumer: gh<_i342.ApiConsumer>(),
      ),
    );
    gh.factory<_i962.AuthLocalDataSource>(
      () => _i248.AuthLocalDataSourceImpl(
        appPref: gh<_i657.SharedPrefServices>(),
      ),
    );
    gh.factory<_i580.CreateAccUserRepository>(
      () => _i685.CreateAccUserRepositoryImpl(
        createAccUserRemoteDataSource:
            gh<_i119.CreateAccUserRemoteDataSource>(),
      ),
    );
    gh.factory<_i555.SplashCubit>(
      () => _i555.SplashCubit(
        gh<_i657.SharedPrefServices>(),
        gh<_i806.AppLocalAuthService>(),
        gh<_i218.AppFirebase>(),
      ),
    );
    gh.factory<_i957.CreateInvoiceRemoteDataSource>(
      () => _i597.CreateInvoiceRemoteDataSourceImpl(
        apiConsumer: gh<_i342.ApiConsumer>(),
      ),
    );
    gh.factory<_i373.PaymentsRemoteDataSource>(
      () => _i1044.PaymentsRemoteDataSourceImpl(
        apiConsumer: gh<_i342.ApiConsumer>(),
      ),
    );
    gh.factory<_i523.ProfileLocalDataSource>(
      () => _i651.ProfileLocalDataSourceImpl(
        appPref: gh<_i657.SharedPrefServices>(),
      ),
    );
    gh.factory<_i849.ProfileRepository>(
      () => _i909.ProfileRepositoryImpl(
        profileRemoteDataSource: gh<_i657.ProfileRemoteDataSource>(),
        profileLocalDataSource: gh<_i523.ProfileLocalDataSource>(),
      ),
    );
    gh.factory<_i976.AuthRepository>(
      () => _i982.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i281.AuthRemoteDataSource>(),
        authLocalDataSource: gh<_i962.AuthLocalDataSource>(),
      ),
    );
    gh.factory<_i250.OffersRemoteDataSource>(
      () => _i831.OffersRemoteDataSourceImpl(
        apiConsumer: gh<_i342.ApiConsumer>(),
      ),
    );
    gh.factory<_i400.HomeUserRepository>(
      () => _i849.HomeUserRepositoryImpl(
        homeUserRemoteDataSource: gh<_i678.HomeUserRemoteDataSource>(),
      ),
    );
    gh.factory<_i120.HomeUserCubit>(
      () => _i120.HomeUserCubit(
        gh<_i400.HomeUserRepository>(),
        gh<_i657.SharedPrefServices>(),
      ),
    );
    gh.factory<_i931.PaymentsRepository>(
      () => _i140.PaymentsRepositoryImpl(
        paymentsRemoteDataSource: gh<_i373.PaymentsRemoteDataSource>(),
      ),
    );
    gh.factory<_i841.CreateAccUserCubit>(
      () => _i841.CreateAccUserCubit(
        gh<_i580.CreateAccUserRepository>(),
        gh<_i976.AuthRepository>(),
        gh<_i218.AppFirebase>(),
      ),
    );
    gh.factory<_i8.CreateFinancingCubit>(
      () => _i8.CreateFinancingCubit(gh<_i931.PaymentsRepository>()),
    );
    gh.factory<_i623.PaymentsCubit>(
      () => _i623.PaymentsCubit(gh<_i931.PaymentsRepository>()),
    );
    gh.factory<_i10.TransactionHistoryCubit>(
      () => _i10.TransactionHistoryCubit(gh<_i931.PaymentsRepository>()),
    );
    gh.factory<_i84.CreateAccStoreRepository>(
      () => _i226.CreateAccSellerRepositoryImpl(
        createAccSellerRemoteDataSource:
            gh<_i519.CreateAccStoreRemoteDataSource>(),
      ),
    );
    gh.factory<_i232.CreateInvoiceRepository>(
      () => _i153.CreateInvoiceRepositoryImpl(
        createInvoiceRemoteDataSource:
            gh<_i957.CreateInvoiceRemoteDataSource>(),
      ),
    );
    gh.factory<_i433.HomeStoreRepository>(
      () => _i770.HomeStoreRepositoryImpl(
        homeStoreRemoteDataSource: gh<_i908.HomeStoreRemoteDataSource>(),
      ),
    );
    gh.factory<_i95.NearbyRepository>(
      () => _i819.NearbyRepositoryImpl(
        searchRemoteDataSource: gh<_i120.NearbyRemoteDataSource>(),
      ),
    );
    gh.factory<_i416.StoreDetailsRemoteDataSource>(
      () => _i141.StoreDetailsRemoteDataSourceImpl(
        apiConsumer: gh<_i342.ApiConsumer>(),
      ),
    );
    gh.factory<_i453.CreateAccStoreCubit>(
      () => _i453.CreateAccStoreCubit(
        gh<_i580.CreateAccUserRepository>(),
        gh<_i84.CreateAccStoreRepository>(),
        gh<_i218.AppFirebase>(),
      ),
    );
    gh.factory<_i728.ProfileCubit>(
      () => _i728.ProfileCubit(
        gh<_i657.SharedPrefServices>(),
        gh<_i849.ProfileRepository>(),
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
    gh.factory<_i767.SalesRemoteDataSource>(
      () =>
          _i996.SalesRemoteDataSourceImpl(apiConsumer: gh<_i342.ApiConsumer>()),
    );
    gh.factory<_i322.NearbyCubit>(
      () => _i322.NearbyCubit(gh<_i95.NearbyRepository>()),
    );
    gh.factory<_i774.StaticPagesRemoteDataSource>(
      () => _i196.StaticPagesRemoteDataSourceImpl(
        apiConsumer: gh<_i342.ApiConsumer>(),
      ),
    );
    gh.factory<_i195.NotificationsRemoteDataSource>(
      () => _i901.NotificationsRemoteDataSourceImpl(
        apiConsumer: gh<_i342.ApiConsumer>(),
      ),
    );
    gh.factory<_i93.BottomNavCubit>(
      () => _i93.BottomNavCubit(
        gh<_i657.SharedPrefServices>(),
        gh<_i400.HomeUserRepository>(),
      ),
    );
    gh.factory<_i906.OffersRepository>(
      () => _i272.OffersRepositoryImpl(
        offersRemoteDataSource: gh<_i250.OffersRemoteDataSource>(),
      ),
    );
    gh.factory<_i118.StoreDetailsRepository>(
      () => _i745.StoreDetailsRepositoryImpl(
        storeDetailsRemoteDataSource: gh<_i416.StoreDetailsRemoteDataSource>(),
      ),
    );
    gh.factory<_i616.NotificationsRepository>(
      () => _i646.NotificationsRepositoryImpl(
        notificationsRemoteDataSource:
            gh<_i195.NotificationsRemoteDataSource>(),
      ),
    );
    gh.factory<_i579.CreateInvoiceCubit>(
      () => _i579.CreateInvoiceCubit(
        gh<_i232.CreateInvoiceRepository>(),
        gh<_i433.HomeStoreRepository>(),
        gh<_i400.HomeUserRepository>(),
        gh<_i849.ProfileRepository>(),
      ),
    );
    gh.factory<_i55.OffersCubit>(
      () => _i55.OffersCubit(gh<_i906.OffersRepository>()),
    );
    gh.factory<_i544.HomeStoreCubit>(
      () => _i544.HomeStoreCubit(
        gh<_i433.HomeStoreRepository>(),
        gh<_i849.ProfileRepository>(),
        gh<_i400.HomeUserRepository>(),
        gh<_i657.SharedPrefServices>(),
      ),
    );
    gh.factory<_i285.SalesRepository>(
      () => _i617.SalesRepositoryImpl(
        salesRemoteDataSource: gh<_i767.SalesRemoteDataSource>(),
      ),
    );
    gh.factory<_i949.StaticPagesRepository>(
      () => _i878.StaticPagesRepositoryImpl(
        staticPagesRemoteDataSource: gh<_i774.StaticPagesRemoteDataSource>(),
      ),
    );
    gh.factory<_i944.StoreDetailsCubit>(
      () => _i944.StoreDetailsCubit(gh<_i118.StoreDetailsRepository>()),
    );
    gh.factory<_i228.AboutAppCubit>(
      () => _i228.AboutAppCubit(gh<_i949.StaticPagesRepository>()),
    );
    gh.factory<_i851.FaqCubit>(
      () => _i851.FaqCubit(gh<_i949.StaticPagesRepository>()),
    );
    gh.factory<_i666.PrivacyCubit>(
      () => _i666.PrivacyCubit(gh<_i949.StaticPagesRepository>()),
    );
    gh.factory<_i1067.TermsAndCondCubit>(
      () => _i1067.TermsAndCondCubit(gh<_i949.StaticPagesRepository>()),
    );
    gh.factory<_i791.NotificationsCubit>(
      () => _i791.NotificationsCubit(gh<_i616.NotificationsRepository>()),
    );
    gh.factory<_i362.SalesCubit>(
      () => _i362.SalesCubit(
        gh<_i285.SalesRepository>(),
        gh<_i433.HomeStoreRepository>(),
        gh<_i400.HomeUserRepository>(),
      ),
    );
    return this;
  }
}

class _$InjectionModule extends _i364.InjectionModule {}
