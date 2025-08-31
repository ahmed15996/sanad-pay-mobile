
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../models/question_model.dart';
import '../params/contact_us_param.dart';

abstract class StaticPagesRepository {
  Future<Either<Failure, String>> fetchPrivacy();

  Future<Either<Failure, String>> fetchTerms();

  Future<Either<Failure, String>> fetchWhoAre();


  Future<Either<Failure, List<QuestionModel>>> fetchQuestions();
}
