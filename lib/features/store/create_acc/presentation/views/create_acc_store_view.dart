import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/constants/app_assets.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import 'package:sanad/features/store/create_acc/presentation/views/widgets/custom_input_store_owner_widget.dart';
import 'package:sanad/features/store/create_acc/presentation/views/widgets/custom_store_accept_terms_and_cond_widget.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/widgets/custom_error.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../cubit/create_acc_store_cubit.dart';
import 'widgets/custom_button_send_request_create_acc_tech_widget.dart';
import 'widgets/custom_input_store_create_acc_widget.dart';

class CreateAccStoreView extends StatefulWidget {


  const CreateAccStoreView({
    super.key,
  });

  @override
  State<CreateAccStoreView> createState() => _CreateAccStoreViewState();
}

class _CreateAccStoreViewState extends State<CreateAccStoreView> {
  @override
  void initState() {
    context.read<CreateAccStoreCubit>().fetchCities();
    super.initState();
  }

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform(
                          alignment: Alignment.center,
                          transform:
                          TextDirection.ltr.name ==
                              Directionality.of(context).name
                              ? Matrix4.rotationY(3.1416)
                              : Matrix4.rotationY(0),
                          child: SvgPicture.asset(AppAssets.arrowBack,color: AppColors.whiteColor,)).onTap(function: () {
                        context.pop();
                      },),
                      heightSpace(10.h),
                      Text(
                        LocaleKeys.createAccount.tr(),
                        style: AppTextStyles.textStyle32,
                      ),
                      heightSpace(10),
                      Text(
                        LocaleKeys.enterThisInformationToCreateAccount.tr(),
                        style: AppTextStyles.textStyle16,
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
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24.r),
                ),
              ),
              child: BlocBuilder<CreateAccStoreCubit, CreateAccStoreState>(
                builder: (context, state) {
                  final cubit = context.read<CreateAccStoreCubit>();
                  return state is GetDataLoading
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 20.h,
                          ),
                          child: const CustomLoading(
                          ),
                        )
                      : state is GetDataFailure
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 20.h,
                              ),
                              child: Center(
                                child: CustomError(
                                  error: state.error,
                                  retry: () {
                                    cubit.fetchCities();
                                  },
                                ),
                              ),
                            )
                          : SingleChildScrollView(
                              padding: EdgeInsetsDirectional.only(
                                start: 27.w,
                                end: 21.w,
                                bottom: 20.h,
                              ),
                              child: AbsorbPointer(
                                absorbing: state is CreateAccLoading ? true : false,
                                child: Form(
                                  key: cubit.formKey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      heightSpace(24.h),
                                      CustomInputStoreCreateAccWidget(
                                        cubit: cubit,
                                      ),
                                      heightSpace(20.h),
                                      CustomInputStoreOwnerWidget(),
                                      const CustomStoreAcceptTermsAndCondWidget(),
                                      heightSpace(33.h),
                                      CustomButtonSendRequestCreateAccTechWidget(
                                        cubit: cubit,
                                      )
                                    ],
                                  ),
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
