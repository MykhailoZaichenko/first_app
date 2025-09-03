import 'package:first_app/data/notiers.dart';
import 'package:first_app/views/pages/home_page.dart';
import 'package:first_app/views/pages/profile_page.dart';
import 'package:flutter/material.dart';

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
            icon: Icon(
              isDarkModeNotifier.value ? Icons.dark_mode : Icons.light_mode,
            ),
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
