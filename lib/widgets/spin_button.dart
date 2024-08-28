import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';

class SpinButton extends StatelessWidget {
  final int betNumber; // Add this to specify the number

  const SpinButton({Key? key, required this.betNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);

    return ElevatedButton(
      onPressed: () {
        // Provide both the bet amount and the number
        gameProvider.placeBet(100 as String, betNumber);
      },
      child: const Text('Place Bet'),
    );
  }
}
