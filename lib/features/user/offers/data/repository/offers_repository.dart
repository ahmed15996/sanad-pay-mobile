import 'package:dartz/dartz.dart';
import 'package:sanad/features/common/auth/data/models/user_model.dart';
import 'package:sanad/features/user/home/data/models/home_model.dart';
import 'package:sanad/features/user/offers/data/params/offers_params.dart';
import '../../../../../core/errors/failures.dart';
import '../models/offers_model.dart';

abstract class OffersRepository {
  Future<Either<Failure, OffersModel>> fetchOffers(OffersParams params);

}
