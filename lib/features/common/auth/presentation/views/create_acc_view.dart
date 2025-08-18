import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/routing/routes.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../cubits/create_acc_cubit/create_acc_cubit.dart';
import '../widgets/create_acc_widgets/custom_header_create_acc_widget.dart';
import '../widgets/create_acc_widgets/custom_input_create_acc_widget.dart';
import '../widgets/create_acc_widgets/custom_row_accept_terms_and_cond_widget.dart';

class CreateAccView extends StatelessWidget {
  const CreateAccView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<CreateAccCubit, CreateAccState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<CreateAccCubit>(context);
          return Column(
            children: [
              Expanded(
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 24.w, top: 40.h),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        "Create New\nAccount",
                        style: AppTextStyles.textStyle32,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 20.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24.r),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: AbsorbPointer(
                      absorbing: state is CreateAccLoading ? true : false,
                      child: Column(
                        children: [
                          const CustomCreateAccHeaderWidget(),
                          heightSpace(34),
                          CustomInputCreateAccWidget(),
                          heightSpace(85),
                          CustomRowAcceptTermsAndCondWidget(),
                          heightSpace(67),
                          CustomButton(
                            onPressed: () {
                              // bool? isFormValidated = cubit.formKey.currentState
                              //     ?.validate();
                              // bool? isPhoneValidated = cubit.phoneCtrl
                              //     .validatePhoneField();
                              // if (isFormValidated! && isPhoneValidated) {
                              //   if (cubit.isTermsAgree) {
                              //     cubit.createAcc(context: context);
                              //   } else {
                              //     context.pushWithNamed(
                              //       Routes.termsView,
                              //       arguments: TermsArguments(
                              //         isFromSettings: false,
                              //         isTermsAgreed: (newValue) {
                              //           cubit.changeAgreeTerms(newValue);
                              //         },
                              //       ),
                              //     );
                              //   }
                              // }
                              context.pushWithNamed(Routes.bottomNavView);
                            },
                            isLoading: state is CreateAccLoading,
                            text: "Create New Account",
                          ),
                          heightSpace(40),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
