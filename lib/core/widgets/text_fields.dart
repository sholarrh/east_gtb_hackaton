
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

import '../constant.dart';
import '../size_config.dart';
import 'naira.dart';

class TextFieldOne extends StatelessWidget {
  const TextFieldOne({
    super.key,
    required TextEditingController amountController,
  }) : _amountController = amountController;

  final TextEditingController _amountController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(60),
      width: getProportionateScreenWidth(200),
      child: TextFormField(
        autofocus: false,
        controller: _amountController,
        keyboardType: TextInputType.number,
        cursorColor: Palette.blackColor,
        inputFormatters: [
          ThousandsFormatter(),
          FilteringTextInputFormatter.digitsOnly
        ],
        style: TextStyle(
          fontSize: getProportionateScreenWidth(24),
          fontWeight: FontWeight.w900,
          fontFamily: FontFamily.urbanistBold,
          color: Palette.blackColor,
        ),
        decoration: InputDecoration(
          prefixIconColor: Palette.primaryColor,
          prefix: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Naira(
                size: 16,
                color: Palette.primaryColor,
              ),
              SizedBox(width: getProportionateScreenWidth(3),)
            ],
          ),
          filled: true,
          fillColor: Palette.whiteColor,
          hintText: '0.00',
          hintStyle: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.w500,
            fontFamily: FontFamily.urbanistBold,
            color: Palette.textColor2,
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2,
                  color: Palette.primaryColor2)),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                width: 2,
                color: Palette.primaryColor2),
          ),
        ),
        validator: (value) =>
        value!.isEmpty ? 'Enter amount' : null,
      ),
    );
  }
}

class TextFieldTwo extends StatelessWidget {
  const TextFieldTwo({
    Key? key,
    required this.controller,
    required this.hint,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(60),
      width: getProportionateScreenWidth(120),
      child: TextFormField(
        autofocus: false,
        controller: controller,
        keyboardType: TextInputType.number,
        cursorColor: Palette.blackColor,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly
        ],
        style: TextStyle(
          fontSize: getProportionateScreenWidth(24),
          fontWeight: FontWeight.w900,
          fontFamily: FontFamily.urbanistBold,
          color: Palette.blackColor,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Palette.whiteColor,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.w500,
            fontFamily: FontFamily.urbanistBold,
            color: Palette.textColor2,
          ),
          border:  OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: Palette.primaryColor2,
              )
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Palette.primaryColor2,
            ),
          ),
        ),
        validator: (value) => value!.isEmpty
            ? 'Enter Loan Duration'
            : null,
      ),
    );
  }
}