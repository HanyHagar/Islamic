class LanguageHelper {
  static String title(bool mode) {
    return mode ? 'إسلامي' : 'Islamic';
  }
  static String quran(bool mode) {
    return mode ? 'القرأن' : 'Quran';
  }
  static String hadiths(bool mode) {
    return mode ? 'الأحاديث' : 'Hadiths';
  }
  static String tasbeeh(bool mode) {
    return mode ? 'التسبيح' : 'Tasbeeh';
  }
  static String radio(bool mode) {
    return mode ? 'الراديو' : 'Radio';
  }
  static String settings(bool mode) {
    return mode ? 'الإعدادات' : 'Settings';
  }
  static String mode(bool mode) {
    return mode ? 'النمط' : 'Mode';
  }
  static String lang(bool mode) {
    return mode ? 'اللغة' : 'Language';
  }
  static String textMode(bool mode,bool isArabic) {
    return mode ? lightMode(isArabic) : darkMode(isArabic);
  }
  static String lightMode(bool mode) {
    return mode ? 'الوضع النهاري' : 'DAYMODE';
  }
  static String darkMode(bool mode) {
    return mode ? 'الوضع الليلي' : 'NIGHTMODE';
  }
  static String langMode(bool mode) {
    return mode ? 'العربية' : 'English';
  }
  static String tasbeehText(bool mode) {
    return mode ? 'تسبيح' : 'Tasbeeh';
  }
  static String resetText(bool mode) {
    return mode ? 'تصفير' : 'Reset';
  }

}
