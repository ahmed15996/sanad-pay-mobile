
import '../../models/user_model.dart';

abstract class AuthLocalDataSource {
  void saveDataUser({required String token, required UserModel userModel});
}
