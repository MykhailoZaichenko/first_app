import 'package:first_app/data/constants.dart';
import 'package:first_app/data/notiers.dart';
import 'package:first_app/views/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

//statefull (can refresh)
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initThemeMode();
    super.initState();
  }

  void initThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isDarkMode = prefs.getBool(KCOnstats.themeModeKey);
    isDarkModeNotifier.value = isDarkMode ?? false; //default light mode
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: Brightness.light,
            ),
          ),
          darkTheme: ThemeData.dark(),
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: WelcomePage(),
        );
      },
    );
  }
}
