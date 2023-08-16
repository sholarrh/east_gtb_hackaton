import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '../provider/cupertino_switch_provider.dart';
import '../size_config.dart';
import 'build_text.dart';

class MySwitch extends StatelessWidget {
  const MySwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var data = Provider.of<CupertinoSwitchProvider>(context);
    return Row(
      children: [
        createGeneralText(
          inputText: 'Calculate GtBank Loan Package',
          fontSize: 16,
          fontFamily: FontFamily.urbanistRegular,
          weight: FontWeight.w600,
          colorName: Palette.textColor2,
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Consumer<CupertinoSwitchProvider>(builder: (context, switchValue, child) {
          return Transform.scale(
            scaleX: 0.8,
            scaleY: 0.65,
            child: CupertinoSwitch(
              value: switchValue.showGTPackages,
              onChanged: (bool value) {
                switchValue.toggleSwitch();
              },
              activeColor: Palette.primaryColor,
              thumbColor: Palette.whiteColor,
              //trackColor: Palette.primaryColor,
            ),
          );
        }),
      ],
    );
  }
}
