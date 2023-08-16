import 'package:flutter/foundation.dart';

class PaymentProvider extends ChangeNotifier {
  String installmentAmount = '200000';
  String calculatedInstallmentAmount = '';
  String totalAmount = '';

  String changeInstallmentAmount(
      {required String oldAmount, required String installmentPlan}) {

    int amount = int.parse(oldAmount);

    if (installmentPlan == 'Monthly Installment Amount') {
      amount = amount;
      //notifyListeners();
    }
    if (installmentPlan == 'Quarterly Installment Amount') {
      amount = amount * 3;
      //notifyListeners();
    }
    if (installmentPlan == 'Bi-Annually Installment Amount') {
      amount = amount * 6;
      //notifyListeners();
    }
    if (installmentPlan == 'Annually Installment Amount') {
      amount = amount * 12;
      //notifyListeners();
    }
    calculatedInstallmentAmount = amount.toString();
   return calculatedInstallmentAmount;
  }

}
