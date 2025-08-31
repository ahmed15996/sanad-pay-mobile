import 'package:sanad/features/user/home/data/models/home_model.dart';
import 'package:sanad/features/user/offers/data/models/offers_model.dart';
import 'package:sanad/features/user/offers/data/params/offers_params.dart';

import '../../../../../common/auth/data/models/user_model.dart';

abstract class OffersRemoteDataSource {
  Future<OffersModel> fetchOffers(OffersParams params);
}
