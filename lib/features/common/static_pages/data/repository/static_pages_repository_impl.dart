
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/features/common/static_pages/data/repository/static_pages_repository.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../data_source/remote/static_pages_remote_data_source.dart';
import '../models/question_model.dart';
import '../params/contact_us_param.dart';

@Injectable(as: StaticPagesRepository)
class StaticPagesRepositoryImpl extends StaticPagesRepository {
  final StaticPagesRemoteDataSource staticPagesRemoteDataSource;

  StaticPagesRepositoryImpl({required this.staticPagesRemoteDataSource});



  @override
  Future<Either<Failure, String>> fetchPrivacy() async {
    try {
      String message = await staticPagesRemoteDataSource.fetchPrivacy();
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<QuestionModel>>> fetchQuestions() async {
    try {
      List<QuestionModel> questions =
          await staticPagesRemoteDataSource.fetchQuestions();
      return Right(questions);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, String>> fetchTerms() async {
    try {
      String message = await staticPagesRemoteDataSource.fetchTerms();
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, String>> fetchWhoAre() async {
    try {
      String message = await staticPagesRemoteDataSource.fetchWhoAre();
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }
}
