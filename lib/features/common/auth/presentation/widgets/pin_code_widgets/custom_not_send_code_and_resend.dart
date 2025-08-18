import 'dart:async';
import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/constants/app_colors.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../data/arguments/pin_code_argument.dart';
import '../../cubits/pin_code_cubit/pin_code_cubit.dart';

class CustomNotSendCodeAndResend extends StatefulWidget {
  final PinCodeArgument argument;

  const CustomNotSendCodeAndResend(
      {super.key, required this.argument});

  @override
  State<CustomNotSendCodeAndResend> createState() =>
      _CustomNotSendCodeAndResendState();
}

class _CustomNotSendCodeAndResendState
    extends State<CustomNotSendCodeAndResend> {
  var interval = const Duration(seconds: 1);
  int timerMaxSeconds = 60;
  int currentSeconds = 0;
  late Timer timer;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  bool get isFinish => currentSeconds >= timerMaxSeconds;

  void startTimer() {
    Timer.periodic(interval, (time) {
      timer = time;
      currentSeconds = timer.tick;
      if (timer.tick >= timerMaxSeconds) {
        timer.cancel();
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isFinish
          ? Text(
            LocaleKeys.resendCode.tr(),
            style: AppTextStyles.textStyle16.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor
            ),
          ).onTap(
            function: () {
              context.read<PinCodeCubit>().sendCode(
                timer: startTimer,
              argument: widget.argument
              );
            },
          )
          : Text(
            timerText,
            textDirection: TextDirection.ltr,
            style: AppTextStyles.textStyle16.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor
            ),
          ),
    );
  }
}
