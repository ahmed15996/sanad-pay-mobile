import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/app_colors.dart';
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
                      child: Html(
                        data: cubit.privacyData.toString(),

                      ),
                    );
        },
      ),
    );
  }
}
