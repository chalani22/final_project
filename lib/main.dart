import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'input_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NIC Decoder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
              fontSize: 18, color: Colors.black), // Updated to bodyLarge
          bodyMedium: TextStyle(
              fontSize: 16, color: Colors.black87), // Updated to bodyMedium
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.blue[50],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          labelStyle: TextStyle(color: Colors.blue[700]),
          hintStyle: TextStyle(color: Colors.blue[500]),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      home: InputScreen(),
    );
  }
}
