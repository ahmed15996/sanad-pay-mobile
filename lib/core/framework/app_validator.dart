import 'package:easy_localization/easy_localization.dart';

import '../../generated/locale_keys.g.dart';

class AppValidator {
  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyName.tr();
    }
    return null;
  }

  static String? fullEmailValidator(String? value) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyEmail.tr();
    } else if (!emailRegex.hasMatch(value)) {
      return LocaleKeys.validEmail.tr();
    }
    return null;
  }

  static String? otpValidator(String? value) {
    RegExp regex = RegExp(r'^\d{4}$');
    if (value == null || value.isEmpty) {
      return LocaleKeys.pinCodeEmpty.tr();
    } else if (!regex.hasMatch(value)) {
      return LocaleKeys.pinCodeValid.tr();
    }
    return null;
  }

  // static String? suggestionOrComplaintValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return LocaleKeys.emptySuggestionComplaintMessage.tr();
  //   }
  //   return null;
  // }
}
