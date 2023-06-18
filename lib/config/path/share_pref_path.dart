import '../share_pref.dart';

class SharePrefsKeys {
  static String login = "login";
  static String user = "user";
  static String userId = "id";
  static String userToken = "access_token";
  static String name = "username";
  static String avatar = "avatar";
  static String phone = "phone";
  static String email = "email";
  static String expiredAt = "expired_at";

//   static saveUserKey(ModelLogin model) async {
//
// SharedPrefs.saveBool(SharePrefsKeys.login, true);
//     SharedPrefs.saveString(SharePrefsKeys.user_token,model.accessToken);
// SharedPrefs.saveString(SharePrefsKeys.expired_at,model.expiredAt);
//
//
//   }

  static removeAllKey() async {
    SharedPrefs.remove(SharePrefsKeys.login);
    SharedPrefs.remove(SharePrefsKeys.userToken);
    SharedPrefs.clear();

    // SharedPrefs.remove(SharePrefsKeys.user_id);
    // SharedPrefs.remove(SharePrefsKeys.name);
    // SharedPrefs.remove(SharePrefsKeys.phone);
    // SharedPrefs.remove(SharePrefsKeys.email);
    // SharedPrefs.remove(SharePrefsKeys.avatar);
  }
}
