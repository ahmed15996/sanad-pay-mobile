import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/constants/app_assets.dart';
import 'package:sanad/core/constants/app_text_styles.dart';
import 'package:sanad/core/framework/spaces.dart';
import 'package:sanad/generated/locale_keys.g.dart';
import 'package:upgrader/upgrader.dart';
import '../cubit/splash_cubit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().handlePageNext(context);
  }

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      upgrader: Upgrader(
        languageCode: context.locale.languageCode,

        countryCode:
            WidgetsBinding.instance.platformDispatcher.locale.countryCode,
      ),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(flex: 3),
              Center(
                child: SvgPicture.asset(AppAssets.logo, width: 166.w, height: 202.h),
              ),
              heightSpace(63),
              Text(
                LocaleKeys.appName.tr().toUpperCase(),
                style: AppTextStyles.textStyle32,
              ),
              Text(LocaleKeys.appSlogan.tr(), style: AppTextStyles.textStyle16),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
