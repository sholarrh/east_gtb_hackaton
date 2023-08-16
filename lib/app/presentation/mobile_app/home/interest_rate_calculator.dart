import 'package:east_gtb_hackaton/app/presentation/mobile_app/home/result_container.dart';
import 'package:east_gtb_hackaton/core/constant.dart';
import 'package:east_gtb_hackaton/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/provider/cupertino_switch_provider.dart';
import '../../../../core/provider/interest_rate_provider.dart';
import '../../../../core/widgets/amount_to_repay_row.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/header.dart';
import '../../../../core/widgets/interest_rate_row.dart';
import '../../../../core/widgets/loan_duration_row.dart';
import '../../../../core/widgets/loan_type_row.dart';
import '../../../../core/widgets/switch.dart';
import '../../../../core/widgets/total_loan_row.dart';

class InterestRateCalculator extends StatefulWidget {
  const InterestRateCalculator({Key? key}) : super(key: key);

  @override
  State<InterestRateCalculator> createState() => _InterestRateCalculatorState();
}

class _InterestRateCalculatorState extends State<InterestRateCalculator> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _amountToRepayController =
      TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(16),
              vertical: getProportionateScreenHeight(44),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButton(),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                const Header(),
                Container(
                  //height: getProportionateScreenHeight(600),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10),
                    vertical: getProportionateScreenHeight(24),
                  ),
                  decoration: const BoxDecoration(
                    color: Palette.whiteColor,
                  ),
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        TotalLoanRow(controller: _amountController),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        LoanDurationRow(
                          controller: _durationController,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        Consumer<InterestRateProvider>(
                            builder: (context, showRate, child) {
                          return showRate.showInterestRate
                              ? AmountToPayRow(
                                  controller: _amountToRepayController,
                                )
                              : Column(
                                  children: [
                                    const MySwitch(),
                                    SizedBox(
                                      height: getProportionateScreenHeight(10),
                                    ),
                                    Consumer<CupertinoSwitchProvider>(
                                        builder: (context, switchValue, child) {
                                      return switchValue.showGTPackages
                                          ? const LoanTypeRow()
                                          : InterestRateRow(
                                          rateController: _rateController);
                                    }),
                                  ],
                                );
                        }),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        BuildButton(
                          onPressed: () {
                            Provider.of<InterestRateProvider>(context,
                                    listen: false)
                                .toggleInterestRate();
                             setState(() {});
                          },
                          buttonText: 'VIEW INTEREST RATE',
                          containerHeight: 60,
                          containerWidth: double.infinity,
                          borderRadiusSize: 100,
                          buttonTextSize: 16,
                          buttonTextColor: Provider.of<InterestRateProvider>(
                                      context,
                                      listen: false)
                                  .showInterestRate
                              ? Palette.whiteColor
                              : Palette.primaryColor,
                          buttonColor: Provider.of<InterestRateProvider>(
                                      context,
                                      listen: false)
                                  .showInterestRate
                              ? Palette.primaryColor
                              : Palette.whiteColor,
                          borderColor: Palette.primaryColor.withOpacity(0.75),
                          buttonTextWeight: FontWeight.w700,
                          buttonTextFamily: FontFamily.urbanistRegular,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        BuildButton(
                          onPressed: () {
                            // Navigator.pop(context);
                            // Navigator.pop(context);
                            //
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => LoginScreen()),
                            // );
                          },
                          buttonText: 'CALCULATE',
                          containerHeight: 60,
                          containerWidth: double.infinity,
                          borderRadiusSize: 100,
                          buttonTextSize: 20,
                          buttonTextColor: Palette.whiteColor,
                          buttonColor: Palette.primaryColor,
                          borderColor: Colors.transparent,
                          buttonTextWeight: FontWeight.w700,
                          buttonTextFamily: FontFamily.urbanistRegular,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        const Divider(
                          color: Palette.primaryColor,
                          height: 2,
                          thickness: 2,
                        )
                      ],
                    ),
                  ),
                ),
                const ResultContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
