import 'package:find_house/theme.dart';
import 'package:flutter/material.dart';

class MainFacilities extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int number;

  MainFacilities(
      {required this.imageUrl, required this.name, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            width: 32,
            height: 32,
          ),
          SizedBox(
            height: 8,
          ),
          Text.rich(TextSpan(
              text: '$number',
              style: purpleTextStyle,
              children: [TextSpan(text: ' $name', style: greyTextStyle)]))
        ],
      ),
    );
  }
}
