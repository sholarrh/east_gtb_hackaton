
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../size_config.dart';

class Naira extends StatelessWidget {
  final double size;
  final Color color;
  const Naira({
    Key? key,
    required this.size,
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'images/₦.svg',
      width: getProportionateScreenWidth(size),
      height: getProportionateScreenHeight(size),
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}