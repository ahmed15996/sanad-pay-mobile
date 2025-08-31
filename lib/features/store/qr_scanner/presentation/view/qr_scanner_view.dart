import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:sanad/core/constants/app_colors.dart';

import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../cubit/qr_scanner_cubit.dart';


class QrScannerView extends StatelessWidget {
  final void Function(String barcode,BuildContext context) updateBarcode;

  const QrScannerView({super.key, required this.updateBarcode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QrScannerCubit, QrScannerState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<QrScannerCubit>(context);
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          appBar: CustomAppbar(
            title: LocaleKeys.scanBarcode.tr(),
          ),
          body: MobileScanner(
            controller: cubit.controller,
            onDetect: (BarcodeCapture capture) => cubit.qrScanning(
                capture: capture,
                context: context,
                updateBarcode: updateBarcode),
          ),
        );
      },
    );
  }
}
