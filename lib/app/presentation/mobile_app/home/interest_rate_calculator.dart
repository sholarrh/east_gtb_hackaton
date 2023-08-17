import 'package:east_gtb_hackaton/app/presentation/mobile_app/home/result_container.dart';
import 'package:east_gtb_hackaton/core/constant.dart';
import 'package:east_gtb_hackaton/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/provider/cupertino_switch_provider.dart';
import '../../../../core/provider/interest_rate_provider.dart';
import '../../../../core/provider/payment_provider.dart';
import '../../../../core/widgets/amount_to_repay_row.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/header.dart';
import '../../../../core/widgets/interest_rate_row.dart';
import '../../../../core/widgets/loan_duration_row.dart';
import '../../../../core/widgets/loan_type_row.dart';
import '../../../../core/widgets/snackbar.dart';
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
    var data = Provider.of<PaymentProvider>(context);
    var cupertinoData = Provider.of<CupertinoSwitchProvider>(context);
    var rateData = Provider.of<InterestRateProvider>(context);
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(8),
              right: getProportionateScreenWidth(8),
              top: getProportionateScreenHeight(1),
              bottom: getProportionateScreenHeight(40),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButton(),
                SizedBox(
                  height: getProportionateScreenHeight(5),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BuildButton(
                              onPressed: () {
                                Provider.of<InterestRateProvider>(context,
                                        listen: false)
                                    .toggleInterestRate();

                                setState(() {});
                              },
                              buttonText: Provider.of<InterestRateProvider>(
                                  context,
                                  listen: false)
                                  .showInterestRate
                              ? 'VIEW TOTAL PAYMENT'
                              : 'VIEW INTEREST RATE',
                              containerHeight: 60,
                              containerWidth: 185,
                              borderRadiusSize: 10,
                              buttonTextSize: 13,
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
                            // SizedBox(
                            //   width: getProportionateScreenHeight(10),
                            // ),
                            BuildButton(
                              onPressed: () {
                                if(rateData.showInterestRate){
                                  _rateController.text = '0';
                                }
                                if (_key.currentState?.validate() ?? false) {
                                  _key.currentState?.save();
                                  num totalLoan = num.parse(_amountController.text);
                                  num loanDuration = num.parse(_durationController.text);

                                  bool isMonth =  Provider.of<CupertinoSwitchProvider>(context, listen: false).selectedOption == 'Month(s)'
                                      ? true
                                      : false;

                                  // Do not know why they are here atm
                                  data.calculatedInstallmentAmount = data.installmentAmount;
                                  cupertinoData.installmentPackage = 'Monthly Installment Amount';

                                  if (cupertinoData.showGTPackages == false) {

                                    // Calculates the Simple interest of the loan type
                                    num interestRate = num.parse(_rateController.text);
                                    num amount = data.calculateInstallmentAmountInMonth(
                                      totalLoan: totalLoan,
                                      loanDuration:  loanDuration,
                                      interestRate: interestRate,
                                      isMonth: isMonth,
                                    );
                                    // updates the amount
                                    Provider.of<PaymentProvider>(context, listen: false).updateInstallmentAmount(amount);

                                    // Do not know why they are here atm
                                    data.calculatedInstallmentAmount = data.installmentAmount;
                                    cupertinoData.installmentPackage = 'Monthly Installment Amount';

                                    // Calculates the total amount to be repaid
                                    num totalAmount = data.calculateTotalAmount(
                                      totalLoan: totalLoan,
                                      loanDuration:  loanDuration,
                                      interestRate: interestRate,
                                      isMonth: isMonth,
                                    );
                                    // updates the Total amount  to be repaid and rate
                                    Provider.of<InterestRateProvider>(context,
                                        listen: false)
                                        .updatingRate(interestRate);
                                    Provider.of<PaymentProvider>(context, listen: false).updateTotalAmount(totalAmount);

                                    _amountController.clear();
                                    _rateController.clear();
                                    _durationController.clear();

                                  }else if (cupertinoData.showGTPackages) {

                                    // Calculates the Simple interest of the loan type
                                    num amount = data.calculateInstallmentAmountInMonth(
                                      totalLoan: totalLoan,
                                      loanDuration:  loanDuration,
                                      interestRate: rateData.rate,
                                      isMonth: isMonth,
                                    );

                                    // updates the amount
                                    Provider.of<PaymentProvider>(context, listen: false).updateInstallmentAmount(amount);

                                    num totalAmount = data.calculateTotalAmount(
                                      totalLoan: totalLoan,
                                      loanDuration:  loanDuration,
                                      interestRate: rateData.rate,
                                      isMonth: isMonth,
                                    );

                                    data.calculatedInstallmentAmount = data.installmentAmount;
                                    cupertinoData.installmentPackage = 'Monthly Installment Amount';
                                    Provider.of<PaymentProvider>(context, listen: false).updateTotalAmount(totalAmount);

                                    _amountController.clear();
                                    _rateController.clear();
                                    _durationController.clear();
                                  }

                                  if (rateData.showInterestRate) {
                                    num totalAmount = num.parse(_amountToRepayController.text);

                                    // Calculates the rate of the loan collected
                                    num rate = rateData.calculateInterestRate(
                                      totalAmount: totalAmount,
                                      totalLoan: totalLoan,
                                      loanDuration:  loanDuration,
                                      isMonth: isMonth,
                                    );
                                    data.installmentAmount = totalAmount/12;
                                    data.calculatedInstallmentAmount = data.installmentAmount;
                                    Provider.of<InterestRateProvider>(context,
                                        listen: false)
                                        .updatingRate(rate);
                                    Provider.of<PaymentProvider>(context, listen: false).updateTotalAmount(totalAmount);

                                    _amountController.clear();
                                    _amountToRepayController.clear();
                                    _durationController.clear();
                                  }
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context ) {
                                        return const ResultContainer();
                                      }
                                  );
                                } else {
                                  failureTopSnackBar(
                                    context: context,
                                    message: 'Please input the correct details',
                                  );
                                }
                                setState(() {});
                              },
                              buttonText: 'CALCULATE',
                              containerHeight: 60,
                              containerWidth: 185,
                              borderRadiusSize: 10,
                              buttonTextSize: 14,
                              buttonTextColor: Provider.of<InterestRateProvider>(
                                  context,
                                  listen: false)
                                  .showInterestRate
                                  ? Palette.primaryColor
                                  : Palette.whiteColor,
                              buttonColor: Provider.of<InterestRateProvider>(
                                  context,
                                  listen: false)
                                  .showInterestRate
                                  ? Palette.whiteColor
                                  : Palette.primaryColor,
                              borderColor: Palette.primaryColor.withOpacity(0.75),
                              buttonTextWeight: FontWeight.w700,
                              buttonTextFamily: FontFamily.urbanistRegular,
                            ),
                          ],
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

              ],
            ),
          ),
        ),
      ),
    );
  }
  // void _onCalculate () {
  //
  //
  //
  // }
}
