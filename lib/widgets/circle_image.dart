import 'package:flutter/material.dart';
import 'package:flutter_elo7/constants/dimens.dart';

class CircleImage extends StatelessWidget {
  const CircleImage(this.assetName, {super.key});

  final String assetName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: ProjectSizes.circleImageSize,
        height: ProjectSizes.circleImageSize,
        child: Image(image: AssetImage(assetName)));
  }
}
