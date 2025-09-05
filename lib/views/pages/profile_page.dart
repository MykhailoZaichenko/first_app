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
  String? menuItem = 'e1';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            DropdownButton(
              value: menuItem,
              items: [
                DropdownMenuItem(value: 'e1', child: Text('ELement 1')),
                DropdownMenuItem(value: 'e2', child: Text('ELement 2')),
                DropdownMenuItem(value: 'e3', child: Text('ELement 3')),
              ],
              onChanged: (String? value) {
                setState(() {
                  menuItem = value;
                });
              },
            ),
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
            sliderValue == 0
                ? Text('Slider is at minimum')
                : sliderValue == 100
                ? Text('Slider is at maximum')
                : Text('Slider value: $sliderValue'),
            GestureDetector(
              onTap: () {
                print('Image tapped');
              },
              child: Image.asset('assets/images/bg.jpg'),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: InkWell(
                splashColor: Colors.teal,
                onTap: () {
                  print('Image tapped');
                },
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.white12,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text('Submit'),
            ),
            FilledButton(onPressed: () {}, child: Text('Submit')),
            TextButton(onPressed: () {}, child: Text('Submit')),
            OutlinedButton(onPressed: () {}, child: Text('Submit')),
            CloseButton(),
            BackButton(),
          ],
        ),
      ),
    );
  }
}
