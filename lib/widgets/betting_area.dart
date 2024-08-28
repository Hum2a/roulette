import 'package:flutter/material.dart';

class BettingArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        shrinkWrap: true,
        children: List.generate(36, (index) {
          int number = index + 1;
          bool isRed = [1, 3, 5, 7, 9, 12, 14, 16, 18, 19, 21, 23, 25, 27, 30, 32, 34, 36].contains(number);
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: isRed ? Colors.red : Colors.black,
            ),
            onPressed: () {
              // Handle bet placement
            },
            child: Text(
              '$number',
              style: TextStyle(color: Colors.white),
            ),
          );
        }),
      ),
    );
  }
}
