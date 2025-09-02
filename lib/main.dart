import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//Null Safety
String? title = 'Gym app';

//stateless (can't refresh)
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
      home: MyHomePage(),
      // Scaffold(
      //   appBar: AppBar(
      //     title: Text(title!),
      //     centerTitle: true,
      //     // leading: Icon(Icons.login),
      //     // actions: [Text('adf'), Icon(Icons.login)],
      //     // backgroundColor: Colors.teal,
      //   ),
      //   bottomNavigationBar: NavigationBar(
      //     destinations: [
      //       NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
      //       NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
      //     ],
      //     onDestinationSelected: (int value) {},
      //     selectedIndex: 0,
      //   ),
      // ),
    );
  }
}

//statefull (can refresh)
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        centerTitle: true,
        // leading: Icon(Icons.login),
        // actions: [Text('adf'), Icon(Icons.login)],
        // backgroundColor: Colors.teal,
      ),
      body: currentIndex == 0
          ? Center(child: Text('1'))
          : Center(child: Text('2')),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onDestinationSelected: (int value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedIndex: currentIndex,
      ),
    );
  }
}
