import 'package:sanad/features/store/home/data/models/dashboard_model.dart';
import 'package:sanad/features/user/home/data/models/home_model.dart';

import '../../../../../common/auth/data/models/user_model.dart';

abstract class HomeStoreRemoteDataSource {
  Future<DashboardModel> fetchDashboard();
}
