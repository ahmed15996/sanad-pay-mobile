import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import 'package:sanad/features/common/bottom_nav/data/arguments/bottom_nav_argument.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/util/routing/routes.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../data/arguments/financing_status_arguments.dart';

class FinancingStatusView extends StatelessWidget {
  final FinancingStatusArguments financingStatusArguments;
  const FinancingStatusView({
    super.key,
    required this.financingStatusArguments,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 24.w, top: 20.h),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ 
                      Transform(
                          alignment: Alignment.center,
                          transform:
                          TextDirection.ltr.name == Directionality.of(context).name
                              ? Matrix4.rotationY(3.1416)
                              : Matrix4.rotationY(0)
                          ,child: SvgPicture.asset(AppAssets.arrowBack,color: AppColors.whiteColor,)).onTap(function: () {
                            context.pushReplacementWithNamed(Routes.bottomNavView,arguments: BottomNavArgument(isUser: true,index: 0));
                          },),
                      heightSpace(35),
                      Text(
                        financingStatusArguments.isSuccess
                            ? LocaleKeys.requestSubmittedSuccessfully.tr()
                            : LocaleKeys.yourRequestHasBeenRejected.tr(),
                        style: AppTextStyles.textStyle32,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      financingStatusArguments.isSuccess
                          ? AppAssets.success
                          : AppAssets.rejected,
                    ),
                  ),
                  heightSpace(42),
                  Text(
                    financingStatusArguments.isSuccess
                        ? LocaleKeys.requestSubmittedSuccessfully.tr().replaceAll("\n", " ")
                        : LocaleKeys.yourRequestHasBeenRejected.tr().replaceAll("\n", " "),
                    style: AppTextStyles.textStyle20.copyWith(
                      color: AppColors.rhinoDark.shade600,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  heightSpace(9),
                  Text(
                    financingStatusArguments.isSuccess
                        ? LocaleKeys.successContent.tr()
                        : LocaleKeys.rejectContent.tr(),
                    style: AppTextStyles.textStyle16.copyWith(
                      color: AppColors.rhinoDark.shade400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
