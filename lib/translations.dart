import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello World',
        },
        'ar_EG': {
          'hello': 'مرحبا بكم',
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
