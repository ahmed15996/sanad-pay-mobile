import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/features/common/profile/data/repository/profile_repository.dart';
import 'package:sanad/features/user/payments/data/params/previous_payments_params.dart';
import 'package:sanad/features/user/payments/data/params/send_financing_request_params.dart';
import 'package:sanad/features/user/payments/data/repository/payments_repository.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../data_source/remote/payments_remote_data_source.dart';
import '../models/previous_payments_model.dart';
import '../models/transaction_history_model.dart';
import '../models/upcoming_payments_model.dart';
import '../params/transaction_history_params.dart';

@Injectable(as: PaymentsRepository)
class PaymentsRepositoryImpl extends PaymentsRepository {
  final PaymentsRemoteDataSource paymentsRemoteDataSource;


  PaymentsRepositoryImpl({
    required this.paymentsRemoteDataSource,
  });




  @override
  Future<Either<Failure, UpcomingPaymentsModel>> fetchUpcomingPayments() async {
    try {
      UpcomingPaymentsModel upcomingPaymentsModel =
          await paymentsRemoteDataSource.fetchUpcomingPayments();
      return Right(upcomingPaymentsModel);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, String>> pay(int paymentId) async {
    try {
      String message =
      await paymentsRemoteDataSource.pay(paymentId);
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, String>> accept(int orderId) async {
    try {
      String message =
      await paymentsRemoteDataSource.accept(orderId);
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, String>> reject(int orderId) async {
    try {
      String message =
      await paymentsRemoteDataSource.reject(orderId);
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, PreviousPaymentsModel>> fetchPreviousPayments(PreviousPaymentsParams params) async {
    try {
      PreviousPaymentsModel previousPaymentsModel =
      await paymentsRemoteDataSource.fetchPreviousPayments(params);
      return Right(previousPaymentsModel);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, TransactionHistoryModel>> fetchTransactionHistory(TransactionHistoryParams params) async {
    try {
      TransactionHistoryModel transactionHistoryModel =
      await paymentsRemoteDataSource.fetchTransactionHistory(params);
      return Right(transactionHistoryModel);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, String>> sendFinancingRequest(SendFinancingRequestParams params) async {
    try {
      String message =
      await paymentsRemoteDataSource.sendFinancingRequest(params);
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }
}
