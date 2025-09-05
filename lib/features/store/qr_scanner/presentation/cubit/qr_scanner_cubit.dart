import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
part 'qr_scanner_state.dart';

@injectable
class QrScannerCubit extends Cubit<QrScannerState> {
  QrScannerCubit() : super(QrScannerInitial());

  final MobileScannerController controller = MobileScannerController();

  String? qrCode;

  void qrScanning({
    required BarcodeCapture capture,
    required BuildContext context,
    required Function(String barcode) updateBarcode,
  }) async {
    final List<Barcode> barcodes = capture.barcodes;
    final barcode = barcodes.first;
    qrCode = barcode.rawValue!;
    if (qrCode != null) {
      try {
        await controller.stop().then((value) {
          updateBarcode(qrCode.toString());
          if(context.mounted) {
            context.pop();
          }
        });
      } catch (e) {
        debugPrint("Error $e");
      }
    } else {
      debugPrint("Qr Code is Null");
    }
    emit(QrScanningState());
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
