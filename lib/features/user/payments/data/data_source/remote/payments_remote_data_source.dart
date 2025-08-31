import 'package:sanad/features/user/payments/data/params/previous_payments_params.dart';
import 'package:sanad/features/user/payments/data/params/send_financing_request_params.dart';
import '../../models/previous_payments_model.dart';
import '../../models/transaction_history_model.dart';
import '../../models/upcoming_payments_model.dart';
import '../../params/transaction_history_params.dart';

abstract class PaymentsRemoteDataSource {
  Future<UpcomingPaymentsModel> fetchUpcomingPayments();

  Future<PreviousPaymentsModel> fetchPreviousPayments(PreviousPaymentsParams params);

  Future<TransactionHistoryModel> fetchTransactionHistory(TransactionHistoryParams params);

  Future<String> sendFinancingRequest(SendFinancingRequestParams params);

  Future<String> pay(int paymentId);
  Future<String> reject(int orderId);
  Future<String> accept(int orderId);


}
