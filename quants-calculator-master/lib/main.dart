import 'package:flutter/material.dart';
import 'package:quantscalculator/screens/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green
        )
      ),
      home: HomePage(),
    )
  )  ;
}

