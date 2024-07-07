import 'package:flutter/material.dart';
import 'package:flutter_elo7/constants/dimens.dart';
import 'package:flutter_elo7/constants/strings.dart';
import 'package:flutter_elo7/constants/ui_color.dart';
import 'package:flutter_elo7/widgets/rounded_image.dart';

class OurTeamWidget extends StatelessWidget {
  const OurTeamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ProjectSizes.screenWidth,
        padding: const EdgeInsets.only(
            top: ProjectSizes.largePadding, bottom: ProjectSizes.largePadding),
        child: Column(
          children: [
            SizedBox(
                width: ProjectSizes.screenWidth,
                child: Text(Strings.meetOurTeam,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: FontSizes.title,
                          fontFamily: 'Museo Sans',
                          fontWeight: FontWeight.w600,
                          color: UIColor.textBlack,
                        ))),
            const SizedBox(height: ProjectSizes.mediumPadding),
            const RoundedBorderImage("assets/images/team1.jpg"),
            const SizedBox(height: ProjectSizes.smallPadding),
            const RoundedBorderImage("assets/images/team2.jpg"),
            const SizedBox(height: ProjectSizes.smallPadding),
            const RoundedBorderImage("assets/images/team3.jpg"),
            const SizedBox(height: ProjectSizes.smallPadding),
            const RoundedBorderImage("assets/images/team4.jpg"),
          ],
        ));
  }
}
