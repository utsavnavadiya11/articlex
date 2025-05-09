import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static LocalStorage? _settings;
  static SharedPreferences? preferences;

  static Future<LocalStorage?> getInstance() async {
    if (_settings == null) {
      final secureStorage = LocalStorage._();
      await secureStorage._init();
      _settings = secureStorage;
    }
    return _settings;
  }

  LocalStorage._();

  Future _init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static List<int> get favoritePosts =>
      preferences
          ?.getStringList(PreferenceConsts.posts)
          ?.map((e) => int.parse(e))
          .toList() ??
      [];
  static set favoritePosts(List<int> value) => preferences?.setStringList(
      PreferenceConsts.posts, value.map((e) => e.toString()).toList());

  static void clearKey(String key) {
    preferences?.remove(key);
  }

  static Future<void> clear() async {
    await preferences?.clear();
  }

  static Future<void> reload() async {
    await preferences!.reload();
  }
}

class PreferenceConsts {
  PreferenceConsts._privateConstructor();

  static final PreferenceConsts _instance =
      PreferenceConsts._privateConstructor();

  factory PreferenceConsts() {
    return _instance;
  }
  static String posts = 'posts';
}
