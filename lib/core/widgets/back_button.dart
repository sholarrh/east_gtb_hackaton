import 'package:flutter/material.dart';

import '../constant.dart';
import '../size_config.dart';

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back,
        color: Palette.blackColor,
        size: getProportionateScreenWidth(24),
      ),
    );
  }
}