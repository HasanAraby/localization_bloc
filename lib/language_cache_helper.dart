import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {
  Future<void> cacheLanguageCode(String languageCode) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString('LOCALE', languageCode);
  }

  Future<String> getCacheLanguageCode() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final cachedLanguageCode = sharedPrefs.getString('LOCALE');
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    }
    return 'en';
  }
}
