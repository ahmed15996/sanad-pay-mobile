import 'package:sanad/features/user/home/data/models/home_model.dart';
import 'package:sanad/features/user/home/data/models/store_model.dart';

import '../../../../../common/auth/data/models/user_model.dart';

abstract class StoreDetailsRemoteDataSource {
  Future<StoreModel> fetchStoreDetails(int storeId);
}
