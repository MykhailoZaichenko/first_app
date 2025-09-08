import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Hero(
          tag: 'hero1',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              "assets/images/login.jpg",
              color: Colors.teal,
              colorBlendMode: BlendMode.saturation,
            ),
          ),
          transitionOnUserGestures: true,
        ),
        FittedBox(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black45,
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 50.0,
            ),
          ),
        ),
      ],
    );
  }
}
