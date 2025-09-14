import 'package:flutter/material.dart';

class ExtendedFlexiblePage extends StatelessWidget {
  const ExtendedFlexiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(child: Container(color: Colors.teal)),
          Expanded(flex: 2, child: Container(color: Colors.red)),
        ],
      ),
    );
  }
}
