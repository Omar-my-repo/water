import 'package:flutter/cupertino.dart';

class LanguageProvider extends ChangeNotifier {
  String language = 'ar';

  void changeLanguage(String newLanguage) {
    language = newLanguage;
    notifyListeners();
  }
}
