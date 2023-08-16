

import 'package:east_gtb_hackaton/core/widgets/text_fields.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../size_config.dart';
import 'build_text.dart';

class InterestRateRow extends StatelessWidget {
  const InterestRateRow({
    super.key,
    required TextEditingController rateController,
  }) : _rateController = rateController;

  final TextEditingController _rateController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            createGeneralText(
              inputText: 'Interest Rate',
              fontSize: 20,
              fontFamily: FontFamily.urbanistRegular,
              weight: FontWeight.w800,
              colorName: Palette.textColor2,
            ),
            SizedBox(
              width: getProportionateScreenWidth(5),
            ),
            Icon(
              Icons.question_mark,
              color: Palette.primaryColor,
              size: getProportionateScreenWidth(20),
            ),
          ],
        ),
        Row(
          children: [
            TextFieldTwo(
              controller: _rateController,
              hint: '',
            ),
            Container(
              height: getProportionateScreenHeight(60),
              width: getProportionateScreenWidth(80),
              color: Colors.grey,
              alignment: Alignment.center,
              child: createGeneralText(
                inputText: '%',
                fontSize: 28,
                fontFamily: FontFamily.urbanistRegular,
                weight: FontWeight.w900,
                colorName: Palette.blackColor,
              ),
            )
          ],
        )
      ],
    );
  }
}