
import 'package:flutter/cupertino.dart';

import './localization/language_constants.dart';
import './main.dart';

class SettingsProv with ChangeNotifier{

  Future<void> setLang(BuildContext context ,String languageCode) async {
    Locale _locale = await setLocale(languageCode);
    MyApp.setLocale(context, _locale);
    getLang();
  }

  String appLang = 'ar';
  Future<void> getLang() async{
    await getLocale().then((value) {
      appLang = value.languageCode;
      notifyListeners();
    });
  }


}