import 'package:flutter/material.dart';
import 'package:flutter_elo7/constants/dimens.dart';
import 'package:flutter_elo7/constants/text_style.dart';
import 'package:flutter_elo7/constants/ui_color.dart';

class OpenJobWidget extends StatelessWidget {
  const OpenJobWidget(this.jobTitle, this.jobLocation, {super.key});
  final String jobTitle;
  final String jobLocation;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(jobTitle,
            style: CustomTextStyle.museo(context, FontSizes.titleMedium,
                FontWeight.w400, UIColor.textGreen)),
        const SizedBox(height: ProjectSizes.jobPadding),
        Text(jobLocation,
            style: CustomTextStyle.museo(
                context, FontSizes.titleMedium, FontWeight.w400)),
      ],
    );
  }
}
