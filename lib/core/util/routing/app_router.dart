import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/util/routing/routes.dart';
import 'package:sanad/features/common/auth/data/arguments/create_acc_argument.dart';
import 'package:sanad/features/common/profile/presentation/views/profile_view.dart';
import 'package:sanad/features/common/static_pages/about_app/presentation/cubit/about_app_cubit.dart';
import 'package:sanad/features/common/static_pages/about_app/presentation/views/about_app_view.dart';
import 'package:sanad/features/common/static_pages/faq/presentation/views/faq_view.dart';
import 'package:sanad/features/common/static_pages/privacy/presentation/cubit/privacy_cubit.dart';
import 'package:sanad/features/common/static_pages/privacy/presentation/views/privacy_view.dart';
import 'package:sanad/features/common/static_pages/terms_and_cond/presentation/cubit/terms_and_cond_cubit.dart';
import 'package:sanad/features/common/static_pages/terms_and_cond/presentation/views/terms_and_cond_view.dart';
import 'package:sanad/features/store/create_acc/presentation/cubit/create_acc_store_cubit.dart';
import 'package:sanad/features/store/create_acc/presentation/views/create_acc_store_view.dart';
import 'package:sanad/features/store/create_invoice/presentation/cubit/create_invoice_cubit.dart';
import 'package:sanad/features/store/create_invoice/presentation/views/create_invoice_view.dart';
import 'package:sanad/features/store/qr_scanner/presentation/cubit/qr_scanner_cubit.dart';
import 'package:sanad/features/store/qr_scanner/presentation/view/qr_scanner_view.dart';
import 'package:sanad/features/user/nearby/data/arguments/nearby_arguments.dart';
import 'package:sanad/features/user/nearby/presentation/views/cubit/nearby_cubit.dart';
import 'package:sanad/features/user/notification/presentation/cubit/notifications_cubit.dart';
import 'package:sanad/features/user/notification/presentation/views/notifications_view.dart';
import 'package:sanad/features/user/payments/data/arguments/payment_request_arguments.dart';
import 'package:sanad/features/user/payments/presentation/cubits/create_financing_cubit/create_financing_cubit.dart';
import 'package:sanad/features/user/payments/presentation/cubits/payments_cubit/payments_cubit.dart';
import 'package:sanad/features/user/payments/presentation/cubits/transaction_history_cubit/transaction_history_cubit.dart';
import 'package:sanad/features/user/payments/presentation/views/financing_status_view.dart';
import 'package:sanad/features/user/payments/presentation/views/payment_request_view.dart';
import 'package:sanad/features/user/payments/presentation/views/transaction_history_view.dart';
import 'package:sanad/features/user/store_details/presentation/cubit/store_details_cubit.dart';
import 'package:sanad/features/user/store_details/presentation/views/store_details_view.dart';
import '../../../features/common/auth/data/arguments/pin_code_argument.dart';
import '../../../features/common/auth/presentation/cubits/login_cubit/login_cubit.dart';
import '../../../features/common/auth/presentation/cubits/pin_code_cubit/pin_code_cubit.dart';
import '../../../features/common/auth/presentation/views/login_view.dart';
import '../../../features/common/auth/presentation/views/pin_code_view.dart';
import '../../../features/common/bottom_nav/data/arguments/bottom_nav_argument.dart';
import '../../../features/common/bottom_nav/presentation/cubit/bottom_nav_cubit.dart';
import '../../../features/common/bottom_nav/presentation/views/bottom_nav_view.dart';
import '../../../features/common/intro/select_language/presentation/cubit/select_language_cubit.dart';
import '../../../features/common/intro/select_language/presentation/views/select_language_view.dart';
import '../../../features/common/intro/splash/presentation/cubit/splash_cubit.dart';
import '../../../features/common/intro/splash/presentation/views/splash_view.dart';
import '../../../features/common/static_pages/faq/presentation/cubit/faq_cubit.dart';
import '../../../features/store/select_location/data/arguments/store_location_argument.dart';
import '../../../features/store/select_location/presentation/cubits/search_places_cubit/search_places_bloc.dart';
import '../../../features/store/select_location/presentation/cubits/select_location_cubit/select_location_cubit.dart';
import '../../../features/store/select_location/presentation/view/select_location_view.dart';
import '../../../features/user/create_acc_user/presentation/cubit/create_acc_user_cubit.dart';
import '../../../features/user/create_acc_user/presentation/views/create_acc_user_view.dart';
import '../../../features/user/nearby/presentation/views/nearby_view.dart';
import '../../../features/user/payments/data/arguments/financing_status_arguments.dart';
import '../../../features/user/payments/presentation/views/create_financing_request_view.dart';
import '../../../features/user/store_details/data/arguments/store_details_arguments.dart';
import '../../di/di.dart';
import '../../framework/navigation_animation.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SplashCubit>(),
            child: const SplashView(),
          ),
        );
      case Routes.selectLanguageView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SelectLanguageCubit>(),
            child: const SelectLanguageView(),
          ),
        );
      case Routes.loginView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignInCubit>(),
            child: const LoginView(),
          ),
        );
      case Routes.pinCodeView:
        final PinCodeArgument pinCodeArgument = arguments as PinCodeArgument;
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<PinCodeCubit>(),
            child: PinCodeView(argument: pinCodeArgument),
          ),
        );
      case Routes.notificationsView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<NotificationsCubit>()..fetchNotifications(),
            child: NotificationsView(),
          ),
        );
      case Routes.createAccUserView:
        var createAccArgument = arguments as CreateAccArgument;
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CreateAccUserCubit>()..fetchCities(),
            child: CreateAccUserView(createAccArgument: createAccArgument),
          ),
        );
      case Routes.bottomNavView:
        var bottomNavArgument = arguments as BottomNavArgument;
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<BottomNavCubit>(),
            child: BottomNavView(argument: arguments),
          ),
        );
      case Routes.createFinancingView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CreateFinancingCubit>(),
            child: CreateFinancingRequestView(),
          ),
        );
      case Routes.transactionHistoryView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<TransactionHistoryCubit>()..fetchTransactionHistory(),
            child: TransactionHistoryView(),
          ),
        );
      case Routes.createInvoiceView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CreateInvoiceCubit>()..fetchDashboard(),
            child: CreateInvoiceView(),
          ),
        );
      case Routes.qrScannerView:
        final updateBarcode =
            arguments as void Function(String barcode);
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<QrScannerCubit>(),
            child: QrScannerView(updateBarcode: updateBarcode),
          ),
        );
      case Routes.financingStatusView:
        var financingStatusArgument = arguments as FinancingStatusArguments;
        return _buildRoute(
          builder: (_) => FinancingStatusView(
            financingStatusArguments: financingStatusArgument,
          ),
        );
      case Routes.faqView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<FaqCubit>(),
            child: FaqView(),
          ),
        );
      case Routes.termsView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<TermsAndCondCubit>(),
            child: TermsAndCondView(),
          ),
        );
      case Routes.aboutUsView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AboutAppCubit>(),
            child: AboutAppView(),
          ),
        );
      case Routes.privacyView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<PrivacyCubit>(),
            child: PrivacyView(),
          ),
        );
      case Routes.storeDetailsView:
        var storeDetailsArgument = arguments as StoreDetailsArguments;
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<StoreDetailsCubit>()
                  ..fetchStoreDetails(storeDetailsArgument.storeId),
            child: StoreDetailsView(arguments: storeDetailsArgument),
          ),
        );
      case Routes.nearbyView:
        var nearbyArgument = arguments as NearbyArguments;
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
            getIt<NearbyCubit>()
              ..initSearchController(nearbyArgument.key),
            child: NearbyView(nearbyArguments: nearbyArgument,),
          ),
        );
      case Routes.profileView:
        return _buildRoute(builder: (_) => ProfileView());

      case Routes.createAccStoreView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CreateAccStoreCubit>()..fetchCities(),
            child: CreateAccStoreView(),
          ),
        );
      case Routes.paymentRequestView:
        PaymentRequestArguments paymentRequestArgument =
            arguments as PaymentRequestArguments;
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<PaymentsCubit>(),
            child: PaymentRequestView(
              paymentRequestArguments: paymentRequestArgument,
            ),
          ),
        );
      case Routes.selectLocationView:
        final onSelectLocation =
            arguments as void Function(StoreLocationArgument argument);
        return _buildRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<SearchPlacesBloc>()),
              BlocProvider(create: (context) => getIt<SelectLocationCubit>()),
            ],
            child: SelectLocationView(onSelectLocation: onSelectLocation),
          ),
        );

      default:
        return _buildRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  PageRoute _buildRoute({required WidgetBuilder builder}) {
    return Platform.isAndroid
        ? FadePageRoute(builder: builder)
        : MaterialPageRoute(builder: builder);
  }
}
