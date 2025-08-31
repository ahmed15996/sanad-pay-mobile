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
import '../cubit/terms_and_cond_cubit.dart';

class TermsAndCondView extends StatefulWidget {
  const TermsAndCondView({super.key});

  @override
  State<TermsAndCondView> createState() => _TermsAndCondViewState();
}

class _TermsAndCondViewState extends State<TermsAndCondView> {
  @override
  void initState() {
    context.read<TermsAndCondCubit>().fetchTerms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: CustomAppbar(title: LocaleKeys.termsAndConditions.tr()),
      body: BlocBuilder<TermsAndCondCubit, TermsAndCondState>(
        builder: (context, state) {
          final cubit = context.read<TermsAndCondCubit>();
          return state is GetTermsLoading
              ? Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 15.h,
                  ),
                  child: const CustomLoading(),
                )
              : state is GetTermsFailure
              ? Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 15.h,
                  ),
                  child: Center(
                    child: CustomError(
                      error: state.error,
                      retry: () {
                        cubit.fetchTerms();
                      },
                    ),
                  ),
                )
              : SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 15.h,
                  ),
                  child: Html(data: cubit.termsData.toString()),
                );
        },
      ),
    );
  }
}
