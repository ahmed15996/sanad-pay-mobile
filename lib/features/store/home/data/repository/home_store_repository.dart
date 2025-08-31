import 'package:dartz/dartz.dart';
import 'package:sanad/features/common/auth/data/models/user_model.dart';
import 'package:sanad/features/store/home/data/models/dashboard_model.dart';
import 'package:sanad/features/user/home/data/models/home_model.dart';
import '../../../../../core/errors/failures.dart';

abstract class HomeStoreRepository {
  Future<Either<Failure, DashboardModel>> fetchDashboard();

}
