


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

import '../constant.dart';
import '../size_config.dart';


class CustomizedPinContainer extends StatefulWidget {
  const CustomizedPinContainer({
    Key? key,
    required this.onTap, required this.pinController,
  }) : super(key: key);

  final TextEditingController pinController;
  final void Function() onTap;

  @override
  State<CustomizedPinContainer> createState() => _CustomizedPinContainerState();
}

class _CustomizedPinContainerState extends State<CustomizedPinContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(110),
      width:getProportionateScreenWidth(306),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          color: Palette.whiteColor
      ),
      child: Padding(
        padding:  EdgeInsets.only(
            top: getProportionateScreenHeight(29),
            bottom: getProportionateScreenHeight(29),
            left: getProportionateScreenWidth(33),
            right: getProportionateScreenWidth(33)
        ),
        child: PinCodeTextField(
          blinkWhenObscuring: true,
          autovalidateMode: AutovalidateMode.disabled,
          //autoDisposeControllers: false,
          enableActiveFill: true,
          appContext: context,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (value) async {
            // setState(() {
            // });
          },
          onCompleted: (value) {
          },
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          pastedTextStyle: TextStyle(
            fontSize: getProportionateScreenWidth(24),
            fontWeight: FontWeight.bold,
            color: const Color(0xffA4A3A3),
          ),
          length: 4,
          animationType: AnimationType.slide,
          cursorColor: Palette.blackColor,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(10),
            fieldHeight: getProportionateScreenHeight(54),
            fieldWidth: getProportionateScreenWidth(54),
            activeFillColor: Palette.grey5Color,
            inactiveColor: Palette.grey5Color,
            activeColor: Palette.grey5Color,
            inactiveFillColor: Palette.grey5Color,
            selectedFillColor: Palette.grey5Color,
            selectedColor: Palette.grey5Color,
          ),
          validator: (v) {
            if (v!.length < 4) {
              return "Enter the 4 digit PIN sent to your mail";
            } else {
              return null;
            }
          },
          obscureText: true,
          controller: widget.pinController,
          beforeTextPaste: (text) {
            return true;
          },
          animationDuration: const Duration(microseconds: 300),
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}