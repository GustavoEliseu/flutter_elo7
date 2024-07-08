import 'package:flutter/material.dart';
import 'package:flutter_elo7/constants/dimens.dart';
import 'package:flutter_elo7/constants/strings.dart';
import 'package:flutter_elo7/constants/text_style.dart';
import 'package:flutter_elo7/constants/ui_color.dart';
import 'package:flutter_elo7/widgets/open_job_widget.dart';

class OpenJobsScreenWidget extends StatelessWidget {
  const OpenJobsScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
            top: ProjectSizes.largePadding,
            bottom: ProjectSizes.largePadding,
            left: ProjectSizes.sidePadding,
            right: ProjectSizes.sidePadding),
        child: Column(
          children: [
            Text(Strings.openJobs,
                style: CustomTextStyle.museo(
                    context, FontSizes.title, FontWeight.w600)),
            const SizedBox(height: ProjectSizes.smallPadding),
            //SEARCH PLACEHOLDER
            Container(
                height: ProjectSizes.smallPadding,
                color: UIColor.backgroundGray), // PLACEHOLDER

            const SizedBox(height: ProjectSizes.largePadding), //40px
            Text(Strings.development,
                style: CustomTextStyle.museo(
                    context, FontSizes.bodyLarge, FontWeight.w600)),
            const SizedBox(height: ProjectSizes.mediumPadding), //32px
            /*ListView.separated(   // Commented waiting for database+bloc
                itemCount: 5,
                itemBuilder: (context, index) {
                  return OpenJobWidget();
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                }),*/

            const SizedBox(height: ProjectSizes.largePadding), //40px
          ],
        ));
  }
}
