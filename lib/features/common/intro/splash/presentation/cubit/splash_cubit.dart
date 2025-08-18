import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import '../../../../../../core/constants/app_cached.dart';
import '../../../../../../core/local/shared_preferences/shared_pref_services.dart';
import '../../../../../../core/util/routing/routes.dart';
part 'splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  final SharedPrefServices appPref;
  SplashCubit(this.appPref) : super(SplashInitial());

  void handlePageNext(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      bool isFirst = appPref.getData(key: AppCached.isFirst) ?? false;
      String token = appPref.getData(key: AppCached.token) ?? "";

      if (!isFirst) {
        if (context.mounted) {
          context.pushAndRemoveUntilWithNamed(Routes.selectLanguageView);
        }
      } else {
        if (token.isNotEmpty) {
          if (context.mounted) {
            context.pushAndRemoveUntilWithNamed(Routes.bottomNavView);
          }
        } else {
          if (context.mounted) {
            context.pushAndRemoveUntilWithNamed(Routes.loginView);
          }
        }
      }
    });
  }
}
