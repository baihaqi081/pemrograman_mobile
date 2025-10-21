import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contoh Spacer',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Contoh Spacer'),
        ),
        body: Center(
          child: Row(
            children: [
              kotakUji(Colors.amber),
              const Spacer(flex: 1),
              SizedBox(width: 100, height: 100, child: kotakUji(Colors.green)),
              const Spacer(flex: 2),
              kotakUji(Colors.blue),
            ],
          ),
        ),
      ),
    );
  }

  Container kotakUji(Color warna) {
    return Container(
      height: 75,
      width: 75,
      color: warna,
    );
  }
}
