import 'package:injectable/injectable.dart';
import 'package:sanad/features/common/auth/data/models/user_model.dart';
import 'package:sanad/features/user/home/data/models/home_model.dart';
import 'package:sanad/features/user/nearby/data/data_source/params/search_params.dart';
import '../../../../../../core/api/api_consumer.dart';
import '../../../../../../core/api/base_response.dart';
import '../../../../../../core/constants/api_constants.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../models/nearby_model.dart';
import 'nearby_remote_data_source.dart';

@Injectable(as: NearbyRemoteDataSource)
class NearbyRemoteDataSourceImpl extends NearbyRemoteDataSource {
  final ApiConsumer apiConsumer;

  NearbyRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<NearbyModel> fetchSearch(SearchParams params) async {
    BaseResponse response = await apiConsumer.get(ApiConstants.search,queryParameters: params.toJson());
    if (response.status == true) {
      return NearbyModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }



}
