import 'package:flutter/foundation.dart';

class GameProvider with ChangeNotifier {
  int _balance = 1000;
  String _message = "Place your bet!";

  int get balance => _balance;
  String get message => _message;

  void placeBet(int amount) {
    if (amount <= _balance) {
      _balance -= amount;
      _message = "Bet placed! Spin the wheel.";
    } else {
      _message = "Insufficient balance!";
    }
    notifyListeners();
  }

  void spinWheel() {
    // Placeholder logic for spinning the wheel
    _balance += 200; // Assume the player wins 200
    _message = "You won 200!";
    notifyListeners();
  }
}
