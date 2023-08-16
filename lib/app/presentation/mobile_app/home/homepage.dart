

import 'package:east_gtb_hackaton/core/constant.dart';
import 'package:east_gtb_hackaton/core/size_config.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(24)
          ),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/homepage.PNG'),
                  //fit: BoxFit.cover
              )
          ),
        ),
      ),
    );
  }
}

// DropdownButtonHideUnderline(
// child: DropdownButton2(
// isExpanded: true,
// hint: Row(
// children: const [
// Expanded(
// child: Text(
// 'select',
// style: TextStyle(
// fontFamily: FontFamily.outfitRegular,
// fontSize: 16,
// fontWeight: FontWeight.w400,
// color: Palette.backgroundColor
// ),
// ),
// ),
// ],
// ),
// items: items
//     .map((item) => DropdownMenuItem<String>(
// value: item,
// child: Text(
// item,
// style: const TextStyle(
// fontFamily: FontFamily.outfitRegular,
// fontSize: 16,
// fontWeight: FontWeight.w400,
// color: Palette.backgroundColor
// ),
// overflow: TextOverflow.ellipsis,
// ),
// ))
//     .toList(),
// value: selectedValue,
// onChanged: (value) {
// setState(() {
// selectedValue = value as String;
// });
// },
// buttonStyleData: ButtonStyleData(
// height: getProportionateScreenHeight(60),
// width: double.infinity,
// padding: const EdgeInsets.only(left: 10, right: 10),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: Colors.white,
// ),
// ),
// iconStyleData: const IconStyleData(
// icon: Icon(
// Icons.keyboard_arrow_down_sharp,
// ),
// iconSize: 14,
// iconEnabledColor: Colors.black,
// iconDisabledColor: Colors.grey,
// ),
// dropdownStyleData: DropdownStyleData(
// maxHeight: getProportionateScreenHeight(200),
// width: getProportionateScreenWidth(300),
// padding: null,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(14),
// color: Colors.white,
// ),
// scrollbarTheme: ScrollbarThemeData(
// radius: const Radius.circular(40),
// thickness: MaterialStateProperty.all<double>(6),
// thumbVisibility: MaterialStateProperty.
// all<bool>(true),
// ),
// ),
// menuItemStyleData: MenuItemStyleData(
// height: getProportionateScreenHeight(56),
// padding: const EdgeInsets.only(left: 14, right: 14),
// ),
// ),
// ),
