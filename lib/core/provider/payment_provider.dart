import 'package:flutter/foundation.dart';

class PaymentProvider extends ChangeNotifier {

  String installmentAmount = '';
  String calculatedInstallmentAmount = '';
  String totalAmount = '';

  String changeInstallmentAmount(
      {required num oldAmount, required String installmentPlan}) {
   num amount = 0;

    if (installmentPlan == 'Monthly Installment Amount') {
      amount = oldAmount;
      //notifyListeners();
    }else if (installmentPlan == 'Quarterly Installment Amount') {
      amount = oldAmount * 3;
      //notifyListeners();
    }else if (installmentPlan == 'Bi-Annually Installment Amount') {
      amount = oldAmount * 6;
      //notifyListeners();
    }else if (installmentPlan == 'Annually Installment Amount') {
      amount = oldAmount * 12;
      //notifyListeners();
    }
    calculatedInstallmentAmount = amount.toString();
   notifyListeners();
    return calculatedInstallmentAmount;
  }

  String calculateInstallmentAmountInMonth({
    required num totalLoan,
    required num loanDuration,
    required num interestRate,
    required bool isMonth,
  }) {
    num amount = isMonth
        ? (totalLoan *
                (loanDuration / 12) *
                interestRate) /
            100
        : (totalLoan *
                loanDuration *
                interestRate) /
            100;
    num total = amount + totalLoan;
    num monthlyTotal = (total/loanDuration);
    num yearlyTotal = (total/loanDuration)/12;
    installmentAmount =
        isMonth
    ? monthlyTotal.toString()
    : yearlyTotal.toString();

    print(isMonth);
    print(totalLoan);
    print(loanDuration);
    print(interestRate);
    print(amount);
    print(installmentAmount);

   // calculateTotalAmount(installmentAmount: total2, loanDuration: loanDuration);

    notifyListeners();
    return installmentAmount;
  }

  String calculateTotalAmount({
    required num loanDuration,
    required num totalLoan,
    required num interestRate,
    required bool isMonth,
  }) {
    num amount = isMonth
        ? (totalLoan *
        (loanDuration / 12) *
        interestRate) /
        100
        : (totalLoan *
        loanDuration *
        interestRate) /
        100;
    totalAmount = (totalLoan + amount).toString();
    // print(totalLoan);
    // print(loanDuration);
    // print(interestRate);
    // print(amount);
    // print(totalAmount);
    notifyListeners();
    return totalAmount;
  }

  void updateInstallmentAmount(num amount) {
    installmentAmount = amount.toString();
    notifyListeners();
  }

  void updateTotalAmount(num amount) {
    totalAmount = amount.toString();
    notifyListeners();
  }
}
