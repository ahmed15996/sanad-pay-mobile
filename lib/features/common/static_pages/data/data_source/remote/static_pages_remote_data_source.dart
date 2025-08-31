

import 'package:sanad/features/common/profile/data/models/app_settings_model.dart';

import '../../models/question_model.dart';
import '../../params/contact_us_param.dart';

abstract class StaticPagesRemoteDataSource {
  Future<String> fetchPrivacy();

  Future<String> fetchTerms();

  Future<String> fetchWhoAre();

  Future<List<QuestionModel>> fetchQuestions();
}
