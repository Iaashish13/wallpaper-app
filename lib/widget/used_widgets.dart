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
      AnimatedTextKit(
        totalRepeatCount: 4,
        animatedTexts: [
        ColorizeAnimatedText(
          'Wallpapers',
          textStyle: const TextStyle(fontSize: 26, letterSpacing: 1),
          colors: colorizeColors,
        ),
      ]),
    ],
  );
}
  SizedBox textButton(
      BuildContext context, String name, VoidCallback onPressed) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: onPressed,

        
        child: Text(
          name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 17.0,
          ),
        ),
        style: ButtonStyle(
          overlayColor:
              MaterialStateProperty.all<Color>(const Color(0xFFEBEBEB)),
        ),
      ),
      
    );
  }


