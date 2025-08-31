import 'package:sanad/features/user/home/data/models/home_model.dart';
import 'package:sanad/features/user/nearby/data/data_source/params/search_params.dart';

import '../../../../../common/auth/data/models/user_model.dart';
import '../../models/nearby_model.dart';

abstract class NearbyRemoteDataSource {
  Future<NearbyModel> fetchSearch(SearchParams params);
}
