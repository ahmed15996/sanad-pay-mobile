import 'package:dartz/dartz.dart';
import 'package:sanad/features/store/sales/data/models/sales_model.dart';
import '../../../../../core/errors/failures.dart';

import '../params/orders_params.dart';


abstract class SalesRepository {
  Future<Either<Failure, SalesModel>> fetchSales(OrdersParams params);

}
