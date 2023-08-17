

import 'package:east_gtb_hackaton/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant.dart';
import '../../../../core/provider/cupertino_switch_provider.dart';
import '../../../../core/provider/interest_rate_provider.dart';
import '../../../../core/provider/payment_provider.dart';
import '../../../../core/widgets/build_text.dart';
import 'interest_rate_calculator.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(16),
              vertical: getProportionateScreenHeight(60)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                createGeneralText(
                  inputText: 'Products',
                  fontSize: 28,
                  fontFamily: FontFamily.urbanistRegular,
                  weight: FontWeight.w600,
                  colorName: Palette.blackColor,
                ),
                SizedBox(height: getProportionateScreenHeight(20),),
                createGeneralText(
                  inputText: 'More products',
                  fontSize: 20,
                  fontFamily: FontFamily.urbanistRegular,
                  weight: FontWeight.w600,
                  colorName: Palette.blackColor,
                ),

                SizedBox(height: getProportionateScreenHeight(12),),
                GestureDetector(
                  onTap: () {

                    Provider.of<CupertinoSwitchProvider>(context, listen: false).reset();
                    Provider.of<PaymentProvider>(context, listen: false).reset();
                    Provider.of<InterestRateProvider>(context, listen: false).reset();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => const InterestRateCalculator()
                    )
                    );
                  },
                    child: Image.asset('images/image 2.PNG')),
                SizedBox(height: getProportionateScreenHeight(20),),
                Image.asset('images/image 3.PNG'),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Payments extends StatelessWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: createGeneralText(
                  inputText: 'Payments',
                  fontSize: 20,
                  fontFamily: FontFamily.urbanistRegular,
                  weight: FontWeight.w600,
                  colorName: Palette.textColor1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Transfers extends StatelessWidget {
  const Transfers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: createGeneralText(
                  inputText: 'Transfers',
                  fontSize: 20,
                  fontFamily: FontFamily.urbanistRegular,
                  weight: FontWeight.w600,
                  colorName: Palette.textColor1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Investments extends StatelessWidget {
  const Investments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: createGeneralText(
                  inputText: 'Investments',
                  fontSize: 20,
                  fontFamily: FontFamily.urbanistRegular,
                  weight: FontWeight.w600,
                  colorName: Palette.textColor1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}