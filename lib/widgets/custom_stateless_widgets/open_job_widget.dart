import 'package:flutter/material.dart';
import 'package:flutter_elo7/constants/dimens.dart';
import 'package:flutter_elo7/constants/text_style.dart';
import 'package:flutter_elo7/constants/ui_color.dart';
import 'package:flutter_elo7/utils/extensions/string_extensions.dart';

class OpenJobWidget extends StatelessWidget {
  const OpenJobWidget(this.jobTitle, this.jobLocation, {super.key});
  final String jobTitle;
  final String jobLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
            top: ProjectSizes.smallPadding, bottom: ProjectSizes.smallPadding),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(jobTitle.capitalizeByWord(),
                textAlign: TextAlign.start,
                style: CustomTextStyle.museo(context, FontSizes.titleMedium,
                    FontWeight.w400, UIColor.textGreen)),
            const SizedBox(height: ProjectSizes.jobPadding),
            Text(jobLocation.capitalizeByWord(),
                textAlign: TextAlign.start,
                style: CustomTextStyle.museo(
                    context, FontSizes.titleMedium, FontWeight.w400)),
          ],
        ));
  }
}
