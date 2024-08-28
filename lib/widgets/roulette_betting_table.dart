import 'package:flutter/material.dart';

class RouletteBettingTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Dozens Bet Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildOutsideBetButton(context, "1st 12", () {
              // Handle 1st dozen bet
            }),
            _buildOutsideBetButton(context, "2nd 12", () {
              // Handle 2nd dozen bet
            }),
            _buildOutsideBetButton(context, "3rd 12", () {
              // Handle 3rd dozen bet
            }),
          ],
        ),
        SizedBox(height: 8.0),
        
        // Number Grid
        Container(
          padding: EdgeInsets.all(8.0),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Three columns
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
            itemCount: 36, // 1 to 36 numbers
            itemBuilder: (context, index) {
              int number = index + 1;
              bool isRed = [
                1, 3, 5, 7, 9, 12, 14, 16, 18, 19, 21, 23, 25, 27, 30, 32, 34, 36
              ].contains(number);
              return _buildNumberButton(context, number, isRed);
            },
          ),
        ),

        // Column Bets
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildOutsideBetButton(context, "1st Column", () {
              // Handle 1st column bet
            }),
            _buildOutsideBetButton(context, "2nd Column", () {
              // Handle 2nd column bet
            }),
            _buildOutsideBetButton(context, "3rd Column", () {
              // Handle 3rd column bet
            }),
          ],
        ),
        SizedBox(height: 8.0),

        // Odd/Even and Red/Black Bets
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildOutsideBetButton(context, "Odd", () {
              // Handle odd bet
            }),
            _buildOutsideBetButton(context, "Even", () {
              // Handle even bet
            }),
            _buildOutsideBetButton(context, "Red", () {
              // Handle red bet
            }),
            _buildOutsideBetButton(context, "Black", () {
              // Handle black bet
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildNumberButton(BuildContext context, int number, bool isRed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: isRed ? Colors.red : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onPressed: () {
        // Handle number bet
      },
      child: Text(
        '$number',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildOutsideBetButton(BuildContext context, String label, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
