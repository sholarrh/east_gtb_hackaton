
import 'package:flutter/material.dart';

import '../size_config.dart';

Text createGeneralText({
  required String inputText,
  required double fontSize,
  required FontWeight weight,
  required Color colorName,
  required String fontFamily,
  bool? softWrap,
  double letterSpacing = 0.0,
  TextAlign? textAlign,
}) {
  return Text(
    inputText,
    textAlign: textAlign,
    softWrap: softWrap,
    style: TextStyle(
        fontFamily: fontFamily,
        letterSpacing: getProportionateScreenWidth(letterSpacing),
        fontSize: getProportionateScreenWidth(fontSize),
        fontWeight: weight,
        color: colorName),
  );
}
