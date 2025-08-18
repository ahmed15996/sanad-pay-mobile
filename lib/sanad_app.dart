import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/app_constants.dart';
import 'core/constants/app_themes.dart';
import 'core/util/routing/app_router.dart';
import 'core/util/routing/routes.dart';

class SanadApp extends StatelessWidget {
  final AppRouter appRouter;

  const SanadApp({super.key, required this.appRouter});

  static GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<
      NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      designSize: const Size(375, 812),
      builder: (context, child) =>  MaterialApp(
        title: AppConstants.appName,
        navigatorKey: appNavigatorKey,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.splashView,
        theme: AppThemes.lightTheme,
      ),
    );
  }
}
