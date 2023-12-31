import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnimeTitleLanguageNotifer extends StateNotifier<String> {
  AnimeTitleLanguageNotifer() : super('ja') {
    getAnimeTitleLanguage();
  }

  bool get isEnglish => state == 'en';

  Future<void> getAnimeTitleLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final isEnglish = prefs.getBool('is_english');
    if (isEnglish != null) {
      state = isEnglish ? 'en' : 'ja';
    } else {
      state = 'ja';
    }
  }

  Future<void> toggleAnimeTitleLanguage(bool isEnglish) async {
    final prefs = await SharedPreferences.getInstance();
    if (isEnglish) {
      state = 'en';
      await prefs.setBool('is_english', true);
    } else {
      state = 'ja';
      await prefs.setBool('is_english', false);
    }
  }
}

final animeTitleLanguageProvider =
    StateNotifierProvider<AnimeTitleLanguageNotifer, String>(
  (_) => AnimeTitleLanguageNotifer(),
);
