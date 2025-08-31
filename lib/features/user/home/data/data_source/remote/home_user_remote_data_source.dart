import 'package:sanad/features/user/home/data/models/home_model.dart';

import '../../../../../common/auth/data/models/user_model.dart';

abstract class HomeUserRemoteDataSource {
  Future<HomeModel> fetchHome();
  Future<UserModel> fetchUserProfile();
}
