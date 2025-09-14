import 'dart:convert';

import 'package:first_app/data/classes/activity_class.dart';
import 'package:flutter/material.dart';
import 'package:first_app/views/widgets/hero_widget.dart';
import 'package:http/http.dart' as http;

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  initState() {
    getData();
    super.initState();
  }

  Future getData() async {
    var url = Uri.https('bored-api.appbrewery.com', '/random');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return Activity.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasData) {
            Activity activity = snapshot.data;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HeroWidget(title: activity.activity),
                    Text(activity.activity),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text('Error fetching data'));
          }
        },
      ),
    );
  }
}
