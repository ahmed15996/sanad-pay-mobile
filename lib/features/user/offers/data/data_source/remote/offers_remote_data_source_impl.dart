import 'package:injectable/injectable.dart';
import 'package:sanad/features/common/auth/data/models/user_model.dart';
import 'package:sanad/features/user/home/data/models/home_model.dart';
import 'package:sanad/features/user/offers/data/models/offers_model.dart';
import 'package:sanad/features/user/offers/data/params/offers_params.dart';
import '../../../../../../core/api/api_consumer.dart';
import '../../../../../../core/api/base_response.dart';
import '../../../../../../core/constants/api_constants.dart';
import '../../../../../../core/errors/exceptions.dart';
import 'offers_remote_data_source.dart';

@Injectable(as: OffersRemoteDataSource)
class OffersRemoteDataSourceImpl extends OffersRemoteDataSource {
  final ApiConsumer apiConsumer;

  OffersRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<OffersModel> fetchOffers(OffersParams params) async {
    BaseResponse response = await apiConsumer.get(ApiConstants.offers,
        queryParameters: params.toJson());
    if (response.status == true) {
      return OffersModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }

}
