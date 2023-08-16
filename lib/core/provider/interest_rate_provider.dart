

import 'package:flutter/cupertino.dart';

class InterestRateProvider extends ChangeNotifier{

  bool showInterestRate = false;
  num rate = 0;

  void toggleInterestRate() {
    showInterestRate = !showInterestRate;
    notifyListeners();
  }

  void updatingRate(num number) {
    rate = number;
    notifyListeners();
  }

}