

import 'package:flutter/cupertino.dart';

class InterestRateProvider extends ChangeNotifier{

  bool showInterestRate = false;
  num rate = 0;

  void reset() {
     showInterestRate = false;
     rate = 0;
    notifyListeners();
  }

  void toggleInterestRate() {
    showInterestRate = !showInterestRate;
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
        ? totalAmount / (totalLoan *
        (loanDuration / 12) )
        : totalAmount / (totalLoan *
        loanDuration ) ;
    rate = amount;
    // print(totalLoan);
    // print(loanDuration);
    // print(interestRate);
    // print(amount);
    // print(totalAmount);
    notifyListeners();
    return rate;
  }

}