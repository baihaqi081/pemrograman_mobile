import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const TravelGoApp());
}

class TravelGoApp extends StatelessWidget {
  const TravelGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TravelGo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}
