import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/utils/pref/language.dart';

class LanguageHelper {
  static Future<bool> uploadLanguage() async {
    bool ret = false;
    final lang = await LanguageStorage.getLanguage();
    if (lang == null) {
      ret = false;
    } else {
      Get.updateLocale(encodeLanguage(lang));
      ret = true;
    }
    return ret;
  }

  static String decodeLanguage() {
    return Get.locale == Locale('ar', 'EG') ? 'ar' : 'en';
  }

  static String languageHeader() {
    return Get.locale == Locale('ar', 'EG') ? 'eg' : 'en';
  }

  static updateLanguage(String lang) async {
    Locale locale = encodeLanguage(lang);
    Get.updateLocale(locale);
    await LanguageStorage.storeLanguage(lang);
  }

  static Locale encodeLanguage(String lang) {
    return lang == 'ar' ? Locale('ar', 'EG') : Get.locale = Locale('en', 'US');
  }

  static changeLanguage() {
    return Get.defaultDialog(
      title: "chooseYourLanguage".tr,
      content: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            ListTile(
              onTap: () async {
                if (LanguageHelper.decodeLanguage() != "ar") {
                  await LanguageHelper.updateLanguage("ar");
                  Get.put(AppController()).updateLang();
                }
              },
              title: Text("عربى"),
              trailing: LanguageHelper.decodeLanguage() == "ar"
                  ? Icon(
                      Icons.check,
                      color: Get.theme.primaryColor,
                    )
                  : Container(width: 3),
            ),
            ListTile(
              onTap: () async {
                if (LanguageHelper.decodeLanguage() != "en") {
                  await LanguageHelper.updateLanguage("en");

                  Get.put(AppController()).updateLang();
                }
              },
              title: Text("English"),
              trailing: LanguageHelper.decodeLanguage() == "en"
                  ? Icon(
                      Icons.check,
                      color: Get.theme.primaryColor,
                    )
                  : Container(width: 3),
            ),
          ],
        ),
      ),
      titleStyle: TextStyle(color: Get.theme.primaryColor),
    );
  }
}
