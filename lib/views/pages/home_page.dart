import 'package:first_app/data/constants.dart';
import 'package:first_app/views/pages/course_page.dart';
import 'package:first_app/views/widgets/container_windget.dart';
import 'package:first_app/views/widgets/hero_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      KValues.basicLayout1,
      KValues.description,
      KValues.fixBug,
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            HeroWidget(title: "Flutter  menu", nextPage: CoursePage()),
            SizedBox(height: 5),
            Column(
              children: List.generate(3, (index) {
                return ContainerWindget(
                  title: 'Basic Layout1',
                  description: 'This is descriprion',
                );
              }),
            ),
            ...List.generate(titles.length, (index) {
              return ContainerWindget(
                title: titles.elementAt(index),
                description: KValues.description,
              );
            }),
          ],
        ),
      ),
    );
  }
}
