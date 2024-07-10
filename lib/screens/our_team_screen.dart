import 'package:flutter/material.dart';
import 'package:flutter_elo7/constants/dimens.dart';
import 'package:flutter_elo7/constants/strings.dart';
import 'package:flutter_elo7/constants/text_style.dart';
import 'package:flutter_elo7/widgets/custom_stateless_widgets/rounded_corners_image_widget.dart';

class OurTeamWidget extends StatelessWidget {
  const OurTeamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ProjectSizes.screenWidth,
        padding: const EdgeInsets.only(
            top: ProjectSizes.largePadding,
            bottom: ProjectSizes.largePadding), //40px
        child: Column(
          children: [
            SizedBox(
                width: ProjectSizes.screenWidth, //328 px
                child: Text(Strings.meetOurTeam,
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.museo(
                        context, FontSizes.title, FontWeight.w600))),
            const SizedBox(height: ProjectSizes.mediumPadding), //32pix
            const RoundedBorderImage("assets/images/team1.jpg"),
            const SizedBox(height: ProjectSizes.smallPadding), //24pix
            const RoundedBorderImage("assets/images/team2.jpg"),
            const SizedBox(height: ProjectSizes.smallPadding), //24pix
            const RoundedBorderImage("assets/images/team3.jpg"),
            const SizedBox(height: ProjectSizes.smallPadding), //24pix
            const RoundedBorderImage("assets/images/team4.jpg"),
          ],
        ));
  }
}
