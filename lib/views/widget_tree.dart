import 'package:first_app/data/notiers.dart';
import 'package:first_app/views/pages/home_page.dart';
import 'package:first_app/views/pages/settings_page.dart';
import 'package:flutter/material.dart';

import 'pages/profile_page.dart';
import 'widgets/navbar_widget.dart';

String? title = 'Gym app';
List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder:
                  (BuildContext context, dynamic isDarkMode, Widget? child) {
                    return Icon(
                      isDarkMode ? Icons.light_mode : Icons.dark_mode,
                    );
                  },
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage(title: 'Settings');
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (BuildContext context, dynamic selectedPage, Widget? child) {
          return pages.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
