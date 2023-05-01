import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SharedPreferenceHelper {
  late GetStorage _appStorage;
  static const accessTokenKey = "user-access-token";

  String? get accessToken => _appStorage.read(accessTokenKey);

  Future<void> logout() {
    return _appStorage.remove(accessTokenKey);
  }

  Future<void> storeAccessToken(String token) {
    return _appStorage.write(accessTokenKey, token);
  }

  Future<void> initStorage() async {
    await GetStorage.init("appStorage");
    _appStorage = GetStorage("appStorage");
  }
}
