import 'package:flutter/foundation.dart';

class PaymentProvider extends ChangeNotifier {

  num installmentAmount = 0;
  num calculatedInstallmentAmount = 0;
  num totalAmount = 0;

  void reset() {
     installmentAmount = 0;
     calculatedInstallmentAmount = 0;
     totalAmount = 0;
     notifyListeners();
  }

  num changeInstallmentAmount(
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
    calculatedInstallmentAmount = amount;
   notifyListeners();
    return calculatedInstallmentAmount;
  }

  num calculateInstallmentAmountInMonth({
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
    ? monthlyTotal
    : yearlyTotal;

    // print(totalLoan);
    // print(loanDuration);
    // print(interestRate);
    // print(amount);
    // print(totalAmount);

    notifyListeners();
    return installmentAmount;
  }

  num calculateTotalAmount({
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
    totalAmount = (totalLoan + amount);
    print('Total Loan: $totalLoan');
    print('Loan Duration: $loanDuration');
    print('Interest Rate: $interestRate');
    print('Amount: $amount');
    print('Calculated Installmental Amount: $calculatedInstallmentAmount');
    print('Total Amount: $totalAmount');
    notifyListeners();
    return totalAmount;
  }

  void updateInstallmentAmount(num amount) {
    installmentAmount = amount;
    notifyListeners();
  }

  void updateTotalAmount(num amount) {
    totalAmount = amount;
    notifyListeners();
  }
}
