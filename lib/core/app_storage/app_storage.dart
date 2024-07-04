import 'package:get_storage/get_storage.dart';
import 'package:yiki1/core/models/user_model.dart';

class AppStorage {
  static final GetStorage box = GetStorage();

  static Future<void> init() async => await GetStorage.init();

  static Future<void> cacheUserInfo(UserModel userModel) =>
      box.write('user', userModel.toJson());

  static UserModel? get getUserInfo {
    UserModel? userModel;
    if (box.hasData('user')) {
      userModel = UserModel.fromJson(box.read('user'));
    }
    return userModel;
  }

  static bool get isLogged => getUserInfo != null;

  static int? get getUserId => getUserInfo?.data?.user?.id;

  static String? get getToken => getUserInfo?.data?.token;

  static User? get getUserData => getUserInfo?.data?.user;

  static Future<void> eraseBox() async {
    await box.erase();
  }

  static Future<void> clearUserInfo() async {
    box.remove('user');
  }

  static Future<void> cacheLanguage(String language) {
    return box.write('language', language);
  }

  static String get getLanguage => box.read('language') ?? 'arabic';
}
