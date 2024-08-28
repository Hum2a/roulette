import 'dart:math';
import 'package:flutter/foundation.dart';

class GameProvider with ChangeNotifier {
  int _balance = 1000;
  String _message = "Place your bet!";
  Map<String, int> _bets = {}; // Track bets placed (bet type, amount)

  int get balance => _balance;
  String get message => _message;

  void placeBet(String betType, int amount) {
    if (amount <= _balance) {
      _balance -= amount;
      _bets[betType] = amount;
      _message = "Bet placed on $betType! Spin the wheel.";
    } else {
      _message = "Insufficient balance!";
    }
    notifyListeners();
  }

  void spinWheel() {
    int winningNumber = Random().nextInt(37); // Random number between 0 and 36

    // Determine winnings
    _bets.forEach((betType, amount) {
      // Payout calculation logic based on bet type and winning number
    });

    _bets.clear();
    notifyListeners();
  }
}
