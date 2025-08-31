
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sanad/features/user/create_acc_user/data/data_source/remote/create_acc_user_remote_data_source.dart';
import 'package:sanad/features/user/home/data/models/category_model.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../data_source/remote/create_acc_store_remote_data_source.dart';
import '../params/create_acc_store_param.dart';
import 'create_acc_store_repository.dart';

@Injectable(as: CreateAccStoreRepository)
class CreateAccSellerRepositoryImpl extends CreateAccStoreRepository {
  final CreateAccStoreRemoteDataSource createAccSellerRemoteDataSource;

  CreateAccSellerRepositoryImpl({required this.createAccSellerRemoteDataSource});

  @override
  Future<Either<Failure, String>> createAcc(
      {required CreateAccStoreParam param}) async {
    try {
      String message = await createAccSellerRemoteDataSource.createAcc(
        param: param,
      );
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> fetchCategories() async {
    try {
      List<CategoryModel> categories = await createAccSellerRemoteDataSource.fetchCategories();
      return Right(categories);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

}
