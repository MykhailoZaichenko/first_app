import 'package:flutter/material.dart';
import 'package:first_app/views/widgets/container_windget.dart';
import 'package:first_app/views/widgets/hero_widget.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeroWidget(title: "Course  menu"),
              Column(
                children: List.generate(3, (index) {
                  return ContainerWindget(
                    title: 'Course Title',
                    description: 'This is descriprion',
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
