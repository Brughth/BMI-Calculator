import 'package:bmi_calculator/pages/application_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); //
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const ApplicationScreen(),
    );
  }
}
