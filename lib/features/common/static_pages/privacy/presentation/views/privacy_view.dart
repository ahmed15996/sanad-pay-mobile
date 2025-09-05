import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/widgets/custom_appbar.dart';
import '../../../../../../core/widgets/custom_error.dart';
import '../../../../../../core/widgets/custom_loading.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../cubit/privacy_cubit.dart';

class PrivacyView extends StatefulWidget {
  const PrivacyView({super.key});

  @override
  State<PrivacyView> createState() => _PrivacyViewState();
}

class _PrivacyViewState extends State<PrivacyView> {
  @override
  void initState() {
    context.read<PrivacyCubit>().fetchPrivacy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: CustomAppbar(
        title: LocaleKeys.privacyAndPolicy.tr(),
        systemUiOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: BlocBuilder<PrivacyCubit, PrivacyState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<PrivacyCubit>(context);
          return state is GetPrivacyLoading
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
                  child: const CustomLoading(
                  ),
                )
              : state is GetPrivacyFailure
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 15.h),
                      child: Center(
                        child: CustomError(
                          error: state.error,
                          retry: () {
                            cubit.fetchPrivacy();
                          },
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 15.h,
                      ),
                      child: HtmlWidget(
                        cubit.privacyData.toString(),
                        textStyle: AppTextStyles.textStyle16.copyWith(
                          color: AppColors.blackColor),

                      ),
                    );
        },
      ),
    );
  }
}
