import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../generated/locale_keys.g.dart';

class PhoneFieldController extends ChangeNotifier {
  final controller = TextEditingController();
  String errorMessage = "";
  PhoneFieldBorder phoneFieldBorder = PhoneFieldBorder.initial;

  bool validatePhoneField() {
    final isPhoneFieldEmpty = controller.text.isEmpty;
    final RegExp regex = RegExp(r'^(05\d{8}|5\d{8})$');
    final isSaudiNumber = regex.hasMatch(controller.text);
    if (isPhoneFieldEmpty) {
      errorMessage = LocaleKeys.emptyPhone.tr();
      phoneFieldBorder = PhoneFieldBorder.error;
      notifyListeners();
    }
    else if (!isSaudiNumber) {
      errorMessage = LocaleKeys.validatePhone.tr();
      phoneFieldBorder = PhoneFieldBorder.error;
      notifyListeners();
    }
    else {
      disableError();
    }

    if (!isPhoneFieldEmpty) {
      return true;
    } else {
      return false;
    }
  }

  disableError() {
    phoneFieldBorder = PhoneFieldBorder.validated;
    errorMessage = "";
    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

enum PhoneFieldBorder { initial, error, validated }
