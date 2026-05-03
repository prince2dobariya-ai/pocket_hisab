import 'package:flutter/material.dart';
import 'package:pocket_hisab/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Khissu - Pocket Hisab', home: HomeScreen());
  }
}
