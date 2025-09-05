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

  static String? storeNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyStoreName.tr();
    }
    return null;
  }

  static String? storeImageOrLogoValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyStoreImageOrLogo.tr();
    }
    return null;
  }

  static String? storeDescriptionValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyStoreDescription.tr();
    }
    return null;
  }

  static String? addressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyAddress.tr();
    }
    return null;
  }

  static String? storeOwnerNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyStoreOwnerName.tr();
    }
    return null;
  }

  static String? storeLocationValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyStoreLocation.tr();
    }
    return null;
  }

  static String? commercialNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyCommercialNumber.tr();
    }
    return null;
  }

  static String? commercialImageValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyCommercialImage.tr();
    }
    return null;
  }

  static String? jobStartHourValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyJobStartHour.tr();
    }
    return null;
  }

  static String? toHourValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyToHour.tr();
    }
    return null;
  }



  static String? cityValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyCity.tr();
    }
    return null;
  }

  static String? categoryValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyCategory.tr();
    }
    return null;
  }

  static String? nationalIdValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyNationalId.tr();
    }
    return null;
  }

  static String? dateOfBirthValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyDateOfBirth.tr();
    }
    return null;
  }

  static String? occupationValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyOccupation.tr();
    }
    return null;
  }

  static String? startedJobDateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptyStartedJobDate.tr();
    }
    return null;
  }

  static String? salaryValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.emptySalary.tr();
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
