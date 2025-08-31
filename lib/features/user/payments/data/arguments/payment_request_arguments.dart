import 'package:sanad/features/store/home/data/models/order_model.dart';

class PaymentRequestArguments {
  final OrderModel orderModel;
  final bool isFromNotification;
  PaymentRequestArguments({required this.orderModel,this.isFromNotification = false});
}