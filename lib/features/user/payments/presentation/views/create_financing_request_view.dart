import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import 'package:sanad/core/util/routing/routes.dart';
import 'package:sanad/features/user/payments/presentation/cubits/create_financing_cubit/create_financing_cubit.dart';
import 'package:sanad/features/user/payments/presentation/views/widgets/create_financing_request_widgets/custom_header_create_financing_widget.dart';
import 'package:sanad/features/user/payments/presentation/views/widgets/create_financing_request_widgets/custom_input_create_financing_widget.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../create_acc_user/presentation/views/widgets/custom_row_accept_terms_and_cond_widget.dart';

class CreateFinancingRequestView extends StatefulWidget {
  const CreateFinancingRequestView({super.key});

  @override
  State<CreateFinancingRequestView> createState() =>
      _CreateFinancingRequestViewState();
}

class _CreateFinancingRequestViewState
    extends State<CreateFinancingRequestView> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<CreateFinancingCubit>().initListeners();
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
                padding: EdgeInsetsDirectional.only(start: 24.w, top: 10.h),
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
                        child: SvgPicture.asset(
                          AppAssets.arrowBack,
                          color: AppColors.whiteColor,
                        ),
                      ).onTap(
                        function: () {
                          context.pop();
                        },
                      ),
                      heightSpace(5),
                      Text(
                        LocaleKeys.financingRequest.tr(),
                        style: AppTextStyles.textStyle32,
                      ),
                    ],
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
              child: BlocBuilder<CreateFinancingCubit, CreateFinancingState>(
                builder: (context, state) {
                  var cubit = context.read<CreateFinancingCubit>();
                  return SingleChildScrollView(
                    child: AbsorbPointer(
                      absorbing: state is SendFinancingRequestLoading
                          ? true
                          : false,
                      child: Column(
                        children: [
                          const CustomCreateFinancingHeaderWidget(),
                          heightSpace(34),
                          CustomInputCreateFinancingWidget(),
                          heightSpace(26),
                          CustomRowAcceptTermsAndCondWidget(),
                          heightSpace(31),
                          CustomButton(
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.sendFinancingRequest(context);
                              }
                            },
                            isDisabled: !cubit.isButtonEnabled,
                            isLoading: state is SendFinancingRequestLoading,
                            text: LocaleKeys.submitRequest.tr(),
                          ),
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
