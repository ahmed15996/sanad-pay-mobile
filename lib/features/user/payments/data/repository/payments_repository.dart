import 'package:dartz/dartz.dart';
import 'package:sanad/features/user/payments/data/params/previous_payments_params.dart';
import 'package:sanad/features/user/payments/data/params/send_financing_request_params.dart';
import '../../../../../core/errors/failures.dart';
import '../models/previous_payments_model.dart';
import '../models/transaction_history_model.dart';
import '../models/upcoming_payments_model.dart';
import '../params/transaction_history_params.dart';

abstract class PaymentsRepository {
  Future<Either<Failure, UpcomingPaymentsModel>> fetchUpcomingPayments();

  Future<Either<Failure, PreviousPaymentsModel>> fetchPreviousPayments(
    PreviousPaymentsParams params,
  );
  Future<Either<Failure, TransactionHistoryModel>> fetchTransactionHistory(
    TransactionHistoryParams params,
  );

  Future<Either<Failure, String>> sendFinancingRequest(
    SendFinancingRequestParams params,
  );

  Future<Either<Failure, String>> pay(
      int paymentId,
      );

  Future<Either<Failure, String>> accept(
      int orderId,
      );
  Future<Either<Failure, String>> reject(
      int orderId,
      );
}
