import 'package:injectable/injectable.dart';
import 'package:sanad/features/user/payments/data/data_source/remote/payments_remote_data_source.dart';
import 'package:sanad/features/user/payments/data/params/send_financing_request_params.dart';


import '../../../../../../core/api/api_consumer.dart';
import '../../../../../../core/api/base_response.dart';
import '../../../../../../core/constants/api_constants.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../models/previous_payments_model.dart';
import '../../models/transaction_history_model.dart';
import '../../models/upcoming_payments_model.dart';
import '../../params/previous_payments_params.dart';
import '../../params/transaction_history_params.dart';

@Injectable(as: PaymentsRemoteDataSource)
class PaymentsRemoteDataSourceImpl extends PaymentsRemoteDataSource {
  final ApiConsumer apiConsumer;

  PaymentsRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<UpcomingPaymentsModel> fetchUpcomingPayments() async {
    BaseResponse response = await apiConsumer.get(ApiConstants.upcomingPayments);
    if (response.status == true) {
      return UpcomingPaymentsModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<String> pay(int paymentId) async {
    BaseResponse response = await apiConsumer.post(ApiConstants.pay(paymentId));
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<String> accept(int orderId) async {
    BaseResponse response = await apiConsumer.post(ApiConstants.accept(orderId));
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<String> reject(int orderId) async {
    BaseResponse response = await apiConsumer.post(ApiConstants.reject(orderId));
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<PreviousPaymentsModel> fetchPreviousPayments(PreviousPaymentsParams params) async {
    BaseResponse response = await apiConsumer.get(ApiConstants.previousPayments,queryParameters: params.toJson());
    if (response.status == true) {
      return PreviousPaymentsModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<TransactionHistoryModel> fetchTransactionHistory(TransactionHistoryParams params) async {
    BaseResponse response = await apiConsumer.get(ApiConstants.transactions,queryParameters: params.toJson());
    if (response.status == true) {
      return TransactionHistoryModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<String> sendFinancingRequest(SendFinancingRequestParams params) async {
    BaseResponse response = await apiConsumer.post(ApiConstants.financingRequest,body: params.toJson());
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }



}
