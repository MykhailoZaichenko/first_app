import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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
          title: Text('Gym App'),
          centerTitle: true,
          leading: Icon(Icons.login),
          actions: [Text('adf'), Icon(Icons.login)],
          backgroundColor: Colors.teal,
        ),
      ),
    );
  }
}
