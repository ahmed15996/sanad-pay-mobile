

import 'package:injectable/injectable.dart';
import 'package:sanad/features/common/static_pages/data/data_source/remote/static_pages_remote_data_source.dart';
import 'package:sanad/features/common/profile/data/models/app_settings_model.dart';

import '../../../../../../core/api/api_consumer.dart';
import '../../../../../../core/api/base_response.dart';
import '../../../../../../core/constants/api_constants.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../models/question_model.dart';
import '../../params/contact_us_param.dart';

@Injectable(as: StaticPagesRemoteDataSource)
class StaticPagesRemoteDataSourceImpl extends StaticPagesRemoteDataSource {
  final ApiConsumer apiConsumer;

  StaticPagesRemoteDataSourceImpl({required this.apiConsumer});




  @override
  Future<String> fetchPrivacy() async {
    BaseResponse response = await apiConsumer.get(ApiConstants.privacy);
    if (response.status == true) {
      return response.data.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<List<QuestionModel>> fetchQuestions() async {
    BaseResponse response = await apiConsumer.get(ApiConstants.faqs);
    if (response.status == true) {
      return response.data
          .map<QuestionModel>((json) => QuestionModel.fromJson(json))
          .toList();
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<String> fetchTerms() async {
    BaseResponse response = await apiConsumer.get(ApiConstants.terms);
    if (response.status == true) {
      return response.data.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<String> fetchWhoAre() async {
    BaseResponse response = await apiConsumer.get(ApiConstants.about);
    if (response.status == true) {
      return response.data.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }
}
