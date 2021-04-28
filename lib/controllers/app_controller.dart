import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/utils/pref/colors.dart';
import 'package:smartcommerce/utils/pref/theme_prefs.dart';

class AppController extends GetxController with ColorsPrefs, ThemePrefs {
  RxBool isGrid = true.obs;
  RxBool isObscure;
  RxBool isDark = false.obs;
  RxInt primaryColor = 0xFFFFA000.obs;
  RxInt accentColor = 0xFF007460.obs;

  getThemeFromPrefs() async {
    bool val = await checkTheme();
    if (val) {
      isDark.value = await getTheme();
    } else {
      isDark.value = false;
    }
  }

  getPrimaryColorFromPrefs(context) async {
    bool val = await checkPrimaryColor();
    if (val) {
      primaryColor.value = await getPrimaryColor();
      Theme.of(context).copyWith(primaryColor: Color(primaryColor.value));
    } else {
      primaryColor.value = 0xFFFFA000;
    }
  }

  getAccentColorFromPrefs(context) async {
    bool val = await checkAccentColor();
    if (val) {
      accentColor.value = await getAccentColor();
      Theme.of(context).copyWith(accentColor: Color(accentColor.value));
    } else {
      accentColor.value = 0xFF007460;
    }
  }

  changeView() {
    isGrid.value = !isGrid.value;
  }

  changeObscure() {
    isObscure.value = !isObscure.value;
  }

  changePrimaryColor(int value, context) {
    primaryColor.value = value;
    setPrimaryColor(value);
    Theme.of(context).copyWith(primaryColor: Color(primaryColor.value));
    print(Theme.of(context).primaryColor);
  }

  changeAccentColor(int value) {
    accentColor.value = value;
    setAccentColor(value);
  }

  changeTheme(bool value) {
    isDark.value = value;
    setTheme(value);
  }
}
