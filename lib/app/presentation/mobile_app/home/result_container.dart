import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant.dart';
import '../../../../core/provider/cupertino_switch_provider.dart';
import '../../../../core/provider/interest_rate_provider.dart';
import '../../../../core/provider/payment_provider.dart';
import '../../../../core/size_config.dart';
import '../../../../core/widgets/build_text.dart';
import '../../../../core/widgets/dotted_line.dart';
import '../../../../core/widgets/loan_duration_row.dart';
import '../../../../core/widgets/naira.dart';

class ResultContainer extends StatefulWidget {
  const ResultContainer({
    super.key,
  });

  @override
  State<ResultContainer> createState() => _ResultContainerState();
}

class _ResultContainerState extends State<ResultContainer> {

  final List<String> items = const <String>[
    'Monthly Installment Amount',
    'Quarterly Installment Amount',
    'Bi-Annually Installment Amount',
    'Annually Installment Amount',
  ];

  String package = '';

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<PaymentProvider>(context);
    var interestData = Provider.of<InterestRateProvider>(context);
    print(interestData.showInterestRate);
    return Dialog(
      child: Container(
        height: getProportionateScreenHeight(500),
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(16),
          horizontal: getProportionateScreenWidth(8),
        ),
        // decoration: BoxDecoration(
        //     color: Palette.whiteColor,
        //     border: Border.all(width: 2, color: Colors.grey),
        //     // borderRadius: const BorderRadius.only(
        //     //   topRight: Radius.circular(50),
        //     //   bottomRight: Radius.circular(50),
        //     // )
        // ),
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            interestData.showInstallmentAmount
                ? Column(
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  'Select',
                                  style: TextStyle(
                                    fontFamily: FontFamily.outfitRegular,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Palette.textColor2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontFamily: FontFamily.outfitRegular,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Palette.textColor2,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: Provider.of<CupertinoSwitchProvider>(context,
                                  listen: false)
                              .installmentPackage,
                          onChanged: (value) {
                            Provider.of<CupertinoSwitchProvider>(context,
                                    listen: false)
                                .toggleInstallmentPackage(value!);

                            package = value;

                            num amount = data.changeInstallmentAmount(
                              oldAmount: data.installmentAmount,
                              installmentPlan: package,
                            );
                            //setState(() {});
                            // data.calculatedInstallmentAmount = amount;
                          },
                          buttonStyleData: ButtonStyleData(
                            height: getProportionateScreenHeight(60),
                            width: getProportionateScreenWidth(300),
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Palette.whiteColor,
                                border:
                                    Border.all(width: 2, color: Colors.grey)),
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.keyboard_arrow_down_sharp,
                            ),
                            iconSize: 24,
                            iconEnabledColor: Palette.primaryColor,
                            iconDisabledColor: Colors.grey,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            //maxHeight: getProportionateScreenHeight(200),
                            width: getProportionateScreenWidth(250),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Palette.whiteColor,
                            ),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all<double>(6),
                              thumbVisibility:
                                  MaterialStateProperty.all<bool>(true),
                            ),
                          ),
                          menuItemStyleData: MenuItemStyleData(
                            height: getProportionateScreenHeight(56),
                            padding: const EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Naira(
                            size: 20,
                            color: Palette.primaryColor,
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(5),
                          ),
                          Consumer<PaymentProvider>(
                              builder: (context, payment, child) {
                            //print(payment.calculatedInstallmentAmount);
                            return createGeneralText(
                              inputText: formatNumberToTwoDecimalPlaces(
                                      payment.calculatedInstallmentAmount)
                                  .toString(),
                              fontSize: 20,
                              fontFamily: FontFamily.urbanistRegular,
                              weight: FontWeight.w600,
                              colorName: Palette.primaryColor,
                            );
                          }),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      const DottedLines(),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          createGeneralText(
                            inputText: 'Loan Duration',
                            fontSize: 20,
                            fontFamily: FontFamily.urbanistRegular,
                            weight: FontWeight.w800,
                            colorName: Palette.textColor2,
                          ),
                          Container(
                            width: getProportionateScreenWidth(150),
                            height: getProportionateScreenHeight(60),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Palette.greyColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: createGeneralText(
                              inputText: '${interestData.durationNumber} ${interestData.duration}',
                              fontSize: 20,
                              fontFamily: FontFamily.urbanistRegular,
                              weight: FontWeight.w600,
                              colorName: Palette.textColor2,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      const DottedLines(),
                      SizedBox(
                        height: getProportionateScreenHeight(30),
                      ),
                    ],
                  ),

            createGeneralText(
              inputText: 'Total Payment',
              fontSize: 20,
              fontFamily: FontFamily.urbanistRegular,
              weight: FontWeight.w600,
              colorName: Palette.textColor2,
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Naira(
                  size: 20,
                  color: Palette.primaryColor,
                ),
                SizedBox(
                  width: getProportionateScreenWidth(5),
                ),
                Consumer<PaymentProvider>(builder: (context, payment, child) {
                  return createGeneralText(
                    inputText:
                        formatNumberToTwoDecimalPlaces(payment.totalAmount)
                            .toString(),
                    fontSize: 20,
                    fontFamily: FontFamily.urbanistRegular,
                    weight: FontWeight.w600,
                    colorName: Palette.primaryColor,
                  );
                }),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            const DottedLines(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            createGeneralText(
              inputText: 'Interest Rate',
              fontSize: 20,
              fontFamily: FontFamily.urbanistRegular,
              weight: FontWeight.w600,
              colorName: Palette.textColor2,
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),

            Consumer<InterestRateProvider>(builder: (context, payment, child) {
              //print(payment.calculatedInstallmentAmount);
              return createGeneralText(
                inputText:
                    '${formatNumberToTwoDecimalPlaces(payment.rate).toString()} %',
                fontSize: 20,
                fontFamily: FontFamily.urbanistRegular,
                weight: FontWeight.w600,
                colorName: Palette.primaryColor,
              );
            }),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            const DottedLines(),
            //SizedBox(height: getProportionateScreenHeight(20),),
          ],
        ),
      ),
    );
  }

  String formatNumberToTwoDecimalPlaces(num number) {
    return number.toStringAsFixed(2);
  }
}
