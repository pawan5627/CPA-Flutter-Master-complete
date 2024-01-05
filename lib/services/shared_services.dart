import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefencesServices {
  Future<void> saveAnalyzing({required bool isAnalyzeComplete}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('isAnalyzeComplete', isAnalyzeComplete);
  }

  Future<void> loginPrefences({required uid, required bool isLogin}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('uid', uid);
    prefs.setBool("isLogin", isLogin);
  }

  Future<void> clearPrefences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('uid');
    prefs.remove("isLogin");
  }
}
