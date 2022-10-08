import 'package:find_house/theme.dart';
import 'package:flutter/material.dart';

import '../modals/tips.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;

  TipsCard(this.tips);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80,
          width: 80,
          child: Image.asset(tips.imageUrl),
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.name,
              style: blackTextStyle.copyWith(fontSize: 18),
            ),
            Text(
              tips.updateAt,
              style: greyTextStyle.copyWith(fontSize: 14),
            )
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.chevron_right),
          color: greyColor,
        )
      ],
    );
  }
}
