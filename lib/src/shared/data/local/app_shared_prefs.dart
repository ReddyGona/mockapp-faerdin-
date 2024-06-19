import 'package:mockapp/src/core/core_exports.dart';
import 'package:secure_shared_preferences/secure_shared_preferences.dart';

class AppSharedPrefs {
  final SecureSharedPref _preferences;
  // based on need on/off encryption
  bool enableEncryption = true;

  AppSharedPrefs(this._preferences);

  /// __________ Dark Theme __________ ///
  // get theme
  Future<bool> getIsDarkTheme() async {
    try {
      bool? response = await _preferences.getBool(
        LocalDataConstants.theme,
        isEncrypted: enableEncryption,
      );
      return response ?? false;
    } catch (e) {
      return false;
    }
  }

  // set theme mode
  void setDarkTheme(bool isDark) {
    _preferences.putBool(LocalDataConstants.theme, isDark,
        isEncrypted: enableEncryption);
  }

  /// __________ Route __________ ///
  // get current route
  Future<String> getCurrentRoute() async {
    try {
      String? response = await _preferences.getString(
        LocalDataConstants.currentRoute,
        isEncrypted: enableEncryption,
      );

      return response ?? RouteConstants.kHomeScreen.path;
    } catch (e) {
      return RouteConstants.kHomeScreen.path;
    }
  }

  // set current route
  void setCurrentRoute(String currentRoute) {
    _preferences.putString(
      LocalDataConstants.currentRoute,
      currentRoute,
      isEncrypted: enableEncryption,
    );
  }
}
