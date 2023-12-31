import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/constants/constants.dart';
import '/providers/anime_title_language_provider.dart';
import '/providers/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Padding(
        padding: Constants.defaultPadding,
        child: Column(
          children: [
            // Dark mode switch
            AppThemeSwitch(),

            SizedBox(height: 10),

            // Anime Title name switch
            AnimeTitleLanguageSwitch(),
          ],
        ),
      ),
    );
  }
}

class AppThemeSwitch extends ConsumerStatefulWidget {
  const AppThemeSwitch({super.key});

  @override
  ConsumerState<AppThemeSwitch> createState() => AppThemeSwitchState();
}

class AppThemeSwitchState extends ConsumerState<AppThemeSwitch> {
  bool isDarkMode = false;

  @override
  void initState() {
    isDarkMode = ref.read(themeProvider.notifier).isDarkMode;
    super.initState();
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool('is_dark_mode') ?? false;

    isDarkMode = !isDarkMode;

    await prefs.setBool('is_dark_mode', isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Dark Theme'),
        Consumer(
          builder: (context, ref, child) {
            return CupertinoSwitch(
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = !isDarkMode;
                  ref.read(themeProvider.notifier).toggleTheme(value);
                });
              },
            );
          },
        ),
      ],
    );
  }
}

class AnimeTitleLanguageSwitch extends ConsumerStatefulWidget {
  const AnimeTitleLanguageSwitch({super.key});

  @override
  ConsumerState<AnimeTitleLanguageSwitch> createState() =>
      AnimeTitleLanguageSwitchState();
}

class AnimeTitleLanguageSwitchState
    extends ConsumerState<AnimeTitleLanguageSwitch> {
  bool isEnglish = false;

  @override
  void initState() {
    isEnglish = ref.read(animeTitleLanguageProvider.notifier).isEnglish;
    super.initState();
  }

  Future<void> toggleAnimeTitleLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    bool isEnglish = prefs.getBool('is_english') ?? false;

    isEnglish = !isEnglish;

    await prefs.setBool('is_english', isEnglish);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Use English Names'),
        Consumer(
          builder: (context, ref, child) {
            return CupertinoSwitch(
              value: isEnglish,
              onChanged: (value) {
                setState(
                  () {
                    isEnglish = !isEnglish;
                    ref
                        .read(animeTitleLanguageProvider.notifier)
                        .toggleAnimeTitleLanguage(
                          isEnglish,
                        );
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }
}
