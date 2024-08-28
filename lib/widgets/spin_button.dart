import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';

class SpinButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);

    return ElevatedButton(
      onPressed: () {
        gameProvider.placeBet(100);
      },
      child: Text('Place Bet'),
    );
  }
}
