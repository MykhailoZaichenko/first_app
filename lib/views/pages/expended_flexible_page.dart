import 'package:flutter/material.dart';

class ExtendedFlexiblePage extends StatelessWidget {
  const ExtendedFlexiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.teal,
                  height: 20.0,
                  child: Text("Hello"),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  color: Colors.red,
                  height: 20.0,
                  child: Text('Hello'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
