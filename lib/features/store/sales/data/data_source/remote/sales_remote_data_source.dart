import 'package:sanad/features/store/sales/data/models/sales_model.dart';
import 'package:sanad/features/store/sales/data/params/orders_params.dart';


abstract class SalesRemoteDataSource {
  Future<SalesModel> fetchSales(OrdersParams params);



}
