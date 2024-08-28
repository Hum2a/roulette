import 'dart:math';

import 'package:flutter/foundation.dart';

class GameProvider with ChangeNotifier {
  int _balance = 1000;
  String _message = "Place your bet!";
  int _currentBet = 0;
  int _winningNumber = 0;

  int get balance => _balance;
  String get message => _message;

  void placeBet(int amount, int number) {
    if (amount <= _balance) {
      _balance -= amount;
      _currentBet = number;
      _message = "Bet placed on $number! Spin the wheel.";
    } else {
      _message = "Insufficient balance!";
    }
    notifyListeners();
  }

  void spinWheel() {
    _winningNumber = Random().nextInt(37); // Random number between 0 and 36
    if (_winningNumber == _currentBet) {
      _balance += 360; // Example payout (adjust based on actual game rules)
      _message = "You won! The number was $_winningNumber.";
    } else {
      _message = "You lost! The number was $_winningNumber.";
    }
    notifyListeners();
  }
}
