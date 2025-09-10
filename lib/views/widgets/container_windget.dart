import 'package:first_app/data/constants.dart';
import 'package:flutter/material.dart';

class ContainerWindget extends StatelessWidget {
  const ContainerWindget({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsGeometry.only(top: 10.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: KTextStyle.titleTealTextStyle),
              Text(description, style: KTextStyle.descriptionTextStyle),
            ],
          ),
        ),
      ),
    );
  }
}
