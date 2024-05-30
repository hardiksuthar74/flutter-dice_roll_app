import 'package:flutter/material.dart';
import 'dart:math';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

final randomizer = Random();

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.firstColor, this.secondColor, {super.key});

  final Color firstColor;
  final Color secondColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              firstColor,
              secondColor,
            ],
            begin: startAlignment,
            end: endAlignment,
          ),
        ),
        child: const Center(
          child: DiceRoller(),
        ));
  }
}

class StyleText extends StatelessWidget {
  const StyleText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.italic,
        fontSize: 28,
      ),
    );
  }
}

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var firstDiceImage = "assets/images/dice-1.png";
  var secondDiceImage = "assets/images/dice-2.png";

  void rollDice() {
    int firstRandomNumber = randomizer.nextInt(6) + 1;
    int secondRandomNumber = randomizer.nextInt(3) + 3;

    setState(() {
      firstDiceImage = "assets/images/dice-$firstRandomNumber.png";
      secondDiceImage = "assets/images/dice-$secondRandomNumber.png";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              firstDiceImage,
              width: 150,
            ),
            Image.asset(
              secondDiceImage,
              width: 150,
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: rollDice,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(
                horizontal: 30, vertical: 15), // Padding
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Rounded corners
            ),
          ),
          child: const StyleText("Roll"),
        )
      ],
    );
  }
}
