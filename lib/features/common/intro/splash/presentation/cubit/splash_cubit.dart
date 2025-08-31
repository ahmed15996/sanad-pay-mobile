import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/core/framework/app_firebase.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/features/common/bottom_nav/data/arguments/bottom_nav_argument.dart';
import '../../../../../../core/constants/app_cached.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../../core/framework/app_local_auth.dart';
import '../../../../../../core/local/shared_preferences/shared_pref_services.dart';
import '../../../../../../core/util/routing/routes.dart';

part 'splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  final SharedPrefServices appPref;
  final AppLocalAuthService appLocalAuth;
  final AppFirebase appFirebase;

  SplashCubit(
      this.appPref,
      this.appLocalAuth,
      this.appFirebase,
      ) : super(SplashInitial());

  void handlePageNext(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 6),
          () async {
        final isFirst = appPref.getData(key: AppCached.isFirst) ?? false;
        final isFaceIdNotify = appPref.getData(key: AppCached.isFaceIdNotify) ?? false;
        String token = appPref.getData(key: AppCached.token) ?? "";
        final role = appPref.getData(key: AppCached.role);
        if (token.isNotEmpty) {
          /// factory is class auth service
          if (isFaceIdNotify) {
            final isAuthenticated = await appLocalAuth.authenticateUser();
            if (isAuthenticated) {
              if (context.mounted) {
                checkRoleUser(
                  context: context,
                  role: role,
                );
              }
            }else{
              if (context.mounted) {
              context.pushAndRemoveUntilWithNamed(
                Routes.loginView,
              );
            }
            }
          } else {
            if (context.mounted) {
              checkRoleUser(
                context: context,
                role: role,
              );
            }
          }
        } else if (isFirst) {
          if (context.mounted) {
            context.pushAndRemoveUntilWithNamed(
              Routes.loginView,
            );
          }
        } else {
          if (context.mounted) {
            context.pushAndRemoveUntilWithNamed(
              Routes.selectLanguageView,
            );
          }
        }
        appFirebase.initializeFirebaseNotifications();
      },
    );
  }



  void checkRoleUser({required String role, required BuildContext context}) {
    if (role == "user") {
      if (context.mounted) {
        context.pushAndRemoveUntilWithNamed(
          Routes.bottomNavView,
          arguments: BottomNavArgument(index: 0,isUser: true),
        );
      }
    } else {
      if (context.mounted) {
        context.pushAndRemoveUntilWithNamed(
          Routes.bottomNavView,
          arguments: BottomNavArgument(index: 0,isUser: false),
        );
      }
    }
  }
}
