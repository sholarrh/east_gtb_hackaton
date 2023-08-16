

import 'package:east_gtb_hackaton/core/widgets/text_fields.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../size_config.dart';
import 'build_text.dart';

class TotalLoanRow extends StatelessWidget {
  const TotalLoanRow({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            createGeneralText(
              inputText: 'Total Loan',
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
            TextFieldOne(amountController: controller),
          ],
        )
      ],
    );
  }
}