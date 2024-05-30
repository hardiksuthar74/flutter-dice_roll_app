import 'package:dice_app/gradient_container.dart';
import 'package:flutter/material.dart';

const Color firstColor = Color.fromARGB(255, 138, 104, 218);
const Color secondColor = Color.fromARGB(255, 126, 125, 128);

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(firstColor, secondColor),
      ),
    ),
  );
}
