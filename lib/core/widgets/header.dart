
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../constant.dart';
import '../size_config.dart';
import 'build_text.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenHeight(100),
      decoration: const BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(50),
          )),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
              ),
              color: Palette.greyColor,
            ),
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16)),
            child: const Icon(
              Iconsax.calculator5,
              color: Palette.primaryColor,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
            ),
            child: createGeneralText(
              inputText: 'Interest Rate Calculator',
              fontSize: 20,
              fontFamily: FontFamily.urbanistRegular,
              weight: FontWeight.w600,
              colorName: Palette.whiteColor,
            ),
          )
        ],
      ),
    );
  }
}