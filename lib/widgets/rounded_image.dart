import 'package:flutter/material.dart';
import 'package:flutter_elo7/constants/dimens.dart';

class RoundedBorderImage extends StatelessWidget {
  const RoundedBorderImage(this.assetName, {super.key});

  final String assetName;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: SizedBox(
          width: ProjectSizes.screenWidth,
          child: Image(image: AssetImage(assetName))),
    );
  }
}
