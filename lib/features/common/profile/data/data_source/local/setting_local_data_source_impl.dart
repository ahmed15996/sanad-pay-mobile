import 'package:injectable/injectable.dart';
import 'package:sanad/features/common/profile/data/data_source/local/setting_local_data_source.dart';

import '../../../../../../core/constants/app_cached.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/local/shared_preferences/shared_pref_services.dart';

@Injectable(as: SettingLocalDataSource)
class SettingLocalDataSourceImpl extends SettingLocalDataSource {
  final SharedPrefServices appPref;

  SettingLocalDataSourceImpl({
    required this.appPref,
  });

  @override
  Future<void> clearDataUser() async {
    try {
      Future.wait(
        [
          appPref.removeData(key: AppCached.role),
          appPref.removeData(key: AppCached.isFaceIdNotify),
          appPref.removeData(key: AppCached.token),
        ],
      );
    } catch (error) {
      throw CacheSaveException();
    }
  }
}
