import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/util/routing/routes.dart';
import '../../../features/common/auth/data/arguments/pin_code_argument.dart';
import '../../../features/common/auth/presentation/cubits/create_acc_cubit/create_acc_cubit.dart';
import '../../../features/common/auth/presentation/cubits/login_cubit/login_cubit.dart';
import '../../../features/common/auth/presentation/cubits/pin_code_cubit/pin_code_cubit.dart';
import '../../../features/common/auth/presentation/views/create_acc_view.dart';
import '../../../features/common/auth/presentation/views/login_view.dart';
import '../../../features/common/auth/presentation/views/pin_code_view.dart';
import '../../../features/common/bottom_nav/presentation/cubit/bottom_nav_cubit.dart';
import '../../../features/common/bottom_nav/presentation/views/bottom_nav_view.dart';
import '../../../features/common/intro/select_language/presentation/cubit/select_language_cubit.dart';
import '../../../features/common/intro/select_language/presentation/views/select_language_view.dart';
import '../../../features/common/intro/splash/presentation/cubit/splash_cubit.dart';
import '../../../features/common/intro/splash/presentation/views/splash_view.dart';
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
      case Routes.createAccView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CreateAccCubit>(),
            child: CreateAccView(),
          ),
        );
      case Routes.bottomNavView:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<BottomNavCubit>(),
            child: BottomNavView(),
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
