import 'package:first_app/views/widget_tree.dart';
import 'package:first_app/views/widgets/hero_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController(text: '123');
  TextEditingController controllerPassword = TextEditingController(text: '456');
  String confirmedEmail = '123';
  String confirmedPassword = '456';
  // @override
  // void initState() {
  //   print('inti state called');
  //   super.initState();
  // }

  @override
  dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                HeroWidget(title: widget.title),
                SizedBox(height: 20.0),
                TextField(
                  controller: controllerEmail,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintText: 'Enter username',
                    labelText: 'Username',
                  ),
                  onEditingComplete: () {
                    setState(() {});
                  },
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: controllerPassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintText: 'Enter paswsword',
                    labelText: 'Passwords',
                  ),
                  onEditingComplete: () {
                    setState(() {});
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    onLoginPressed();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50.0),
                  ),
                  child: Text(widget.title),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onLoginPressed() {
    String email = controllerEmail.text;
    String password = controllerPassword.text;
    if (confirmedEmail == email && confirmedPassword == password) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const WidgetTree();
          },
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid username or password'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
