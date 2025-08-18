// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "signInRequest": "طلب تسجيل دخول",
  "unKnownError": "خطأ غير معروف، يرجى المحاولة مرة أخرى",
  "cacheError": "خطأ في ذاكرة التخزين المؤقت، يرجى المحاولة مرة أخرى",
  "noInternetError": "لا يوجد اتصال بالإنترنت، يرجى الاتصال بالإنترنت!",
  "serverError": "حدث خطأ، يرجى المحاولة مرة أخرى",
  "notFoundError": "لم يتم العثور على طلبك، يرجى المحاولة لاحقًا",
  "timeOutError": "خطأ في المهلة، يرجى المحاولة مرة أخرى",
  "emptyPhone": "يرجى إدخال رقم الجوال",
  "validatePhone": "رقم الجوال غير صالح",
  "emptyData": "لا توجد تفاصيل متوفرة في هذه الصفحة",
  "loading": "جار التحميل",
  "retry": "إعادة المحاولة",
  "youShouldSignIn": "من فضلك قم بتسجيل الدخول حتي تتمكن من المتابعة",
  "signIn": "تسجيل دخول",
  "unAuthenticated": "من فضلك قم بتسجيل الدخول حتي تتمكن من المتابعة",
  "appSlogan": "الوصول سريع للاستثمارات، حسب احتياجاتك.",
  "appName": "سند",
  "selectLanguage": "اختر\nاللغة",
  "verifyYourPhone": "تحقق من رقم جوالك",
  "enterMobileNumber": "يرجى ادخال رقم الجوال المسجل في ابشر للحصول على كود التحقق",
  "mobileNumber": "رقم الجوال",
  "login": "تسجيل الدخول",
  "registerAsStore": "تسجيل كمتجر",
  "continueAsGuest": "استمر كزائر",
  "enterVerificationCode": "ادخل كود\nالتحقق",
  "sentVerificationCode": "لقد ارسلنا كود التحقق لرقمك",
  "edit": "تعديل",
  "resendCode": "اعادة الارسال",
  "verify": "تحقق",
  "emptyName": "يرجى ادخال الاسم",
  "emptyEmail": "يرجى ادخال البريد الالكتروني",
  "validEmail": "يرجى ادخال بريد الكتروني صالح",
  "pinCodeEmpty": "يرجى ادخال كود التحقق",
  "pinCodeValid": "كود التحقق يجب ان يكون 4 ارقام"
};
static const Map<String,dynamic> _en = {
  "signInRequest": "Sign In Request",
  "unKnownError": "Unknown error, please try again",
  "cacheError": "Cache error, please try again",
  "noInternetError": "No Internet connection, please connect to the Internet!",
  "serverError": "There was an error, please try again",
  "notFoundError": "Your request was not found, please try later",
  "timeOutError": "Timeout error, please try again",
  "emptyPhone": "Please enter a phone number",
  "validatePhone": "Invalid phone number",
  "emptyData": "There are no details available on this page",
  "loading": "Loading",
  "retry": "Retry",
  "youShouldSignIn": "You need to sign in",
  "signIn": "Sign In",
  "unAuthenticated": "Login session has expired",
  "appSlogan": "Fast access to funds, on your terms.",
  "appName": "Sanad",
  "selectLanguage": "Select\nlanguage",
  "verifyYourPhone": "Verify your phone number",
  "enterMobileNumber": "Please enter your mobile number registered in Absher to receive the verification code.",
  "mobileNumber": "Mobile Number",
  "login": "Log In",
  "registerAsStore": "Register as a Store",
  "continueAsGuest": "Continue as Guest",
  "enterVerificationCode": "Enter Verification\nCode",
  "sentVerificationCode": "We've sent a verification code to your number",
  "edit": "Edit",
  "resendCode": "Resend Code",
  "verify": "Verify",
  "emptyName": "Please enter the full name",
  "emptyEmail": "Please enter the email",
  "validEmail": "Please enter a valid email",
  "pinCodeEmpty": "Please enter the verification code",
  "pinCodeValid": "The verification code must be 4 digits"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
