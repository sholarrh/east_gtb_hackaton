

import 'package:flutter/material.dart';

class CupertinoSwitchProvider extends ChangeNotifier{

  bool showGTPackages = false;
  String selectedOption = 'Year(s)';
  String loanPackage = 'GT Salary Advance';
  String installmentPackage = 'Monthly Installment Amount';

  void toggleSwitch() {
    showGTPackages = !showGTPackages;
    //print(showGTPackages);
    notifyListeners();
  }

  void toggleLoanDuration(String value) {
    selectedOption = value;
    //print(selectedOption);
    notifyListeners();
  }

  void toggleLoanPackage(String value) {
    loanPackage = value;
    notifyListeners();
  }

  void toggleInstallmentPackage(String value) {
    installmentPackage = value;
    notifyListeners();
  }

  void reset() {
     showGTPackages = false;
     selectedOption = 'Year(s)';
     loanPackage = 'GT Salary Advance';
     installmentPackage = 'Monthly Installment Amount';
    notifyListeners();
  }


//Provider.of<CreateUserDetails>(context, listen: false).resetUserDetails();
}