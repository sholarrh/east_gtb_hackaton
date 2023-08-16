

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/constant.dart';
import '../../../../core/size_config.dart';
import '../../../../core/widgets/build_text.dart';
import '../home/nav_bar.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _pinController = TextEditingController();
  final GlobalKey<FormState> _oldUserLogInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(24),
            right: getProportionateScreenWidth(24),
            top:  getProportionateScreenHeight(73)
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _oldUserLogInKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     CircleAvatar(
                      radius: getProportionateScreenWidth(50),
                      backgroundColor: Palette.whiteColor,
                      child:  Icon(
                        Icons.person,
                        color: Palette.textColor1,
                        size: getProportionateScreenWidth(40),
                      ),
                    ),

                    SizedBox(
                      height: getProportionateScreenHeight(40),
                    ),

                    createGeneralText(
                      inputText: 'Enter Password',
                      fontSize: 20,
                      fontFamily: FontFamily.urbanistRegular,
                      weight: FontWeight.w800,
                      colorName: Palette.textColor1,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(40),
                    ),

                PinCodeTextField(
                 autoFocus: true,
                  enabled: true,
                  autovalidateMode: AutovalidateMode.disabled,
                  autoDisposeControllers: false,
                  enableActiveFill: true,
                  appContext: context,
                  textStyle: const TextStyle(
                    color: Palette.primaryColor
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) async {
                  },
                  onCompleted: (value) {
                    _doLogin();
                  },
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  length: 6,
                  animationType: AnimationType.slide,
                  cursorColor: Palette.blackColor,
                  pinTheme: PinTheme(

                    shape: PinCodeFieldShape.circle,
                    fieldHeight: getProportionateScreenHeight(30),
                    fieldWidth: getProportionateScreenWidth(30),
                    activeFillColor: Palette.grey5Color,
                    inactiveColor: Palette.grey5Color,
                    activeColor: Palette.grey5Color,
                    inactiveFillColor: Palette.grey5Color,
                    selectedFillColor: Palette.grey5Color,
                    selectedColor: Palette.grey5Color,
                  ),
                  validator: (v) {
                    if (v!.length < 6) {
                      return "Enter the 6 digit PIN";
                    } else {
                      return null;
                    }
                  },
                  obscureText: true,
                  controller: _pinController,
                  beforeTextPaste: (text) {
                    return true;
                  },
                  animationDuration: const Duration(microseconds: 300),
                  keyboardType: TextInputType.number,
                ),

                    SizedBox(
                      height: getProportionateScreenHeight(300),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        createGeneralText(
                          inputText: 'Forgot Password?',
                          fontSize: 14,
                          fontFamily: FontFamily.urbanistRegular,
                          weight: FontWeight.w400,
                          colorName: Colors.red,
                        ),

                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  void _doLogin() async {
    if (_oldUserLogInKey.currentState?.validate() ?? false) {
      _oldUserLogInKey.currentState?.save();

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>
            const Nav()));
      } else {
       // Navigator.pop(context);
       //  failureTopSnackBar(
       //      context: context, message: response.message.toString());
      }
    }
  }


