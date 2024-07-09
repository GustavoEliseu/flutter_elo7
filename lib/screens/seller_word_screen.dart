import 'package:flutter/material.dart';
import 'package:flutter_elo7/constants/dimens.dart';
import 'package:flutter_elo7/constants/strings.dart';
import 'package:flutter_elo7/constants/text_style.dart';
import 'package:flutter_elo7/constants/ui_color.dart';
import 'package:flutter_elo7/widgets/rounded_corners_image_widget.dart';

class SellerWordWidget extends StatelessWidget {
  const SellerWordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ProjectSizes.screenWidth,
        padding: const EdgeInsets.only(
            top: ProjectSizes.largePadding, bottom: ProjectSizes.largePadding),
        child: Column(children: [
          const RoundedBorderImage("assets/images/seller_word.jpg"),
          const SizedBox(height: ProjectSizes.largePadding),
          SizedBox(
              width: ProjectSizes.screenWidth,
              child: Text(Strings.sellerWord,
                  textAlign: TextAlign.start,
                  style: CustomTextStyle.museo(
                      context, FontSizes.bodyLarge, FontWeight.w600))),
          SizedBox(
              width: ProjectSizes.screenWidth,
              child: Text(Strings.sedRutrum,
                  textAlign: TextAlign.start,
                  style: CustomTextStyle.museo(context, FontSizes.bodyMedium,
                      FontWeight.w600, UIColor.textYellow))),
          const SizedBox(height: ProjectSizes.smallPadding),
          SizedBox(
              width: ProjectSizes.screenWidth,
              child: Text(Strings.donecInSeller,
                  textAlign: TextAlign.start,
                  style: CustomTextStyle.museo(
                      context, FontSizes.bodySmall, FontWeight.w400))),
        ]));
  }
}
