import 'package:get/get.dart';
import 'package:smartcommerce/translations/translations_keys.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          TranslationsKeys.onboardingText1: 'onboarding Text 1',
          TranslationsKeys.onboardingText2: 'onboarding Text 2',
          TranslationsKeys.onboardingText3: 'onboarding Text 3',
          TranslationsKeys.onboardingText4: 'onboarding Text 4',
          TranslationsKeys.onboardingText5: 'onboarding Text 5',
        },
        'ar_EG': {
          TranslationsKeys.onboardingText1:
              'منصة سمارت كوميرس لانشاء متجرك الالكترونى النسخة التجريبية لتطبيق السوبر ماركت',
          TranslationsKeys.onboardingText2:
              'امتلك تطبيقك باسمك و بهويتك وكن على هاتف كل من فى الحى و الأحياء المجاورة',
          TranslationsKeys.onboardingText3:
              'ننشئ لك تطبيق مبنى على سهولة التعامل سواء فى عملية الشراء و الدفع و التتبع للزبون او من خلال ادارتك لعملية البيع فى استلام الطلب و التوصيل',
          TranslationsKeys.onboardingText4:
              'من خلال لوحة التحكم تستطيع انشاء اقسام السوبر ماركت الخاص بك و اضافة المنتجات بالماركات و الاصناف و السمات',
          TranslationsKeys.onboardingText5:
              'ابدء الآن و أجعل محلك بين ايد الناس',
          'main device': 'الجهاز الأفتراضى',
          'language': 'اللغة',
          'rateMe': 'قيمنا',
          'theme': 'الوضع الليلى',
          'logout': 'تسجيل الخروج',
          'five_minutes': 'خمس دقائق',
          'hour': 'ساعة',
          'day': 'يوم',
          'week': 'أسبوع',
          'chooseYourLanguage': 'أختر اللغة',
          'month': 'شهر',
          "all": "أختيار الكل",
        }
      };
}
