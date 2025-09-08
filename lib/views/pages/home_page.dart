import 'package:first_app/data/constants.dart';
import 'package:first_app/views/widgets/hero_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(20.0),
      child: Column(
        children: [
          HeroWidget(title: "Flutter  menu"),
          Container(
            width: double.infinity,
            padding: EdgeInsetsGeometry.symmetric(vertical: 10.0),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to Home Page',
                      style: KTextStyle.titleTealTextStyle,
                    ),
                    Text(
                      'This is a simple hero animation demo.',
                      style: KTextStyle.descriptionTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
