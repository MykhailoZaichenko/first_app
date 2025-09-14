import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key, required this.title, this.nextPage});

  final String title;
  final Widget? nextPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextPage != null
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return nextPage!;
                  },
                ),
              );
            }
          : null,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Hero(
            tag: 'hero1',
            child: AspectRatio(
              aspectRatio: 1520 / 1080,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  "assets/images/login.jpg",
                  fit: BoxFit.cover,
                  color: Colors.teal,
                  colorBlendMode: BlendMode.saturation,
                ),
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
      ),
    );
  }
}
