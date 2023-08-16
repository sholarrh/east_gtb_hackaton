
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class DottedLines extends StatelessWidget {
  const DottedLines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DottedLine(
      dashLength: 5,
      dashGapLength: 2,
      lineThickness: 2,
      dashColor: Palette.primaryColor,
      dashGapColor: Palette.whiteColor,
      direction: Axis.horizontal,
      lineLength: double.infinity,
    );
  }
}

