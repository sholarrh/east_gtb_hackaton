

import 'package:flutter/cupertino.dart';

class InterestRateProvider extends ChangeNotifier{

  bool showInterestRate = false;

  void toggleInterestRate() {
    showInterestRate = !showInterestRate;
    notifyListeners();
  }

}