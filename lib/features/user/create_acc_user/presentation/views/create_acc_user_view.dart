import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/features/common/auth/data/arguments/create_acc_argument.dart';
import 'package:sanad/features/user/create_acc_user/presentation/views/widgets/custom_header_create_acc_widget.dart';
import 'package:sanad/features/user/create_acc_user/presentation/views/widgets/custom_input_create_acc_user_widget.dart';
import 'package:sanad/features/user/create_acc_user/presentation/views/widgets/custom_row_accept_terms_and_cond_widget.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_error.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../cubit/create_acc_user_cubit.dart';

class CreateAccUserView extends StatelessWidget {
  final CreateAccArgument createAccArgument;

  const CreateAccUserView({super.key, required this.createAccArgument});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 24.w, top: 30.h),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    LocaleKeys.createNewAccount.tr(),
                    style: AppTextStyles.textStyle32,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              child: BlocBuilder<CreateAccUserCubit, CreateAccUserState>(
                builder: (context, state) {
                  final cubit = BlocProvider.of<CreateAccUserCubit>(context);
                  return state is GetCitiesLoading
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 20.h,
                          ),
                          child: const CustomLoading(),
                        )
                      : state is GetCitiesFailure
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 20.h,
                          ),
                          child: CustomError(
                            error: state.error,
                            retry: () {
                              cubit.fetchCities();
                            },
                          ),
                        )
                      : SingleChildScrollView(
                          child: AbsorbPointer(
                            absorbing: state is CreateAccLoading ? true : false,
                            child: Column(
                              children: [
                                const CustomCreateAccHeaderWidget(),
                                heightSpace(34),
                                CustomInputCreateAccUserWidget(),
                                heightSpace(85),
                                CustomRowAcceptTermsAndCondWidget(),
                                heightSpace(67),
                                CustomButton(
                                  isDisabled:
                                      !(cubit.formKey.currentState
                                              ?.validate() ??
                                          false),
                                  onPressed: () {
                                    if (cubit.formKey.currentState!
                                        .validate()) {
                                      cubit.createAcc(
                                        context: context,
                                        phone: createAccArgument.phone,
                                      );
                                    }
                                  },
                                  isLoading: state is CreateAccLoading,
                                  text: LocaleKeys.createNewAccount
                                      .tr()
                                      .replaceAll("\n", " "),
                                ),
                                heightSpace(40),
                              ],
                            ),
                          ),
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
