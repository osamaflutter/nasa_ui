import 'package:flutter/material.dart';
import 'package:nasa/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 32, 47, 132),
        scaffoldBackgroundColor: Color.fromARGB(255, 13, 19, 55),
      ),
    ),
  );
}
