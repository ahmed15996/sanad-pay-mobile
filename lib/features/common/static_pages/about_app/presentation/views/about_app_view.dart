import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/widgets/custom_appbar.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/widgets/custom_error.dart';
import '../../../../../../core/widgets/custom_loading.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../cubit/about_app_cubit.dart';

class AboutAppView extends StatefulWidget {
  const AboutAppView({super.key});

  @override
  State<AboutAppView> createState() => _AboutAppViewState();
}

class _AboutAppViewState extends State<AboutAppView> {
  @override
  void initState() {
    context.read<AboutAppCubit>().fetchWhoAreWe();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: CustomAppbar(
        title: LocaleKeys.whoAreWe.tr(),
      ),
      body: BlocBuilder<AboutAppCubit, AboutAppState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<AboutAppCubit>(context);
          return state is GetWhoAreLoading
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
                  child: const CustomLoading(
                  ),
                )
              : state is GetWhoAreFailure
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 15.h),
                      child: Center(
                        child: CustomError(
                          error: state.error, retry: () {
                            cubit.fetchWhoAreWe();
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
                        data: cubit.whoAreData.toString(),

                      ),
                    );
        },
      ),
    );
  }
}
