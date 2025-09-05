import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController controller = TextEditingController();
  bool? isChenked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your name',
            ),
            onEditingComplete: () {
              setState(() {});
            },
          ),
          Text(controller.text),
          Checkbox(
            tristate: true,
            value: isChenked,
            onChanged: (bool? value) {
              setState(() {
                isChenked = value;
              });
            },
          ),
          CheckboxListTile(
            tristate: true,
            title: Text('Click me'),
            value: isChenked,
            onChanged: (bool? value) {
              setState(() {
                isChenked = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
