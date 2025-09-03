import 'package:first_app/data/notiers.dart';
import 'package:first_app/views/widget_tree.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//statefull (can refresh)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: Brightness.light,
            ),
          ),
          darkTheme: ThemeData.dark(),
          themeMode: value ? ThemeMode.dark : ThemeMode.light,
          home: WidgetTree(),
        );
      },
    );
  }
}
