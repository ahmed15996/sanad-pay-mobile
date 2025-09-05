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
import '../../data/arguments/pin_code_argument.dart';
import '../../data/params/verify_code_param.dart';
import '../cubits/pin_code_cubit/pin_code_cubit.dart';
import '../widgets/pin_code_widgets/custom_code_sent_success_widget.dart';
import '../widgets/pin_code_widgets/custom_not_send_code_and_resend.dart';
import '../widgets/pin_code_widgets/custom_pin_code_widget.dart';

class PinCodeView extends StatefulWidget {
  final PinCodeArgument argument;
  const PinCodeView({super.key, required this.argument});

  @override
  State<PinCodeView> createState() => _PinCodeViewState();
}

class _PinCodeViewState extends State<PinCodeView> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<PinCodeCubit>().addListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<PinCodeCubit, PinCodeState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<PinCodeCubit>(context);
          return Column(
            children: [
              Expanded(
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 24.w, top: 30.h),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        LocaleKeys.enterVerificationCode.tr(),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomCodeSentSuccessWidget(phone: widget.argument.phone),
                      heightSpace(170),
                      CustomPinCodeWidget(),
                      heightSpace(32),
                      CustomNotSendCodeAndResend(argument: widget.argument),
                      Spacer(),
                      CustomButton(
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.verifyCode(
                              context: context,
                              argument: widget.argument,
                            );
                          }
                        },
                        isDisabled: !cubit.isButtonEnabled,
                        isLoading: state is PinCodeLoading,
                        text: LocaleKeys.verify.tr(),
                      ),
                      Spacer(),
                    ],
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
