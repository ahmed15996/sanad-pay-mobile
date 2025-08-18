class ApiConstants {
  /// Google Maps
  static const String baseUrlGoogleMaps =
      'https://maps.googleapis.com/maps/api';
  static const String placeAutoComplete = '/place/autocomplete/json';
  static const String placeDetails = '/place/details/json';

  /// Api Server
  static const baseUrl = 'https://lightseagreen-alligator-302707.hostingersite.com/api/';
  static const login = 'auth/login';
  static const loginWithMobile = 'auth/login/mobile';
  static const sendCode = 'auth/send_code';
  static const checkOtp = 'auth/code_check';
  static const createAccount = 'auth/register';
  static const forgetPassword = 'auth/forget_password';
  static const resetPassword = 'auth/reset_password';
  static const logout = 'auth/logout';
  static const deleteAcc = 'users/profile/delete';


}
