import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_elo7/constants/dimens.dart';
import 'package:flutter_elo7/constants/ui_color.dart';

class CustomTextStyle {
  static TextStyle? museo(BuildContext context,
      [double? fontSize, FontWeight? weight, Color? color]) {
    return Theme.of(context).textTheme.titleLarge?.copyWith(
          fontSize: fontSize ?? FontSizes.bodySmall,
          fontFamily: 'Museo Sans',
          fontWeight: weight ?? FontWeight.w400,
          color: color ?? UIColor.textBlack,
        );
  }
}
