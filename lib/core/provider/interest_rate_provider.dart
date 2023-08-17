

import 'package:flutter/cupertino.dart';

class InterestRateProvider extends ChangeNotifier{

  bool showInterestRate = false;
  num rate = 0;
  bool showInstallmentAmount = true;
  String durationNumber = '';
  String duration = '';

  void reset() {
     showInterestRate = false;
     rate = 0;
     showInstallmentAmount = true;
    notifyListeners();
  }

  void toggleInterestRate() {
    showInterestRate = !showInterestRate;
    showInstallmentAmount = !showInstallmentAmount;
    notifyListeners();
  }

  void updatingRate(num number) {
    rate = number;
    notifyListeners();
  }

  num calculateInterestRate({
    required num loanDuration,
    required num totalLoan,
    required num totalAmount,
    required bool isMonth,
  }) {

    num amount = isMonth
        ? ((totalAmount- totalLoan) / (totalLoan *
        (loanDuration / 12) ))/12
        : (totalAmount- totalLoan)  / (totalLoan *
        loanDuration ) ;
    rate = amount * 100;
    duration = isMonth ? 'Month(s)' : 'Year(s)';
    durationNumber = loanDuration.toString();
    // print(totalLoan);
    // print(loanDuration);
    // print(interestRate);
    // print(amount);
    // print(totalAmount);
    notifyListeners();
    return rate;
  }

}