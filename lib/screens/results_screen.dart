import 'package:flutter/material.dart';
import 'package:flutter_elo7/constants/dimens.dart';
import 'package:flutter_elo7/constants/strings.dart';
import 'package:flutter_elo7/constants/text_style.dart';
import 'package:flutter_elo7/constants/ui_color.dart';
import 'package:flutter_elo7/widgets/circle_image.dart';

class ResultsScreenWidget extends StatelessWidget {
  const ResultsScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
            top: ProjectSizes.largePadding,
            bottom: ProjectSizes.largePadding,
            left: ProjectSizes.sidePadding,
            right: ProjectSizes.sidePadding),
        child: Column(children: [
          _resultsWidget(context),
          const SizedBox(height: ProjectSizes.largePadding), //40px
          _qualityWidget(context),
          const SizedBox(height: ProjectSizes.largePadding), //40px
          _ourValues(context),
        ]));
  }

  Widget _resultsWidget(BuildContext context) {
    return Column(children: [
      const CircleImage("assets/images/results.png"),
      const SizedBox(height: ProjectSizes.smallPadding), //24px
      Text(Strings.results,
          textAlign: TextAlign.center,
          style: CustomTextStyle.museo(
              context, FontSizes.titleMedium, FontWeight.w400)),
      const SizedBox(height: ProjectSizes.smallPadding), //24px
      SizedBox(
          width: 328,
          child: Text(Strings.donecInResult,
              textAlign: TextAlign.center,
              style: CustomTextStyle.museo(context, FontSizes.bodyMedium,
                  FontWeight.w400, UIColor.textGray))),
    ]);
  }

  Widget _qualityWidget(BuildContext context) {
    return Column(children: [
      const CircleImage("assets/images/quality.png"),
      Text(Strings.lifeQuality,
          textAlign: TextAlign.center,
          style: CustomTextStyle.museo(
              context, FontSizes.titleMedium, FontWeight.w400)),
      const SizedBox(height: ProjectSizes.smallPadding), //24px
      SizedBox(
          width: 328,
          child: Text(Strings.donecInQuality,
              textAlign: TextAlign.center,
              style: CustomTextStyle.museo(context, FontSizes.bodyMedium,
                  FontWeight.w400, UIColor.textGray))),
      const SizedBox(height: ProjectSizes.smallPadding), //24px
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(Strings.dignissim,
              textAlign: TextAlign.center,
              style: CustomTextStyle.museo(context, FontSizes.bodyMedium,
                  FontWeight.w400, UIColor.textGreen)),
          const Icon(
            Icons.keyboard_arrow_right,
            color: UIColor.textGreen,
          )
        ],
      )
    ]);
  }

  Widget _ourValues(BuildContext context) {
    return Column(children: [
      const CircleImage("assets/images/values.png"),
      const SizedBox(height: ProjectSizes.smallPadding), //24px
      Text(Strings.ourValues,
          textAlign: TextAlign.center,
          style: CustomTextStyle.museo(
              context, FontSizes.titleMedium, FontWeight.w400)),

      const SizedBox(height: ProjectSizes.smallPadding), //24px
      SizedBox(
          width: 328,
          child: Text(Strings.doneInValues,
              textAlign: TextAlign.center,
              style: CustomTextStyle.museo(context, FontSizes.bodyMedium,
                  FontWeight.w400, UIColor.textGray)))
    ]);
  }
}
