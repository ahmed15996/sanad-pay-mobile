import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../user/home/data/models/category_model.dart';
import '../params/create_acc_store_param.dart';

abstract class CreateAccStoreRepository {
  Future<Either<Failure, String>> createAcc(
      {required CreateAccStoreParam param});

  Future<Either<Failure, List<CategoryModel>>> fetchCategories();
}
