import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController controller = TextEditingController();
  bool? isChenked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;
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
          Checkbox.adaptive(
            tristate: true,
            value: isChenked,
            onChanged: (bool? value) {
              setState(() {
                isChenked = value;
              });
            },
          ),
          CheckboxListTile.adaptive(
            tristate: true,
            title: Text('Click me'),
            value: isChenked,
            onChanged: (bool? value) {
              setState(() {
                isChenked = value;
              });
            },
          ),
          Switch.adaptive(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
          ),
          SwitchListTile.adaptive(
            title: Text('Switch me'),
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
          ),
          Slider.adaptive(
            min: 0,
            max: 100,
            divisions: 10,
            value: sliderValue,
            onChanged: (double value) {
              setState(() {
                sliderValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
