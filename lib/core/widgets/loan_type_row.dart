import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '../provider/cupertino_switch_provider.dart';
import '../size_config.dart';
import 'build_text.dart';

class LoanTypeRow extends StatefulWidget {
  const LoanTypeRow({Key? key}) : super(key: key);

  @override
  State<LoanTypeRow> createState() => _LoanTypeRowState();
}

class _LoanTypeRowState extends State<LoanTypeRow> {
  final List<String> items = <String>[
    'GT Salary Advance',
     'GTBank School Fees Advance',
    'QuickCredit',
    'Max Advance',
    'Max Plans',
    'Compact Advance',
    'GT Mortgage',
    'Premium Advance',
    'Travel Advance',
    'Vehicle Insurance Premium Financing',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            createGeneralText(
              inputText: 'Loan Type',
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
            value: Provider.of<CupertinoSwitchProvider>(context, listen: false).loanPackage,
            onChanged: (value) {
              Provider.of<CupertinoSwitchProvider>(context, listen: false).toggleLoanPackage(value!);
              setState(() {});
            },
            buttonStyleData: ButtonStyleData(
              height: getProportionateScreenHeight(60),
              width: getProportionateScreenWidth(200),
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Palette.greyColor,
              ),
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
              width: getProportionateScreenWidth(200),
              padding: null,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Palette.whiteColor,
              ),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all<double>(6),
                thumbVisibility: MaterialStateProperty.all<bool>(true),
              ),
            ),
            menuItemStyleData: MenuItemStyleData(
              height: getProportionateScreenHeight(56),
              padding: const EdgeInsets.only(left: 14, right: 14),
            ),
          ),
        ),
      ],
    );
  }
}
