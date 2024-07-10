import 'package:flutter/material.dart';
import 'package:flutter_elo7/constants/dimens.dart';
import 'package:flutter_elo7/constants/text_style.dart';
import 'package:flutter_elo7/constants/ui_color.dart';

class ImageWithTextWidget extends StatelessWidget {
  const ImageWithTextWidget(this.assetName, this.imageText, {super.key});

  final String assetName;
  final String imageText;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image(image: AssetImage(assetName)),
      Center(
          child: Text(
        imageText,
        style: CustomTextStyle.museo(
            context, FontSizes.title, FontWeight.w700, UIColor.white),
        overflow: TextOverflow.clip,
        maxLines: 1,
      )),
    ]);
  }
}
