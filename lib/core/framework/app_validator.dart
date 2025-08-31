import 'package:easy_localization/easy_localization.dart';

import '../../generated/locale_keys.g.dart';

class AppValidator {
  static String? defaultValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyField.tr();
    }
    return null;
  }
  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyName.tr();
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if(value != null && value.isNotEmpty){
      final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
      if (!emailRegex.hasMatch(value)) {
        return LocaleKeys.validEmail.tr();
      }
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

  static descSuggestValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return LocaleKeys.emptyDescSuggest.tr();
      }
      return null;
    };
  }

}
