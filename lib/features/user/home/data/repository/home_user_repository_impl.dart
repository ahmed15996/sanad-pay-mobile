import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/features/common/auth/data/models/user_model.dart';
import 'package:sanad/features/user/home/data/models/home_model.dart';
import 'package:sanad/features/user/home/data/params/home_user_params.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../data_source/remote/home_user_remote_data_source.dart';
import 'home_user_repository.dart';


@Injectable(as: HomeUserRepository)
class HomeUserRepositoryImpl extends HomeUserRepository {
  final HomeUserRemoteDataSource homeUserRemoteDataSource;

  HomeUserRepositoryImpl({required this.homeUserRemoteDataSource});

  @override
  Future<Either<Failure, HomeModel>> fetchHome(HomeUserParams params) async {
    try {
      HomeModel homeModel = await homeUserRemoteDataSource.fetchHome(params);
      return Right(homeModel);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, UserModel>> fetchUserProfile() async {
    try {
      UserModel userModel = await homeUserRemoteDataSource.fetchUserProfile();
      return Right(userModel);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

}
