import 'package:sanad/features/user/home/data/models/home_model.dart';

import '../../../../../common/auth/data/models/user_model.dart';
import '../../params/home_user_params.dart';

abstract class HomeUserRemoteDataSource {
  Future<HomeModel> fetchHome(HomeUserParams params);
  Future<UserModel> fetchUserProfile();
}
