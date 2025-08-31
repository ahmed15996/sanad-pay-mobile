import 'package:injectable/injectable.dart';
import 'package:sanad/features/common/auth/data/models/user_model.dart';
import 'package:sanad/features/user/home/data/models/home_model.dart';
import '../../../../../../core/api/api_consumer.dart';
import '../../../../../../core/api/base_response.dart';
import '../../../../../../core/constants/api_constants.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../models/dashboard_model.dart';
import 'home_store_remote_data_source.dart';

@Injectable(as: HomeStoreRemoteDataSource)
class HomeStoreRemoteDataSourceImpl extends HomeStoreRemoteDataSource {
  final ApiConsumer apiConsumer;

  HomeStoreRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<DashboardModel> fetchDashboard() async {
    BaseResponse response = await apiConsumer.get(ApiConstants.storeDashboard);
    if (response.status == true) {
      return DashboardModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }


}
