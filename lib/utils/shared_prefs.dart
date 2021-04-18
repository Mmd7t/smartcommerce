import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartcommerce/utils/constants.dart';

class SharedPrefsHelper {
  static SharedPreferences prefs;

/*-----------------------------------  Initialize Prefs  -----------------------------------*/
  static initPrefs() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
  }

/*-------------------------------------  save Api key  -------------------------------------*/
  static saveApiKeyToPrefs(apiToken) async {
    await initPrefs();
    prefs.setString(Constants.apiKey, apiToken);
  }

/*-------------------------------------  get Api key  --------------------------------------*/
  static getApiTokenFromPrefs() async {
    await initPrefs();
    String apiTokenSaved = prefs.getString(Constants.apiKey) ?? '';
    return apiTokenSaved;
  }
}
