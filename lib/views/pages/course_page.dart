import 'package:flutter/material.dart';
import 'package:first_app/views/widgets/container_windget.dart';
import 'package:first_app/views/widgets/hero_widget.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  initState() {
    getData();
    super.initState();
  }

  void getData() async {
    var url = Uri.https('bored-api.appbrewery.com', '/random');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['activity'];
      print(itemCount);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

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
