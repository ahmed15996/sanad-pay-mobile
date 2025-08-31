import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/constants/app_assets.dart';
import 'package:sanad/core/constants/app_colors.dart';
import 'package:sanad/core/di/di.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import 'package:sanad/core/widgets/custom_button.dart';
import 'package:sanad/features/common/profile/presentation/views/widgets/custom_logout_dialog.dart';
import 'package:sanad/features/common/profile/presentation/views/widgets/custom_setting_header_widget.dart';
import 'package:sanad/features/common/profile/presentation/views/widgets/custom_setting_list.dart';
import 'package:sanad/features/common/profile/presentation/views/widgets/custom_user_data_widget.dart';
import 'package:sanad/generated/locale_keys.g.dart';

import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/util/routing/routes.dart';
import '../../../../../core/widgets/custom_error.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../cubit/profile_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.profileScaffoldBackgroundColor,
      body: BlocProvider(
        create: (context) => getIt<ProfileCubit>()..fetchAppSettings(),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            final cubit = context.read<ProfileCubit>();
            if (state is GetDataLoading) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: const CustomLoading(),
              );
            } else {
              return state is GetDataFailure
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 20.h,
                      ),
                      child: Center(
                        child: CustomError(
                          error: state.error,
                          retry: () {
                            cubit.fetchAppSettings();
                          },
                        ),
                      ),
                    )
                  : SafeArea(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 20.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                if (cubit.userModel != null &&
                                    cubit.userModel!.type != "user") ...[
                                  Transform(
                                    alignment: Alignment.center,
                                    transform:
                                        TextDirection.ltr.name ==
                                            Directionality.of(context).name
                                        ? Matrix4.rotationY(3.1416)
                                        : Matrix4.rotationY(0),
                                    child: SvgPicture.asset(AppAssets.arrowBack)
                                        .onTap(
                                          function: () {
                                            context.pop();
                                          },
                                        ),
                                  ),
                                  widthSpace(8),
                                ],
                                Text(
                                  LocaleKeys.profile.tr(),
                                  style: AppTextStyles.textStyle18.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ],
                            ),
                            heightSpace(32.h),
                            CustomSettingHeaderWidget(cubit: cubit),
                            if (cubit.userModel != null &&
                                cubit.userModel!.type == "user") ...[
                              heightSpace(16.h),

                              CustomUserDataWidget(
                                userModel: cubit.userModel!,
                                isUser: cubit.userModel!.type == "user",
                              ),
                            ],
                            heightSpace(16.h),
                            CustomSettingList(
                              cubit: cubit,
                              isUser: cubit.userModel?.type == "user",
                            ),

                            heightSpace(18.h),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(16.w)
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 24.h,
                                horizontal: 8.w,
                              ),
                              child: CustomButton(
                                radius: 16,
                                text: cubit.token.isNotEmpty
                                    ? LocaleKeys.logout.tr()
                                    : LocaleKeys.login.tr(),
                                onPressed: () {
                                  if (cubit.token.isNotEmpty) {
                                    showDialog(
                                      context: context,
                                      builder: (_) => BlocProvider.value(
                                        value: cubit,
                                        child: const CustomLogoutDialog(),
                                      ),
                                    );
                                  } else {
                                    context.pushReplacementWithNamed(Routes.loginView);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
            }
          },
        ),
      ),
    );
  }
}
