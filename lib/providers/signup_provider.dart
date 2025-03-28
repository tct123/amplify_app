import 'package:flutter/material.dart';

class SignupProvider with ChangeNotifier {
  int _currentStep = 1;
  Map<String, dynamic> userData = {};

  int get currentStep => _currentStep;

  set currentStep(int value) {
    _currentStep = value;
    notifyListeners();
  }

  void addData(Map<String, dynamic> data) {
    userData.addAll(data);
    notifyListeners();
  }
}
