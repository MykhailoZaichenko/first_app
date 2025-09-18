import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:first_app/data/classes/activity_class.dart';
import 'package:first_app/views/widgets/hero_widget.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late Future<Activity> futureActivity;
  bool isFirst = true;

  @override
  void initState() {
    super.initState();
    futureActivity = getData();
  }

  Future<Activity> getData() async {
    final url = Uri.https('bored-api.appbrewery.com', '/random');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Activity.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load activity');
    }
  }

  void refreshActivity() {
    setState(() {
      futureActivity = getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Activity'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFirst = !isFirst;
              });
            },
            icon: Icon(Icons.switch_access_shortcut),
          ),
        ],
      ),
      body: FutureBuilder<Activity>(
        future: futureActivity,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final activity = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 16,
              ),
              child: SingleChildScrollView(
                child: AnimatedCrossFade(
                  firstChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeroWidget(title: activity.activity),
                      const SizedBox(height: 16),
                      Text("Type: ${activity.type}"),
                      Text("Participants: ${activity.participants}"),
                      Text(
                        "Kid Friendly: ${activity.kidFriendly ? 'Yes' : 'No'}",
                      ),
                      Text("Duration: ${activity.duration}"),
                      Text("Availability: ${activity.availability}"),
                      Text("Price: \$${activity.price.toStringAsFixed(2)}"),
                      Text("Accessibility: ${activity.accessibility}"),
                      const SizedBox(height: 12),
                      InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Would open: ${activity.link}'),
                            ),
                          );
                        },
                        child: Text(
                          activity.link,
                          style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  secondChild: Center(
                    child: Image.asset('assets/images/bg.jpg'),
                  ),
                  crossFadeState: isFirst
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Duration(milliseconds: 300),
                ),
              ),
            );
          } else {
            return const Center(child: Text('No activity found.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: refreshActivity,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
