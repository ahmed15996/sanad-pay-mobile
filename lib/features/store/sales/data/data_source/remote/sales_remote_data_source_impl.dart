import 'package:injectable/injectable.dart';
import 'package:sanad/features/store/sales/data/data_source/remote/sales_remote_data_source.dart';
import '../../../../../../core/api/api_consumer.dart';
import '../../../../../../core/api/base_response.dart';
import '../../../../../../core/constants/api_constants.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../models/sales_model.dart';
import '../../params/orders_params.dart';


@Injectable(as: SalesRemoteDataSource)
class SalesRemoteDataSourceImpl extends SalesRemoteDataSource {
  final ApiConsumer apiConsumer;

  SalesRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<SalesModel> fetchSales(OrdersParams params) async {
    BaseResponse response = await apiConsumer.get(ApiConstants.orders,queryParameters: params.toJson());
    if (response.status == true) {
      return SalesModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }
}
