import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//Null Safety
String? title = 'Gym app';

//stateless
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //material app
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title!),
          centerTitle: true,
          // leading: Icon(Icons.login),
          // actions: [Text('adf'), Icon(Icons.login)],
          // backgroundColor: Colors.teal,
        ),
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          ],
          onDestinationSelected: (int value) {},
          selectedIndex: 0,
        ),
      ),
    );
  }
}
