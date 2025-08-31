import 'package:injectable/injectable.dart';
import 'package:sanad/features/user/home/data/models/category_model.dart';
import '../../../../../../core/api/api_consumer.dart';
import '../../../../../../core/api/base_response.dart';
import '../../../../../../core/constants/api_constants.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../params/create_acc_store_param.dart';
import 'create_acc_store_remote_data_source.dart';

@Injectable(as: CreateAccStoreRemoteDataSource)
class CreateAccStoreRemoteDataSourceImpl extends CreateAccStoreRemoteDataSource {
  final ApiConsumer apiConsumer;

  CreateAccStoreRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<String> createAcc(
      {required CreateAccStoreParam param}) async {

    BaseResponse response = await apiConsumer.post(
      ApiConstants.registerStore,
      body: param.toJson(),
      formDataIsEnabled: true,
    );
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<List<CategoryModel>> fetchCategories() async {

    BaseResponse response = await apiConsumer.get(
      ApiConstants.categories,
    );
    if (response.status == true) {
      return (response.data as List).map((e) => CategoryModel.fromJson(e)).toList();
    } else {
      throw ServerException(response.message.toString());
    }
  }
}
