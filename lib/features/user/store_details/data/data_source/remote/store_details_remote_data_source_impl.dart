import 'package:injectable/injectable.dart';
import 'package:sanad/features/common/auth/data/models/user_model.dart';
import 'package:sanad/features/user/home/data/models/home_model.dart';
import 'package:sanad/features/user/home/data/models/store_model.dart';
import '../../../../../../core/api/api_consumer.dart';
import '../../../../../../core/api/base_response.dart';
import '../../../../../../core/constants/api_constants.dart';
import '../../../../../../core/errors/exceptions.dart';
import 'store_details_remote_data_source.dart';

@Injectable(as: StoreDetailsRemoteDataSource)
class StoreDetailsRemoteDataSourceImpl extends StoreDetailsRemoteDataSource {
  final ApiConsumer apiConsumer;

  StoreDetailsRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<StoreModel> fetchStoreDetails(int storeId) async {
    BaseResponse response = await apiConsumer.get(ApiConstants.storeDetails(storeId));
    if (response.status == true) {
      return StoreModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }



}
