import 'package:flutter/material.dart';

class ExtendedFlexiblePage extends StatelessWidget {
  const ExtendedFlexiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Expanded(
            //   child: Container(
            //     color: Colors.teal,
            //     height: 20.0,
            //     child: Text("Hello"),
            //   ),
            // ),
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
            Divider(),
            Row(
              children: [
                Flexible(
                  flex: 4,
                  child: Container(
                    color: Colors.red,
                    height: 20.0,
                    child: Text('Hello'),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.teal,
                    height: 20.0,
                    child: Text("Hello"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
