import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/features/common/static_pages/faq/presentation/views/widgets/custom_faq_list.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/widgets/custom_appbar.dart';
import '../../../../../../core/widgets/custom_error.dart';
import '../../../../../../core/widgets/custom_loading.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../cubit/faq_cubit.dart';

class FaqView extends StatefulWidget {
  const FaqView({super.key});

  @override
  State<FaqView> createState() => _FaqViewState();
}

class _FaqViewState extends State<FaqView> {
  @override
  void initState() {
    context.read<FaqCubit>().fetchFaqs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: CustomAppbar(
        title: LocaleKeys.faq.tr(),
      ),
      body: BlocBuilder<FaqCubit, FaqState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<FaqCubit>(context);
          return state is GetFaqLoading
              ? Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                  child: const CustomLoading(),
                )
              : state is GetFaqFailure
                  ? Padding(
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                      child: Center(
                        child: CustomError(
                          error: state.error,
                          retry: () {
                            cubit.fetchFaqs();
                          },
                        ),
                      ),
                    )
                  : CustomFaqList(
            cubit: cubit,
          );
        },
      ),
    );
  }
}
