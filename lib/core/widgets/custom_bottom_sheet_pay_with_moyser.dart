// import 'package:easy_localization/easy_localization.dart' as localization;
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../constants/app_colors.dart';
// import '../constants/app_constants.dart';
// import '../constants/app_text_styles.dart';
// import '../framework/spaces.dart';
// import 'custom_appbar.dart';
//
// class CustomBottomSheetPayWithMoyser extends StatelessWidget {
//   final void Function() onPaidSuccess, onPaidFailed;
//   final int price;
//   final bool isIos;
//
//   const CustomBottomSheetPayWithMoyser({
//     super.key,
//     required this.onPaidSuccess,
//     required this.onPaidFailed,
//     required this.price,
//     required this.isIos,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return isIos
//         ? SingleChildScrollView(
//             padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
//             child: Column(
//               children: [
//                 ApplePay(
//                   config: PaymentConfig(
//                     publishableApiKey: AppConstants.moyserApiKey,
//                     amount: price * 100,
//                     description: LocaleKeys.chargeWallet.tr(),
//                     applePay: ApplePayConfig(
//                         label: AppConstants.appName,
//                         merchantId: 'merchant.linkdevelopment.irthad',
//                         manual: false,
//                         saveCard: false),
//                   ),
//                   onPaymentResult: (result) {
//                     debugPrint(result.toString());
//                     if (result is PaymentResponse) {
//                       debugPrint("----- $result");
//                       debugPrint("----- ${result.status}");
//                       if (result.status == PaymentStatus.paid) {
//                         debugPrint(result.id.toString());
//                         debugPrint(result.invoiceId.toString());
//                         debugPrint(result.ip.toString());
//                         debugPrint("----- paid");
//                         // getTransactionId(transactionId: result.invoiceId.toString());
//                         context.pop();
//                         onPaidSuccess();
//                       } else if (result.status == PaymentStatus.failed) {
//                         debugPrint("----- $result");
//                         debugPrint("----- ${result.status}");
//                         debugPrint("Payment failed: ${result.source}");
//                         final errorSource =
//                             result.source as ApplePayPaymentResponseSource;
//                         debugPrint("Payment failed: ${errorSource.type}");
//                         debugPrint("Payment failed: ${errorSource.message}");
//                         debugPrint(
//                             "Payment failed code: ${errorSource.number}");
//                         debugPrint(
//                             "Payment failed code: ${errorSource.gatewayId}");
//                         debugPrint(
//                             "Payment failed code: ${errorSource.referenceNumber}");
//                         debugPrint("Payment failed: ${result.amountFormat}");
//                         debugPrint("Payment failed: ${result.callbackUrl}");
//                         debugPrint("Payment failed: ${result.currency}");
//                         debugPrint("Payment failed: ${result.voidedAt}");
//                         debugPrint("Payment failed: ${result.id}");
//                         debugPrint("Payment failed: ${result.refunded}");
//                         onPaidFailed();
//                       }
//                     }
//                   },
//                 ),
//                 heightSpace(10.h),
//               ],
//             ),
//           )
//         : PopScope(
//             canPop: false,
//             child: Padding(
//               padding: EdgeInsetsDirectional.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   CustomAppbar(
//                     title: LocaleKeys.payment.tr(),
//                     isSheet: true,
//                     canPop: false,
//                   ),
//                   heightSpace(10.h),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 25.w),
//                     child: Directionality(
//                       textDirection: TextDirection.ltr,
//                       child: CreditCard(
//                           locale: context.locale.languageCode == "ar"
//                               ? const Localization.ar()
//                               : const Localization.en(),
//                           config: PaymentConfig(
//                             publishableApiKey: AppConstants.moyserApiKey,
//                             amount: price * 100,
//                             currency: 'SAR',
//                             description: LocaleKeys.chargeWallet.tr(),
//                             creditCard: CreditCardConfig(
//                                 saveCard: false, manual: false),
//                           ),
//                           onPaymentResult: (result) {
//                             if (result is PaymentResponse) {
//                               debugPrint("----- $result");
//                               debugPrint("----- ${result.status}");
//                               if (result.status == PaymentStatus.paid) {
//                                 debugPrint(result.id.toString());
//                                 debugPrint(result.invoiceId.toString());
//                                 debugPrint(result.ip.toString());
//                                 debugPrint("----- paid");
//                                 // getTransactionId(transactionId: result.invoiceId.toString());
//                                 context.pop();
//                                 onPaidSuccess();
//                               } else if (result.status ==
//                                   PaymentStatus.failed) {
//                                 debugPrint(
//                                     "Payment failed: ${result.amount}");
//                                 debugPrint(
//                                     "Payment failed: ${result.callbackUrl}");
//                                 debugPrint(
//                                     "Payment failed: ${result.currency}");
//                                 debugPrint(
//                                     "Payment failed: ${result.voidedAt}");
//                                 debugPrint(
//                                     "Payment failed: ${result.voidedAt}");
//                                 // onPaidFailed();
//                               }
//                             }
//                           }),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//   }
// }
