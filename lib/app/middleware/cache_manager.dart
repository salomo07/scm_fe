import '../constanta/function_global.dart';

enum CacheManagerKey {TOKEN}

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    await setHive(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  String? getToken() {
    return getHive(CacheManagerKey.TOKEN.toString());
  }

  Future<void> removeToken() async {
    await removeHive(CacheManagerKey.TOKEN.toString());
  }
}
