import 'package:flutter/material.dart';
import 'package:flutter_elo7/constants/dimens.dart';
import 'package:flutter_elo7/constants/strings.dart';
import 'package:flutter_elo7/constants/ui_color.dart';
import 'package:flutter_elo7/widgets/circle_image.dart';

class ResultsWidget extends StatelessWidget {
  const ResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ProjectSizes.screenWidth,
        padding: const EdgeInsets.only(
            top: ProjectSizes.largePadding, bottom: ProjectSizes.largePadding),
        child: const Column(children: [
          CircleImage("assets/images/results.png"),
          Text(Strings.results),
          Text(Strings.donecInResult),
          CircleImage("assets/images/quality.png"),
          Text(Strings.lifeQuality),
          Text(Strings.donecInQuality),
          Row(
            children: [
              Text(Strings.donecInQuality),
              Icon(
                Icons.keyboard_arrow_right,
                color: UIColor.textGreen,
              )
            ],
          ),
          CircleImage("assets/images/values.png"),
          Text(Strings.lifeQuality),
          Text(Strings.donecInQuality),
        ]));
  }
}
