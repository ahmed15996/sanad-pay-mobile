import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/features/common/auth/data/models/user_model.dart';
import 'package:sanad/features/store/home/data/models/dashboard_model.dart';
import 'package:sanad/features/user/home/data/models/home_model.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../data_source/remote/home_store_remote_data_source.dart';
import 'home_store_repository.dart';


@Injectable(as: HomeStoreRepository)
class HomeStoreRepositoryImpl extends HomeStoreRepository {
  final HomeStoreRemoteDataSource homeStoreRemoteDataSource;

  HomeStoreRepositoryImpl({required this.homeStoreRemoteDataSource});

  @override
  Future<Either<Failure, DashboardModel>> fetchDashboard() async {
    try {
      DashboardModel dashboardModel = await homeStoreRemoteDataSource.fetchDashboard();
      return Right(dashboardModel);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }



}
