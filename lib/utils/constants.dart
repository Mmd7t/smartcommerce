import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/translations/translations_keys.dart';
import 'package:smartcommerce/utils/helper/language_set_helper.dart';

enum ProductsType { brand, featured, category, recently }

class Constants {
  static String get baseUrl =>
      '${Get.put(AppController()).endUrl.value}/${LanguageHelper.decodeLanguage()}/api/';
  static String get imageURL =>
      '${Get.put(AppController()).endUrl.value}/storage/media/';
  static const String apiKey = 'apiKey';
  static const String username = 'smartcommerce';
  static const String password = 'smart2020';
  static const String appName = 'Smart Commerce';
  static final String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));

  static final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'authorization': basicAuth,
  };

  static List<String> baseUrls = [
    "https://market.smartcommerce.me",
    "https://ex.smartcommerce.me",
    "https://ex2.smartcommerce.me",
    "https://pharmacy.smartcommerce.me",
  ];

/*-----------------------------------------------------------------------------------------------------*/
/*----------------------------------------  Show Error Dialog  ----------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/

  static showErrorDialog(context, text) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(text),
        title: Text("error happened"),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'))
        ],
      ),
    );
  }

/*-----------------------------------------------------------------------------------------------------*/
/*----------------------------------------  Onboarding Images  ----------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/

  static const List<String> onboardingImages = [
    'assets/smart_commerce.gif',
    'assets/market_slide_1.png',
    'assets/market_slide_2.png',
    'assets/market_slide_3.png',
    'assets/market_slide_4.png',
  ];

/*-----------------------------------------------------------------------------------------------------*/
/*----------------------------------------  Onboarding Titles  ----------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/

  static const onboardingTitles = [
    TranslationsKeys.onboardingText1,
    TranslationsKeys.onboardingText2,
    TranslationsKeys.onboardingText3,
    TranslationsKeys.onboardingText4,
    TranslationsKeys.onboardingText5,
  ];
}
