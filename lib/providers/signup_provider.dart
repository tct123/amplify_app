// lib/providers/signup_provider.dart
import 'package:flutter/material.dart';

class SignupProvider with ChangeNotifier {
  int currentStep = 1;
  Map<String, dynamic> userData = {};

  void nextStep() {
    if (currentStep < 3) {
      currentStep++;
      notifyListeners();
    }
  }

  void addData(Map<String, dynamic> data) {
    userData.addAll(data);
    notifyListeners();
  }
}
