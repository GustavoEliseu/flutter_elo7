import 'package:flutter/material.dart';
import 'package:flutter_elo7/constants/dimens.dart';
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
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: FontSizes.title,
              fontFamily: 'Museo Sans',
              fontWeight: FontWeight.w700,
              color: UIColor.white,
            ),
        overflow: TextOverflow.clip,
        maxLines: 1,
      )),
    ]);
  }
}
