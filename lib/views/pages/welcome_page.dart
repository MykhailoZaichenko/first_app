import 'package:first_app/views/pages/login_page.dart';
import 'package:first_app/views/widget_tree.dart';
import 'package:first_app/views/widgets/hero_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // HeroWidget(),
            Lottie.asset('assets/lotties/city.json'),
            FittedBox(
              child: Text(
                "Gym App",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 500.0,
                  letterSpacing: 50.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            FilledButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage();
                    },
                  ),
                );
              },
              style: FilledButton.styleFrom(
                minimumSize: Size(double.infinity, 50.0),
              ),
              child: const Text("Get Started"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage();
                    },
                  ),
                );
              },
              child: const Text("Log In"),
            ),
          ],
        ),
      ),
    );
  }
}
