import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;


import '../widgets/custom_toast.dart';


/// replace to factory single ton
@lazySingleton
class AppLocalAuthService {
  Future<bool> authenticateUser() async {
    final LocalAuthentication localAuthentication = LocalAuthentication();
    bool isAuthenticated = false;
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();

    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;
    if (isBiometricSupported && canCheckBiometrics) {
      try {
        isAuthenticated = await localAuthentication.authenticate(
          localizedReason: 'Scan your fingerprint to authenticate',
          options: const AuthenticationOptions(
            stickyAuth: true,
          ),
        );
      } on PlatformException catch (e) {
        showToast(text: "${e.code} ${e.message ?? ""}", state: ToastStates.error);
      }
    }
    return isAuthenticated;
  }
}
