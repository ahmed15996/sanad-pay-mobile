import 'package:injectable/injectable.dart';
import '../../../../../../core/api/api_consumer.dart';
import '../../../../../../core/api/base_response.dart';
import '../../../../../../core/constants/api_constants.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../params/create_invoice_params.dart';
import 'create_invoice_remote_data_source.dart';

@Injectable(as: CreateInvoiceRemoteDataSource)
class CreateInvoiceRemoteDataSourceImpl extends CreateInvoiceRemoteDataSource {
  final ApiConsumer apiConsumer;

  CreateInvoiceRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<String> createInvoice({required CreateInvoiceParams param}) async {
    BaseResponse response = await apiConsumer.post(
      ApiConstants.createInvoice,
      body: param.toJson(),
    );
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }
}
