import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/widgets/custom_button.dart';
import 'package:sanad/features/common/profile/presentation/views/widgets/custom_logout_dialog.dart';
import 'package:sanad/features/common/profile/presentation/views/widgets/custom_setting_header_widget.dart';
import 'package:sanad/features/common/profile/presentation/views/widgets/custom_setting_list.dart';
import 'package:sanad/features/common/profile/presentation/views/widgets/custom_user_data_widget.dart';

import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/util/routing/routes.dart';
import '../../../../../core/widgets/custom_error.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../cubit/profile_cubit.dart';

class SettingView extends StatefulWidget {
  final bool isUser;

  const SettingView({super.key, required this.isUser});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<ProfileCubit>(context).fetchSocialMedia();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<ProfileCubit>(context);
        if (state is GetDataLoading) {
          return Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child:const CustomLoading(),
          );
        } else {
          return state is GetDataFailure
              ? Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 16.w, vertical: 20.h),
            child: Center(
              child: CustomError(
                error: state.error,
                retry: () {
                  cubit.fetchSocialMedia();
                },
              ),
            ),
          )
              : SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: 16.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Profile",style: AppTextStyles.textStyle32,),
                heightSpace(24.h),
                CustomSettingHeaderWidget(
                  cubit: cubit,
                ),
                heightSpace(24.h),
                CustomUserDataWidget(userModel: cubit.userModel!, isUser: true),
                heightSpace(24.h),
                CustomSettingList(
                  cubit: cubit,
                  isUser: widget.isUser,
                ),

                heightSpace(18.h),
                Container(
                  padding: EdgeInsets.all(24),
                  child: CustomButton(
                    text: cubit.token!.isNotEmpty ? "Logout" : "Login",
                    onPressed: () {
                      if (cubit.token!.isNotEmpty) {
                        showDialog(
                          context: context,
                          builder: (_) => BlocProvider.value(
                            value: context.read<ProfileCubit>(),
                            child: const CustomLogoutDialog(),
                          ),
                        );
                      } else {
                        context.pushAndRemoveUntilWithNamed(
                          Routes.loginView,
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
