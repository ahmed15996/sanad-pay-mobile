
import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../../../core/constants/app_cached.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/local/shared_preferences/shared_pref_services.dart';
import '../../models/user_model.dart';
import 'auth_local_data_source.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final SharedPrefServices appPref;
  AuthLocalDataSourceImpl({required this.appPref});

  @override
  void saveDataUser({
    required String token,
    required UserModel userModel,
  }) {
    try {
      appPref.saveData(AppCached.token, token);
      appPref.saveData(AppCached.role, userModel.type);
      appPref.saveData(AppCached.userId, userModel.id);
    } catch (error) {
      throw CacheSaveException();
    }
  }
}
