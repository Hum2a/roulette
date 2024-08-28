import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import '../widgets/spin_button.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Spin the Wheel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SpinButton(),
            SizedBox(height: 20),
            Text('Balance: \$${gameProvider.balance}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                gameProvider.spinWheel();
              },
              child: Text('Spin'),
            ),
          ],
        ),
      ),
    );
  }
}
