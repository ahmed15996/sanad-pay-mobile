import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/features/common/bottom_nav/data/arguments/bottom_nav_argument.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/util/routing/routes.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../cubits/login_cubit/login_cubit.dart';
import '../widgets/login_widgets/custom_field_phone_widget.dart';
import '../widgets/login_widgets/custom_login_header_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) {
          final cubit = context.read<SignInCubit>();
          return Column(
            children: [
              Expanded(
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 24.w, top: 30.h),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        LocaleKeys.verifyYourPhone.tr(),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomLoginHeaderWidget(),
                        heightSpace(170),
                        CustomFieldPhoneWidget(
                          phoneController: cubit.phoneCtrl,
                          fillColor: AppColors.whiteColor,
                          borderColor: AppColors.transparentColor,
                        ),
                        heightSpace(67),
                        CustomButton(
                          onPressed: () {
                            if (cubit.phoneCtrl.validatePhoneField()) {
                              cubit.sendCode(context);
                            }
                          },
                          text: LocaleKeys.login.tr(),
                          isLoading: state is SignInLoading,
                        ),
                        heightSpace(18),
                        CustomButton(
                          text: LocaleKeys.registerAsStore.tr(),
                          onPressed: (){
                            context.pushWithNamed(Routes.createAccStoreView);
                          },
                          backgroundColor: AppColors.secondaryColor,
                        ),
                        heightSpace(18),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              context.pushReplacementWithNamed(Routes.bottomNavView,arguments: BottomNavArgument(isUser: true,index: 0));
                            },
                            child: Text(
                              LocaleKeys.continueAsGuest.tr(),
                              style: AppTextStyles.textStyle16.copyWith(
                                color: AppColors.darkSecondaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
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
