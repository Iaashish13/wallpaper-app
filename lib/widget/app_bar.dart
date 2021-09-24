import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

const colorizeColors = [
  Colors.black87,
  Colors.blueAccent,
  Colors.purple,
  Colors.yellow,
  Colors.red,
];
const colorizedColors = [
  Colors.amber,
  Colors.red,
  Colors.blue,
  Colors.purple,
  Colors.yellow,
];

Widget appBarTitle() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      AnimatedTextKit(animatedTexts: [
        ColorizeAnimatedText(
          'Wallpapers',
          textStyle: const TextStyle(fontSize: 26, letterSpacing: 1),
          colors: colorizeColors,
        ),
      ]),
    ],
  );
}
// WavyAnimatedText('Wallpapers',
            //     speed: const Duration(milliseconds: 200),
            //     textStyle: const TextStyle(
            //       color: Colors.blueAccent,
            //       fontSize: 23,
            //       fontWeight: FontWeight.bold,