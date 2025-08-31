
import 'package:sanad/features/user/home/data/models/category_model.dart';

import '../../params/create_acc_store_param.dart';

abstract class CreateAccStoreRemoteDataSource {
  Future<String> createAcc({required CreateAccStoreParam param});
  Future<List<CategoryModel>> fetchCategories();
}
