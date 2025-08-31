class ApiConstants {
  /// Google Maps
  static const String baseUrlGoogleMaps =
      'https://maps.googleapis.com/maps/api';
  static const String placeAutoComplete = '/place/autocomplete/json';
  static const String placeDetails = '/place/details/json';

  // Api pusher
  static const pusherAuth = 'broadcasting/auth';

  /// Api Server
  static const baseUrl = 'https://mediumturquoise-oyster-158169.hostingersite.com/api/';
  static const sendCode = 'auth/send_code';
  static const verifyCode = 'auth/verify_code';
  static const createAccount = 'auth/register';
  static const cities = 'cities';
  static const home = 'home';
  static const profile = 'profile/me';
  static const offers = 'offers';
  static const upcomingPayments = 'finance/payments/upcoming';
  static const previousPayments = 'finance/payments/previous';
  static const transactions = 'wallet/transactions';
  static const financingRequest = 'finance/request';
  static const logout = 'auth/logout';
  static const deleteAcc = 'profile/delete';
  static const appSettings = 'settings';
  static const terms = 'pages/terms_and_condations';
  static const privacy = 'pages/privacy_policy';
  static const about = 'pages/about_us';
  static const faqs = 'faqs';
  static const registerStore = 'auth/store/register';
  static const categories = 'categories';
  static const createInvoice = 'store/orders/make';
  static const storeDashboard = 'store/dashboard';
  static const orders = 'store/orders';
  static const notifications = 'notifications';
  static const search = 'stores/search';
  static String storeDetails(int storeId) => 'stores/$storeId/details';
  static String accept(int orderId) => 'store/orders/$orderId/accept';
  static String reject(int orderId) => 'store/orders/$orderId/reject';
  static String pay(int paymentId) => 'finance/payments/$paymentId/pay';


}
